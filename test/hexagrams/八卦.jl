module test_hexagrams_八卦

using Test
using Hexagrams.八卦

# xor ⊻
@test ⊻(乾, 坤) ≡ # 건 곤 0b111 0b000
      ⊻(震, 巽) ≡ # 진 손 0b001 0b110
      ⊻(坎, 離) ≡ # 감 리 0b010 0b101
      ⊻(艮, 兌)   # 간 태 0b100 0b011

@test Char(Trigram(0b111)) ≡ '☰'
@test Char(Trigram(0b011)) ≡ '☱'
@test Char(Trigram(0b101)) ≡ '☲'
@test Char(Trigram(0b001)) ≡ '☳'
@test Char(Trigram(0b110)) ≡ '☴'
@test Char(Trigram(0b010)) ≡ '☵'
@test Char(Trigram(0b100)) ≡ '☶'
@test Char(Trigram(0b000)) ≡ '☷'

@test string(乾, base=2, pad=3) ≡ "111"
@test string(坤, base=2, pad=3) ≡ "000"

end # module test_hexagrams_八卦
