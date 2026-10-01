module test_hexagrams_八卦

using Test
using Hexagrams.八卦

# xor ⊻
@test ⊻(乾, 坤) ≡ # 건 곤 0b111 0b000
      ⊻(震, 巽) ≡ # 진 손 0b001 0b110
      ⊻(坎, 離) ≡ # 감 리 0b010 0b101
      ⊻(艮, 兌)   # 간 태 0b100 0b011

@test 乾 ≡ 0b111
@test 坤 ≡ 0b000

@test Char(Trigram(乾)) ≡ '☰'
@test Char(Trigram(兌)) ≡ '☱'
@test Char(Trigram(離)) ≡ '☲'
@test Char(Trigram(震)) ≡ '☳'
@test Char(Trigram(巽)) ≡ '☴'
@test Char(Trigram(坎)) ≡ '☵'
@test Char(Trigram(艮)) ≡ '☶'
@test Char(Trigram(坤)) ≡ '☷'
@test Trigram(乾).binary ≡ 乾

@test UInt8( Double(乾, 乾))     ≡     0b111_111
@test UInt16(Triple(乾, 乾, 乾)) ≡ 0b111_111_111

@test string(乾, base=2, pad=3) ≡ "111"
@test string(坤, base=2, pad=3) ≡ "000"

# rad2deg(tau/(8/卦))               rad2deg(tau/(8/(xor(乾, 卦))))
# 兌 0b011 坎 0b010 震 0b001        艮 0b100 離 0b101 巽 0b110
# 艮 0b100          坤 0b000        兌 0b011          乾 0b111
# 離 0b101 巽 0b110 乾 0b111        坎 0b010 震 0b001 坤 0b000

# 伏羲先天八卦 복희선천팔괘
#  兌  乾  巽  0b011 0b111 0b110
#  離      坎  0b101       0b010
#  震  坤  艮  0b001 0b000 0b100

# 文王八卦     문왕팔괘
#  乾  坎  艮  0b111 0b010 0b100
#  兌      震  0b011       0b001
#  坤  離  巽  0b000 0b101 0b110

end # module test_hexagrams_八卦
