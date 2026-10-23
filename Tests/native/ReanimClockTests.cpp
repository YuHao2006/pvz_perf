#include "../../pvzPerf/Sexy.TodLib/ReanimClock.h"
#include <array>
#include <cmath>
#include <cstdio>
#include <cstdlib>
#include <random>
#include <vector>
#if defined(_MSC_VER) && defined(_M_X64)
#include <intrin.h>
#endif

using I = std::int64_t;
static void Check(bool value, const char* message)
{
    if (!value) { std::fprintf(stderr, "%s\n", message); std::abort(); }
}

static void CheckFloatingAnalytic(double actual, long double expected, const char* message)
{
    const auto tolerance = 1e-12L * std::max(1.0L, std::fabs(expected));
    Check(std::fabs(static_cast<long double>(actual) - expected) <= tolerance, message);
}

struct Position { I phase; I cycles; };
static Position Sample(I origin, I originCycles, I elapsed, float rate, I period)
{
    Position result{origin, originCycles};
    ReanimClock::Advance(result.phase, result.cycles, period, rate == 0 ? 0 : (rate > 0 ? 1 : -1), elapsed);
    return result;
}

// Deliberately nonuniform and nonmonotone keys expose frame-selection errors.
static constexpr std::array<float, 7> floatKeys{
    1.7001234f, 1.9334321f, 8.217987f, 7.1001234f, 12.9916543f, 13.3000987f, 18.3174321f};

static double FloatRoot(Position p, bool full, float scale, I period, bool clipped)
{
    const int count = int(floatKeys.size()), intervals = full ? count : count - 1;
    std::uint64_t fraction;
    const auto frame = ReanimClock::MulDiv(p.phase, intervals, period, &fraction);
    const auto before = std::min<std::size_t>(frame, floatKeys.size() - 1);
    const auto after = std::min(before + 1, floatKeys.size() - 1);
    if (!clipped)
        return ReanimClock::RootSampleFloat(count, full, period, p.cycles, floatKeys.front(),
            floatKeys[before], floatKeys[after], floatKeys.back(), fraction, scale);
    const double minimum = 50.0 * (static_cast<double>(period) / intervals / 1e9);
    double cycle = 0, prefix = 0, selected = 0;
    for (int i = 0; i < intervals; ++i)
    {
        const double delta = static_cast<double>(floatKeys[std::min(i + 1, count - 1)]) -
            static_cast<double>(floatKeys[i]);
        const double displacement = std::max(delta * count / intervals * scale, minimum);
        cycle += displacement;
        if (i < frame) prefix += displacement;
        else if (i == frame) selected = displacement;
    }
    return ReanimClock::ClippedRootSampleFloat(p.cycles, period, fraction, cycle, prefix, selected);
}

static long double AnalyticFloatRoot(Position p, bool full, float scale, I period, bool clipped)
{
    const int count = int(floatKeys.size()), intervals = full ? count : count - 1;
    const long double seconds = static_cast<long double>(period) / intervals / 1e9L;
    const long double source = static_cast<long double>(p.phase) * intervals / period;
    const int frame = int(source);
    long double cycle = 0, partial = 0;
    for (int i = 0; i < intervals; ++i)
    {
        const long double delta = static_cast<long double>(floatKeys[std::min(i + 1, count - 1)]) -
            static_cast<long double>(floatKeys[i]);
        const long double velocity = delta * count * scale / intervals / seconds;
        const long double distance = (clipped ? std::max(velocity, 50.0L) : velocity) * seconds;
        cycle += distance;
        if (i < frame) partial += distance;
        else if (i == frame) partial += distance * (source - frame);
    }
    return p.cycles * cycle + partial;
}

static std::vector<I> Partition(I total, int hz, bool random)
{
    std::vector<I> pieces;
    std::mt19937_64 rng(0x730917);
    I consumed = 0;
    for (I n = 1; consumed < total; ++n)
    {
        const auto next = random ? std::min(total, consumed + I(rng() % 71'000'003 + 1)) :
            std::min(total, n * 1'000'000'000 / hz);
        pieces.push_back(next - consumed);
        consumed = next;
    }
    return pieces;
}

int main()
{
    constexpr I defaultPeriod = floatKeys.size() * 1'000'000'000LL;
    const std::array<int, 8> frequencies{30, 60, 100, 144, 200, 240, 1000, 0};
    for (const float rate : {0.0f, 13.3072289f, -13.3072289f, 700.001f, 0.00013072289f})
    for (const int frequency : frequencies)
    {
        const I period = rate == 0 ? defaultPeriod : ReanimClock::PeriodFromRate(int(floatKeys.size()), rate);
        const I origin = period * 337 / 1000;
        constexpr I total = 13'781'234'567LL;
        const auto pieces = Partition(total, frequency, frequency == 0);
        I elapsed = 0, events = 0;
        auto previous = Sample(origin, -3, 0, rate, period);
        for (const I dt : pieces)
        {
            // Only time accumulates; each evaluation starts from the same origin.
            elapsed += dt;
            const auto current = Sample(origin, -3, elapsed, rate, period);
            events += ReanimClock::EventCount(previous.phase, previous.cycles,
                current.phase, current.cycles, period, period * 2 / 5);
            previous = current;
        }
        const auto expected = Sample(origin, -3, total, rate, period);
        Check(previous.phase == expected.phase && previous.cycles == expected.cycles,
            "elapsed sample depends on partition");
        Check(events == ReanimClock::EventCount(origin, -3, expected.phase, expected.cycles, period, period * 2 / 5),
            "event multiplicity depends on partition");
    }
    // Last-frame hold is stationary, while the cycle displacement remains exact.
    Check(FloatRoot({defaultPeriod - 1'000'000'000, 0}, true, 1.0f, defaultPeriod, false) ==
          FloatRoot({defaultPeriod - 1, 0}, true, 1.0f, defaultPeriod, false), "full-last frame does not hold");
    // Wide multiplication has an independently known quotient and remainder.
    std::uint64_t rem = 0;
    Check(ReanimClock::MulDiv(UINT64_MAX, UINT64_MAX, UINT64_MAX, &rem) == UINT64_MAX && rem == 0,
        "wide multiplication/division failed");
#if defined(_MSC_VER) && defined(_M_X64)
    std::mt19937_64 wideRandom(0x5941219);
    for (int i = 0; i < 20000; ++i)
    {
        const auto a = wideRandom(), b = wideRandom();
        std::uint64_t high, expectedRemainder;
        const auto low = _umul128(a, b, &high);
        const auto divisor = high + 1 + wideRandom() % (UINT64_MAX - high);
        const auto expected = _udiv128(high, low, divisor, &expectedRemainder);
        Check(ReanimClock::MulDiv(a, b, divisor, &rem) == expected && rem == expectedRemainder,
            "portable wide arithmetic disagrees with independent native intrinsics");
    }
#endif
    Check(ReanimClock::SignedMulDiv(-9, 5, 7) == -6, "signed output must truncate toward zero");
    constexpr I period = defaultPeriod;
    // Absolute epochs must disappear from the sampled phase and root. Keep an
    // independent Euclidean quotient oracle instead of calling Advance here.
    constexpr I epoch = 123'456'789'012'345;
    for (const int direction : {-1, 0, 1})
    for (const I origin : {I(0), period * 337 / 1000, period})
    for (const I elapsed : {I(0), I(1), period - 1, period, period * 19 + 37})
    {
        I phase, cycles;
        ReanimClock::SampleAt(epoch + elapsed, epoch, origin, -3, period,
            direction, phase, cycles);
        I expectedPhase = origin, expectedCycles = -3;
        if (direction && elapsed)
        {
            const I unwrapped = origin + direction * elapsed;
            I quotient = unwrapped / period;
            if (unwrapped % period < 0) --quotient;
            expectedPhase = unwrapped - quotient * period;
            expectedCycles += quotient;
        }
        Check(phase == expectedPhase && cycles == expectedCycles,
            "absolute epoch sampling disagrees with Euclidean phase oracle");
        I rebasedPhase, rebasedCycles;
        constexpr I newEpoch = 987'654'321;
        ReanimClock::SampleAt(newEpoch + elapsed, newEpoch, origin, -3, period,
            direction, rebasedPhase, rebasedCycles);
        Check(rebasedPhase == phase && rebasedCycles == cycles,
            "save epoch relocation changed playback");
        I normalizedOrigin;
        const auto normalizedStart = ReanimClock::StartTimeAt(epoch + elapsed,
            phase, period, direction, normalizedOrigin);
        Check(normalizedStart <= epoch + elapsed,
            "historical phase normalization moved the start into the future");
        I normalizedPhase, normalizedCycles;
        ReanimClock::SampleAt(epoch + elapsed + period * 3 + 17, normalizedStart,
            normalizedOrigin, cycles, period, direction, normalizedPhase, normalizedCycles);
        I continuedPhase, continuedCycles;
        ReanimClock::SampleAt(epoch + elapsed + period * 3 + 17, epoch, origin,
            -3, period, direction, continuedPhase, continuedCycles);
        Check(normalizedPhase == continuedPhase && normalizedCycles == continuedCycles,
            "historical arbitrary-origin normalization changed playback continuation");
    }
    for (const int direction : {-1, 0, 1})
    for (const I phase : {I(0), I(1), period * 337 / 1000, period - 1, period})
    {
        I origin;
        const auto start = ReanimClock::StartTimeAt(epoch, phase, period, direction, origin);
        I sampledPhase, sampledCycles;
        ReanimClock::SampleAt(epoch, start, origin, 7, period, direction,
            sampledPhase, sampledCycles);
        Check(sampledPhase == phase && sampledCycles == 7,
            "phase-zero timestamp changed the current phase or cycles");
        for (const int frequency : frequencies)
        {
            I now = epoch, partitionedStart = start, partitionedOrigin = origin, cycles = 7;
            for (const I dt : Partition(period * 11 + 173, frequency, frequency == 0))
            {
                now += dt;
                ReanimClock::SampleAt(now, partitionedStart, partitionedOrigin, cycles,
                    period, direction, sampledPhase, sampledCycles);
                partitionedStart = ReanimClock::StartTimeAt(now, sampledPhase, period,
                    direction, partitionedOrigin);
                cycles = sampledCycles;
            }
            I directPhase, directCycles;
            ReanimClock::SampleAt(now, start, origin, 7, period, direction,
                directPhase, directCycles);
            Check(sampledPhase == directPhase && sampledCycles == directCycles,
                "absolute timestamp rebasing depends on update partition");
        }
    }
    I slowOrigin, fastOrigin;
    const auto oldPhase = period * 337 / 1000;
    const auto slowStart = ReanimClock::StartTimeAt(epoch, oldPhase * 2, period * 2, 1, slowOrigin);
    const auto fastStart = ReanimClock::StartTimeAt(epoch, oldPhase / 2, period / 2, 1, fastOrigin);
    Check(slowStart < epoch - oldPhase && fastStart > epoch - oldPhase,
        "rate changes did not move the logical start timestamp");
    I battlePhase, battleCycles, visualPhase, visualCycles;
    ReanimClock::SampleAt(epoch, epoch, 0, 0, period, 1, battlePhase, battleCycles);
    ReanimClock::SampleAt(epoch + period + 41, epoch, 0, 0, period, 1, visualPhase, visualCycles);
    Check(battlePhase == 0 && battleCycles == 0 && visualPhase == 41 && visualCycles == 1,
        "a frozen battle clock prevented visual playback");
    Check(ReanimClock::EventCount(0, 0, 0, 19, period, 0) == 19,
        "forward multiple periods lost events");
    Check(ReanimClock::EventCount(0, 0, 0, -19, period, 0) == -19,
        "reverse multiple periods lost events");
    Check(ReanimClock::EventCount(period / 2, 0, period / 2, 0, period, period / 2) == 0,
        "pause retriggered an event");
    Check(ReanimClock::EventCount(period / 2, 0, period / 2 + 1, 0, period, period / 2) == 1,
        "forward interval must include previous boundary");
    Check(ReanimClock::EventCount(period / 2 + 1, 0, period / 2, 0, period, period / 2) == 0,
        "reverse interval must exclude current boundary");
    const auto endpointReverse = Sample(period, 0, period, -1, period);
    Check(endpointReverse.phase == 0 && endpointReverse.cycles == 0,
        "reverse playback from held end did not normalize an exact whole period");
    const auto endpointPaused = Sample(period, 0, period, 0, period);
    Check(endpointPaused.phase == period && endpointPaused.cycles == 0,
        "paused held endpoint was normalized away");
    // Rate switches rebase one exact integer position; subsequent partitions agree.
    const I firstPeriod = ReanimClock::PeriodFromRate(int(floatKeys.size()), 13.3072289f);
    const I secondPeriod = ReanimClock::PeriodFromRate(int(floatKeys.size()), 13.3072289f * 0.5f);
    auto switched = Sample(firstPeriod * 337 / 1000, 0, 1'000'000'007, 13.3072289f, firstPeriod);
    switched.phase = ReanimClock::SignedMulDiv(switched.phase, secondPeriod, firstPeriod);
    auto final = Sample(switched.phase, switched.cycles, 8'000'000'003LL, -6.65361445f, secondPeriod);
    I continuationElapsed = 0;
    for (I dt : Partition(8'000'000'003LL, 144, false)) continuationElapsed += dt;
    auto continued = Sample(switched.phase, switched.cycles, continuationElapsed, -6.65361445f, secondPeriod);
    Check(final.phase == continued.phase && final.cycles == continued.cycles,
        "rate-switch continuation depends on partition");
    Check(switched.phase * firstPeriod <=
        Sample(firstPeriod * 337 / 1000, 0, 1'000'000'007, 13.3072289f, firstPeriod).phase * secondPeriod,
        "rate switch advanced the original phase");
    auto paused = Sample(switched.phase, switched.cycles, 9'000'000'000, 0, secondPeriod);
    Check(paused.phase == switched.phase && paused.cycles == switched.cycles,
        "pause changed phase");
    auto flipped = Sample(paused.phase, paused.cycles, 0, 6.65361445f, secondPeriod);
    Check(flipped.phase == paused.phase && flipped.cycles == paused.cycles,
        "direction change reset phase");
    for (const bool full : {false, true})
    for (const bool clipped : {false, true})
    for (const float rate : {13.3072289f, -13.3072289f, 700.001f})
    for (const float scale : {1.0f, -1.317f, 15.0f, 1.3072289f})
    for (const int frequency : frequencies)
    {
        const auto floatPeriod = ReanimClock::PeriodFromRate(int(floatKeys.size()), rate);
        const I floatOrigin = floatPeriod * 337 / 1000;
        constexpr I total = 2'781'234'567;
        I elapsed = 0;
        const auto initial = Sample(floatOrigin, -3, 0, rate, floatPeriod);
        constexpr double anchor = 42.123456789;
        const double originRoot = FloatRoot(initial, full, scale, floatPeriod, clipped);
        double worldPosition = anchor;
        for (const auto dt : Partition(total, frequency, frequency == 0))
        {
            elapsed += dt;
            const auto current = Sample(floatOrigin, -3, elapsed, rate, floatPeriod);
            worldPosition = anchor + (FloatRoot(current, full, scale, floatPeriod, clipped) - originRoot);
            CheckFloatingAnalytic(FloatRoot(current, full, scale, floatPeriod, clipped),
                AnalyticFloatRoot(current, full, scale, floatPeriod, clipped),
                "floating source root differs from independent source velocity integral");
        }
        const auto expected = Sample(floatOrigin, -3, total, rate, floatPeriod);
        Check(worldPosition == anchor + (FloatRoot(expected, full, scale, floatPeriod, clipped) - originRoot),
            "floating source root depends on update partition");
    }
    const auto tinyRoot = ReanimClock::RootSampleFloat(2, false, 1'000'000'000, 0,
        0.0001234f, 0.0001234f, 0.0009876f, 0.0009876f, 1, 1.0f);
    Check(tinyRoot > 0 && tinyRoot < 0.001, "root sample truncated fractional pixel output");
    const auto fractionalCycles = ReanimClock::RootSampleFloat(2, false, 1'000'000'000, 3,
        0.0001234f, 0.0001234f, 0.0009876f, 0.0009876f, 0, 1.0f);
    CheckFloatingAnalytic(fractionalCycles,
        (static_cast<long double>(0.0009876f) - 0.0001234f) * 6,
        "floating source endpoints were prequantized before cycle sampling");
    Check(std::fabs(ReanimClock::ClippedRootSampleFloat(1, 1'000'000'000,
        500'000'000, 0.25, 0.1, 0.125) - 0.4125) < 1e-15,
        "clipped root sample truncated fractional pixel output");
    bool overflow = false;
    try { (void)ReanimClock::MulDiv(UINT64_MAX, UINT64_MAX, 1); }
    catch (const std::overflow_error&) { overflow = true; }
    Check(overflow, "wide quotient overflow was not checked");
    for (const float invalidRate : {std::numeric_limits<float>::infinity(),
        std::numeric_limits<float>::quiet_NaN(), 1e-30f, 1e30f})
    {
        bool rejected = false;
        try { (void)ReanimClock::PeriodFromRate(7, invalidRate); }
        catch (const std::overflow_error&) { rejected = true; }
        Check(rejected, "nonfinite or unrepresentable playback period was accepted");
    }
    std::puts("reanim absolute clock, floating roots, and event partition tests passed");
}
