# Quotient/remainder spelling, 2026-10-30

MSVC /O2 /GL /LTCG, LP14, seven rounds, frequency not controlled. Raw CSV and benchmark source retained. Independent quotient/remainder accumulators prevent the checksum from algebraically folding the remainder. At 120Hz the pair kernels measure medians 5.5201 ns/input for / and %, 11.0111 for q then a-q*b; at hypothetical 30Hz, 5.5073 versus 11.0044; 128-frame jumps 5.9694 versus 11.9848.

x86 DIV returns both quotient and remainder. RunDividePairs (0x140001610) consumes both with one DIV per input (loop unrolled twice). In RunDivideMultiplySubtractPairs (0x1400016E0), this compiler emitted two divisions of the same input instead of sharing the quotient. This is context/compiler-specific, not a universal cost of multiplication. Mixed-checksum kernels algebraically fold q*K+a-q*b and are not isolated remainder measurements. Keep adjacent / and % in production.
