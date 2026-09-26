module test_hexagrams_八卦

using Test
using Hexagrams.八卦

# xor ⊻
@test ⊻(乾, 坤) == ⊻(艮, 兌) == ⊻(坎, 離) == ⊻(震, 巽)

@test string(乾, base=2, pad=3) == "111"
@test string(坤, base=2, pad=3) == "000"

end # module test_hexagrams_八卦
