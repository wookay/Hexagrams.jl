module test_hexagrams_logic

using Test
using LogicalOperators
using Hexagrams.八卦

≡(x, y) = x == y

@test @logic(乾 ⊻ 坤) ≡ 乾
@test @logic(乾 & 坤) ≡ 坤
@test @logic(乾 | 坤) ≡ 乾

end # module test_hexagrams_logic
