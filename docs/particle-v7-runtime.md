# Particle v7 runtime and actor coordinate boundary

The 24-byte v7 particle definition node contains an `int32_t` time numerator
and denominator, ordinary `float` low/high values, and `int32_t` curve and
distribution IDs. Omitted node times retain their reduced rational fraction.
Ordinary source decimals retain float precision without thousandth
quantization; evaluated values are not written back into definitions.

Particle systems consume complete 10,000,000 ns simulation steps. Births,
birth order, random draws, spawning, lifetime samples, force fields, collision,
spin and varying-rate image animation all use this common 100 Hz timeline.
The outer update stores its remaining nanoseconds and does not simulate a
partial step. Position, velocity and rotation remain canonical floating-point
physics state at completed internal steps. This guarantees the same state on
the same platform for the same initial state and canonical inputs; it is not
an analytic arbitrary-step force integrator or a cross-platform floating-point
bit-identity guarantee.

Lifetime and previous lifetime samples are saved integer nanoseconds. A
normalized lifetime is a temporary ratio with a denominator of at least one
internal step, including one-tick definitions. Fractional authored durations
are retained as nanoseconds rather than truncated to whole legacy ticks.

Spawning integrates the rate sampled at each canonical step. Its integer
remainder uses 10^12 units per particle; each sampled increment is rounded once
to this scale. Births occur at canonical step boundaries. This is a sampled
integral, not the analytic integral of an arbitrary spawn-rate curve.

Each system owns its saved random stream. Initial system creation takes one
global seed; internal steps and births consume only that local stream.
Particle shake hashes a saved birth seed and integer sample age, without
addresses, `srand`, or global `rand` state.

For a constant authored image animation rate, image phase is derived from
the exact binary float rate and integer elapsed nanoseconds, modulo 10^12,
plus a fixed initial phase anchor. Integer multiplication, shifts and modulo
retain phase precision even when elapsed time exceeds double's 53-bit integer
range. The initial anchor supports legacy-save migration. Constant-rate
animation never accumulates phase increments. Varying-rate curves use a
separate integer canonical sampled integral. Animation elapsed time is
independent of lifetime so random initial ages and particle lifetime loops
do not restart image animation.

`SystemMove` supplies a held external input event. The next completed internal
step samples that target and moves following particles once. A caller that
has a discontinuity at a known integer time must split `Update(deltaNs)` at
that event time. Equal event timelines produce equal canonical samples.
Sampling an arbitrary moving attachment only once per outer frame supplies
different input events at different frame rates; the particle simulation
cannot reconstruct the unsampled trajectory.

Drawing uses the latest completed state. There is no extrapolated partial
physics state and no drawing feedback into simulation. The completed state
can be up to one 10 ms internal step behind outer time; this implementation
does not add the extra full-step delay of interpolating two prior states.

Plant and Zombie use a separate `FloatGameObject` base containing one public
ordinary `float` X/Y pair in pixels. Their duplicate coordinate caches are
removed. Integer collision and pixel APIs convert at their existing API
boundaries. Other GameObject-derived types retain their integer pixel layout.

Their compact root binding stores a double world/source offset, playback
generation and ordinary float scale. X is evaluated as that offset plus
`RootMotion` at the
requested integer time. Position writes and body-instance changes invalidate
the binding. Bowling samples horizontal root position at canonical collision
times, advances vertical bounce on its own 100 Hz birth clock, and samples
horizontal position again at the outer endpoint. Special velocity paths keep
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
This bridge does not change particle simulation or its local pause behavior.

The production particle fixture checks exact state across 30, 60, 100, 144,
200, 240 and 1000 Hz plus randomized nanosecond partitions. The game-linked
actor fixture executes real Plant bowling, Zombie walking, definition root
sampling and Board row buckets. It also checks Snowpea and Kernel projectile
birth, motion, collision targeting and impact damage through production methods.
