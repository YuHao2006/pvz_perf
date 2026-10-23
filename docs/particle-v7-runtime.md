# Particle v7 runtime and actor coordinate boundary

The 24-byte v7 particle definition node contains an `int32_t` time numerator
and denominator, ordinary `float` low/high values, and `int32_t` curve and
distribution IDs. Omitted node times retain their reduced rational fraction.
Ordinary source decimals retain float precision without thousandth
quantization; evaluated values are not written back into definitions.

Particle systems update once per main logic step with the actual integer
nanosecond interval. There is no private 100 Hz loop, pending time remainder,
or hidden full update at birth. Existing particles receive one field pass and
one physics integration; system fields sample the main-step endpoint. Position,
velocity and rotation remain ordinary floating-point physics state.

Authored duration values still use a fixed 10,000,000 ns source unit, independent
of the selected logic frequency. Authored spawn and animation rates are per
second. Stored velocity and collision spin velocity retain their source-unit
representation; displacement and rotation multiply them by deltaNs/10,000,000.
Acceleration, velocity, attractor, circle and away fields scale their increments
by the same interval ratio. Friction applies pow(max(0, 1-f), deltaRatio).
Friction f=1 preserves velocity at zero interval and stops it at any positive
interval. Custom values above one stop motion rather than flipping velocity;
the shipped definitions use values in [0,1]. Bounds and collision reflection
remain instantaneous constraints. Position/angle offsets and shake replace the
previous sampled offset without multiplying that offset by elapsed time.

Lifetime and previous lifetime samples are saved integer nanoseconds. A
normalized lifetime is ageNs/max(1,durationNs), computed temporarily as a
double. It never subtracts a source tick or the current interval. Fractional authored durations
are retained as nanoseconds rather than truncated to whole legacy ticks.
Particles die at the duration boundary. Looping particle and emitter ages keep
the excess nanoseconds with modulo. Random initial particle ages are selected
directly in nanoseconds rather than projected onto legacy ticks.

Spawning retains a signed integer remainder in 10^12 units per particle.
A single-node constant rate computes the difference of exact total-time
integrals from the binary float rate and integer active emission time. Its
total requested emission therefore depends on accumulated nanoseconds and the
saved remainder, independently of partition, before existing active/launched
limits and pool capacity are applied. The separate emission clock does not
reset when the emitter lifetime loops. Nonloop emission clips to the remaining
system duration; a fading-out source also clips to its remaining fade time and
cannot resume emission after the fade ends. Varying rate curves sample once at
the main-step endpoint and integrate that sample over the active interval,
rounding once to the remainder scale.

Births and OnDuration crossfade events occur at the main-step endpoint, so
event detection can be delayed by up to one main step relative to continuous
time. A new target starts at age zero without a recursive residual update.
The system snapshots existing particle identities before updating any emitter,
including targets in already existing emitters, so a birth cannot accidentally
receive the same main step's full interval. Duration-clamped crossfade sources
still receive the main step's one physics sample while they remain visible.
Variable forces, collision, shake, crossfade events, random birth trajectories
and varying-rate sampled integrals can depend on the main-step partition.
Exact continuous event timing and bit-identical trajectories across logic
frequencies are not part of this model.

Each system owns its saved random stream. Initial system creation takes one
global seed; logic steps and births consume only that local stream.
Particle shake hashes a saved birth seed and integer sample age, without
addresses, `srand`, or global `rand` state.

For a constant authored image animation rate, image phase is derived from
the exact binary float rate and integer elapsed nanoseconds, modulo 10^12,
plus a fixed initial phase anchor. Integer multiplication, shifts and modulo
retain phase precision even when elapsed time exceeds double's 53-bit integer
range. The initial anchor supports legacy-save migration. Constant-rate
animation never accumulates phase increments. Varying-rate curves use a
separate integer sampled integral scaled by the actual interval. Animation elapsed time is
independent of lifetime so random initial ages and particle lifetime loops
do not restart image animation.

`SystemMove` supplies a held external input event. The next positive unpaused
main step samples that target and moves following particles once. A caller that
has a discontinuity at a known integer time must split `Update(deltaNs)` at
that event time.
Sampling an arbitrary moving attachment only once per outer frame supplies
different input events at different frame rates; the particle simulation
cannot reconstruct the unsampled trajectory.

Zero-interval and paused system updates leave all state, held input sampling
and RNG unchanged. Drawing uses the latest main-step state without feedback
into simulation.

Plant and Zombie use a separate `FloatGameObject` base containing one public
ordinary `float` X/Y pair in pixels. Their duplicate coordinate caches are
removed. Integer collision and pixel APIs convert at their existing API
boundaries. Other GameObject-derived types retain their integer pixel layout.

Their compact root binding stores a double world/source offset, playback
generation and ordinary float scale. X is evaluated as that offset plus
`RootMotion` at the
requested integer time. Position writes and body-instance changes invalidate
the binding. Bowling samples horizontal root position at row-arrival event
times and at the main-step endpoint. Vertical movement is evaluated from its
saved target-row arrival time at 200 pixels/second, without a private 100 Hz
clock. Giant wallnut collision is checked once per main step with one million
direct damage. Special velocity paths keep
integer elapsed time from a double origin and float rate, rebasing at changes
of rate or external position writes. Constant velocity never feeds a rounded
position into the next step. Root and additional linear movement are sampled
from independent anchors. The ladder action records its extra horizontal
speed for the same update's position pass, preserving the final ladder tick;
it does not accumulate into the root origin. Zombie's former duplicate float
position members are removed.

Reanimations sample shared Visual or Battle timestamps. The application
publishes Visual time once at the start of an unpaused update. The Board
publishes Battle time before effects and actors, advancing it only during
playing/upsell updates without time stop. Actor root endpoints sample the
published current time; bowling collision events sample negative offsets
within the current update. Attached animations inherit their owner's domain.
Free effects remain Visual, including sleeping and mowered effects that
historically continue through battle time stop. Intro actors that actively
update use Visual; inactive board actors stay on the stopped Battle clock.
Particle effects retain their own local pause behavior.

The production particle fixture checks constant-rate emission totals across
30, 60, 100, 144, 200, 240 and 1000 Hz plus randomized nanosecond partitions.
It also executes sub-10ms movement, one-pass nonlinear fields, friction,
acceleration, spin, exact lifetime boundaries and loop carry, endpoint
crossfades into new/existing emitters, held inputs, zero/pause behavior,
saved-field continuation, and exact long-time constant-rate animation phase.
The game-linked
actor fixture executes real Plant bowling, Zombie walking, definition root
sampling and Board row buckets. It also checks Snowpea and Kernel projectile
birth, motion, collision targeting and impact damage through production methods.
