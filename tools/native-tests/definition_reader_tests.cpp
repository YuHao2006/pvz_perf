// Standalone Windows C++20+ test; include path: SexyAppFramework.
// No game objects, zlib, PAK files or replacement production symbols are needed.
#include "Sexy.TodLib/Definition.h"
#include "Sexy.TodLib/DefinitionCacheReader.h"
#include <array>
#include <climits>
#include <cstdio>
#include <limits>
#include <type_traits>

static_assert(kDefMapHashVisitedMax == 16);
static_assert(INT_MAX == 2147483647);
static_assert(std::is_base_of_v<std::exception, DefMapHashCapacityError>);
static_assert(std::is_final_v<DefMapHashCapacityError>);
static_assert(std::is_nothrow_constructible_v<DefMapHashCapacityError, int, int>);

namespace {
unsigned checks = 0;
struct TestFailure { int line; };

void Check(bool condition, int line)
{
    ++checks;
    if (!condition) throw TestFailure{line};
}
#define CHECK(...) Check((__VA_ARGS__), __LINE__)

template<class Action>
void ExpectCapacityError(Action action, int count)
{
    bool rejected = false;
    try { action(); }
    catch (const DefMapHashCapacityError& error)
    {
        CHECK(error.count == count);
        CHECK(error.capacity == 16);
        rejected = true;
    }
    CHECK(rejected);
}

using SavedMaps = std::array<DefMap*, 16>;
SavedMaps SaveMaps(const DefMapHashVisited& visited)
{
    SavedMaps saved{};
    for (size_t i = 0; i < saved.size(); ++i) saved[i] = visited.mMaps[i];
    return saved;
}

void VisitedCapacityAndIdentity()
{
    std::array<DefMap, 17> maps{};
    struct GuardedVisited
    {
        std::uint64_t before = 0x123456789abcdef0ULL;
        DefMapHashVisited visited{};
        std::uint64_t after = 0xfedcba9876543210ULL;
    } guarded;
    auto& visited = guarded.visited;
    CHECK(visited.mCount == 0);
    CHECK(!visited.Contains(nullptr));
    for (int i = 0; i < 17; ++i) CHECK(!visited.Contains(&maps[i]));
    for (int i = 0; i < 16; ++i)
    {
        visited.Add(&maps[i]);
        CHECK(visited.mCount == i + 1);
        for (int j = 0; j <= i; ++j) CHECK(visited.mMaps[j] == &maps[j]);
        for (int j = 0; j < 17; ++j) CHECK(visited.Contains(&maps[j]) == (j <= i));
    }
    const auto saved = SaveMaps(visited);
    ExpectCapacityError([&] { visited.Add(&maps[16]); }, 16);
    CHECK(visited.mCount == 16 && SaveMaps(visited) == saved);
    CHECK(!visited.Contains(&maps[16]));
    CHECK(guarded.before == 0x123456789abcdef0ULL);
    CHECK(guarded.after == 0xfedcba9876543210ULL);

    // Add does not deduplicate; only callers' Contains-before-Add does.
    ExpectCapacityError([&] { visited.Add(&maps[0]); }, 16);
    CHECK(visited.mCount == 16 && SaveMaps(visited) == saved);
    for (int count : {17, INT_MAX})
    {
        auto overCapacity = visited;
        overCapacity.mCount = count;
        ExpectCapacityError([&] { overCapacity.Add(&maps[16]); }, count);
        CHECK(overCapacity.mCount == count && SaveMaps(overCapacity) == saved);
    }

    DefField end{};
    DefMap first{&end, 4, nullptr};
    DefMap equalContents = first;
    DefMapHashVisited identity{};
    identity.Add(&first);
    const DefMap* const sameIdentity = &first;
    CHECK(identity.Contains(sameIdentity));
    CHECK(!identity.Contains(&equalContents));
    identity.Add(&first);
    CHECK(identity.mCount == 2 && identity.mMaps[0] == identity.mMaps[1]);
    identity.Add(&equalContents);
    CHECK(identity.mCount == 3 && identity.Contains(&equalContents));
}

struct SchemaFixture
{
    struct Record { DefinitionArrayDef arrays[2]; };
    std::array<DefMap, 17> maps{};
    std::array<std::array<DefField, 3>, 17> fields{};

    SchemaFixture()
    {
        for (size_t i = 0; i < maps.size(); ++i)
            maps[i] = {fields[i].data(), static_cast<int>(sizeof(Record)), nullptr};
    }

    void Edge(size_t parent, size_t slot, size_t child)
    {
        CHECK(parent < maps.size() && slot < 2 && child < maps.size());
        fields[parent][slot] = {static_cast<DefFieldId>(slot + 1),
            static_cast<int>(slot * sizeof(DefinitionArrayDef)), DefFieldType::DT_ARRAY, &maps[child]};
    }
};

// A driver for the real header's visit protocol, not a replacement hash or
// schema validator. Both live callers retain visits and check Contains first.
void VisitSchema(DefMap* map, DefMapHashVisited& visited)
{
    if (visited.Contains(map)) return;
    visited.Add(map);
    for (auto* field = map->mMapFields; field->mFieldType != DefFieldType::DT_INVALID; ++field)
        if (field->mFieldType == DefFieldType::DT_ARRAY)
            VisitSchema(static_cast<DefMap*>(field->mExtraData), visited);
}

void SchemaVisitContract()
{
    SchemaFixture shared;
    shared.Edge(0, 0, 1);
    shared.Edge(0, 1, 2);
    shared.Edge(1, 0, 3);
    shared.Edge(2, 0, 3);
    shared.Edge(3, 0, 1);
    DefMapHashVisited visited{};
    VisitSchema(&shared.maps[0], visited);
    CHECK(visited.mCount == 4);
    const std::array<size_t, 4> order{0, 1, 3, 2};
    for (size_t i = 0; i < order.size(); ++i) CHECK(visited.mMaps[i] == &shared.maps[order[i]]);
    const auto saved = SaveMaps(visited);
    for (size_t i = 0; i < 4; ++i) VisitSchema(&shared.maps[i], visited);
    CHECK(visited.mCount == 4 && SaveMaps(visited) == saved);

    SchemaFixture chain;
    for (size_t i = 0; i < 15; ++i) chain.Edge(i, 0, i + 1);
    chain.Edge(15, 0, 0);
    DefMapHashVisited full{};
    VisitSchema(&chain.maps[0], full);
    CHECK(full.mCount == 16);
    for (size_t i = 0; i < 16; ++i) CHECK(full.mMaps[i] == &chain.maps[i]);
    const auto fullSaved = SaveMaps(full);
    VisitSchema(&chain.maps[0], full);
    VisitSchema(&chain.maps[15], full);
    CHECK(full.mCount == 16 && SaveMaps(full) == fullSaved);
    chain.Edge(15, 0, 16);
    DefMapHashVisited overflow{};
    ExpectCapacityError([&] { VisitSchema(&chain.maps[0], overflow); }, 16);
    CHECK(overflow.mCount == 16 && SaveMaps(overflow) == fullSaved);
    CHECK(!overflow.Contains(&chain.maps[16]));

    // The limit is cumulative unique maps, not the maximum recursion depth.
    SchemaFixture branching;
    for (size_t i = 1; i < 17; ++i) branching.Edge((i - 1) / 2, (i - 1) % 2, i);
    DefMapHashVisited breadth{};
    ExpectCapacityError([&] { VisitSchema(&branching.maps[0], breadth); }, 16);
    const std::array<size_t, 16> branchOrder{0, 1, 3, 7, 15, 16, 8, 4, 9, 10, 2, 5, 11, 12, 6, 13};
    CHECK(breadth.mCount == 16 && !breadth.Contains(&branching.maps[14]));
    for (size_t i = 0; i < branchOrder.size(); ++i)
        CHECK(breadth.mMaps[i] == &branching.maps[branchOrder[i]]);
}

constexpr size_t kSizeMax = std::numeric_limits<size_t>::max();

void ReaderBounds()
{
    std::array<unsigned char, 16> payload{};
    for (size_t i = 0; i < payload.size(); ++i) payload[i] = static_cast<unsigned char>(i + 1);
    const auto* base = reinterpret_cast<const char*>(payload.data());
    for (size_t size = 0; size <= payload.size(); ++size)
        for (size_t prefix = 0; prefix <= size; ++prefix)
            for (size_t index = 0; index <= size + 2; ++index)
            {
                const size_t requested = index == size + 2 ? kSizeMax : index;
                const bool fits = requested <= size - prefix;
                DefinitionCacheReader take(payload.data(), size);
                CHECK(take.Take(prefix) == base);
                CHECK(take.mPosition == prefix && take.AtEnd() == (prefix == size));
                const auto* result = take.Take(requested);
                CHECK(result == (fits ? base + prefix : nullptr));
                CHECK(take.mPosition == (fits ? prefix + requested : prefix));
                CHECK(take.AtEnd() == (take.mPosition == size));
                CHECK(take.mError == (fits ? DefinitionReadFailure::None : DefinitionReadFailure::PayloadBounds));

                DefinitionCacheReader read(payload.data(), size);
                CHECK(read.Take(prefix) == base);
                std::array<unsigned char, 16> output{};
                output.fill(0xcc);
                const auto unchanged = output;
                CHECK(read.Read(output.data(), requested) == fits);
                CHECK(read.mPosition == (fits ? prefix + requested : prefix));
                CHECK(read.AtEnd() == (read.mPosition == size));
                CHECK(read.mError == take.mError);
                if (fits)
                {
                    for (size_t i = 0; i < output.size(); ++i)
                        CHECK(output[i] == (i < requested ? payload[prefix + i] : unchanged[i]));
                }
                else CHECK(output == unchanged);
            }
    DefinitionCacheReader empty(payload.data(), 0);
    CHECK(empty.AtEnd() && empty.Take(0) == base);
    CHECK(empty.Read(nullptr, 0) && empty.mError == DefinitionReadFailure::None);
}

void ReaderFirstError()
{
    constexpr std::array reasons{
        DefinitionReadFailure::PayloadBounds, DefinitionReadFailure::InvalidCount,
        DefinitionReadFailure::ArrayBounds, DefinitionReadFailure::AllocationSize,
        DefinitionReadFailure::Schema, DefinitionReadFailure::Field,
        DefinitionReadFailure::FieldType, DefinitionReadFailure::RecordBounds,
        DefinitionReadFailure::ElementSize, DefinitionReadFailure::ImageBinding,
        DefinitionReadFailure::FontBinding};
    const std::array<unsigned char, 1> payload{0x5a};
    for (auto first : reasons)
        for (auto second : reasons)
        {
            DefinitionCacheReader reader(payload.data(), payload.size());
            CHECK(reader.mError == DefinitionReadFailure::None && reader.mField == 0);
            reader.mField = 37;
            CHECK(!reader.Fail(first) && !reader.Fail(second));
            CHECK(reader.mError == first && reader.mPosition == 0 && reader.mField == 37);
            CHECK(reader.Take(2) == nullptr);
            size_t bytes = kSizeMax;
            CHECK(!reader.ArrayBytes(-1, 1, bytes) && bytes == kSizeMax);
            std::array<unsigned char, 2> output{0xcc, 0xcc};
            const auto unchanged = output;
            CHECK(!reader.Read(output.data(), output.size()) && output == unchanged);
            CHECK(reader.mError == first && reader.mPosition == 0 && reader.mField == 37);
            // Errors are latched, not a gate that changes later read results.
            CHECK(reader.Read(output.data(), 1) && output[0] == payload[0] && output[1] == 0xcc);
            CHECK(reader.mError == first && reader.mPosition == 1 && reader.AtEnd());
        }
}

void CheckArrayBytes(DefinitionCacheReader& reader, size_t remaining, int count, int elementSize)
{
    const size_t position = reader.mPosition;
    const bool atEnd = reader.AtEnd();
    size_t bytes = kSizeMax;
    const bool result = reader.ArrayBytes(count, elementSize, bytes);
    DefinitionReadFailure expected = DefinitionReadFailure::None;
    if (count < 0 || elementSize <= 0) expected = DefinitionReadFailure::InvalidCount;
    else
    {
        const auto product = static_cast<std::uint64_t>(count) * static_cast<std::uint64_t>(elementSize);
        if (product > remaining) expected = DefinitionReadFailure::ArrayBounds;
        else
        {
            // AllocationSize rejection publishes the computed product in the
            // existing API; InvalidCount and ArrayBounds leave output untouched.
            CHECK(bytes == product);
            if (product > INT_MAX) expected = DefinitionReadFailure::AllocationSize;
        }
    }
    CHECK(result == (expected == DefinitionReadFailure::None));
    CHECK(reader.mError == expected && reader.mPosition == position && reader.AtEnd() == atEnd);
    if (expected == DefinitionReadFailure::InvalidCount || expected == DefinitionReadFailure::ArrayBounds)
        CHECK(bytes == kSizeMax);
}

void ReaderArrayBytes()
{
    constexpr std::array counts{INT_MIN, -1, 0, 1, 2, 3, 7, 8, 9, 16, 17, INT_MAX};
    constexpr std::array elementSizes{INT_MIN, -1, 0, 1, 2, 3, 4, 7, 16, INT_MAX};
    const std::array<unsigned char, 16> payload{};
    const auto* base = reinterpret_cast<const char*>(payload.data());
    for (size_t size = 0; size <= payload.size(); ++size)
        for (size_t prefix = 0; prefix <= size; ++prefix)
            for (int count : counts)
                for (int elementSize : elementSizes)
                {
                    DefinitionCacheReader reader(payload.data(), size);
                    CHECK(reader.Take(prefix) == base);
                    CheckArrayBytes(reader, size - prefix, count, elementSize);
                }

    // Metadata-only extreme capacities: ArrayBytes never touches mData.
    // Take below is called only at position zero, so it forms only base + 0.
    // Never Read, dereference a returned range, or Take at the synthetic offset.
    constexpr size_t intMax = static_cast<size_t>(INT_MAX);
    constexpr std::array capacities{size_t{0}, size_t{1}, intMax - 1, intMax, intMax + 1, kSizeMax};
    constexpr std::array<std::array<int, 2>, 8> products{{
        {0, INT_MAX}, {1, INT_MAX}, {2, INT_MAX}, {INT_MAX, 2},
        {INT_MAX, INT_MAX}, {INT_MAX / 2, 2}, {INT_MAX / 2 + 1, 2}, {INT_MAX, 1}}};
    for (size_t capacity : capacities)
        for (const auto& factors : products)
        {
            DefinitionCacheReader reader(payload.data(), capacity);
            CheckArrayBytes(reader, capacity, factors[0], factors[1]);
        }
    for (size_t remaining : {size_t{0}, size_t{1}, size_t{8}, size_t{16}})
        for (int count : counts)
            for (int elementSize : elementSizes)
            {
                DefinitionCacheReader reader(payload.data(), kSizeMax);
                CHECK(reader.Take(kSizeMax - remaining) == base);
                CHECK(reader.mPosition == kSizeMax - remaining && reader.AtEnd() == (remaining == 0));
                CheckArrayBytes(reader, remaining, count, elementSize);
            }
}
} // namespace

int main()
{
    try
    {
        VisitedCapacityAndIdentity();
        SchemaVisitContract();
        ReaderBounds();
        ReaderFirstError();
        ReaderArrayBytes();
    }
    catch (const TestFailure& failure)
    {
        std::fprintf(stderr, "FAIL line=%d checks=%u\n", failure.line, checks);
        return 1;
    }
    catch (const DefMapHashCapacityError& error)
    {
        std::fprintf(stderr, "FAIL unexpected capacity error count=%d capacity=%d\n", error.count, error.capacity);
        return 1;
    }
    catch (...)
    {
        std::fprintf(stderr, "FAIL unexpected exception checks=%u\n", checks);
        return 1;
    }
    std::printf("PASS definition header visit contract and bounded reader checks=%u\n", checks);
    return 0;
}
