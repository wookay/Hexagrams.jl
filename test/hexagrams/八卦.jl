module test_hexagrams_八卦

using Test
using Hexagrams.八卦

≡(x, y) = x == y

# xor ⊻
@test ⊻(乾, 坤) ≡ # 건 곤 0b111 0b000
      ⊻(震, 巽) ≡ # 진 손 0b001 0b110
      ⊻(坎, 離) ≡ # 감 리 0b010 0b101
      ⊻(艮, 兌) ≡ # 간 태 0b100 0b011
      乾

const ⩣ = Base.Fix2(⊻, 乾)
@test ⩣(乾) ≡ 坤
@test ⩣(震) ≡ 巽
@test ⩣(坎) ≡ 離
@test ⩣(艮) ≡ 兌

@test 乾 ≡ 卦(0b111)
@test 坤 ≡ 卦(0b000)

@test Char(Trigram(乾)) ≡ '☰'
@test Char(Trigram(兌)) ≡ '☱'
@test Char(Trigram(離)) ≡ '☲'
@test Char(Trigram(震)) ≡ '☳'
@test Char(Trigram(巽)) ≡ '☴'
@test Char(Trigram(坎)) ≡ '☵'
@test Char(Trigram(艮)) ≡ '☶'
@test Char(Trigram(坤)) ≡ '☷'

const ☷ = Trigram(坤)
@test ☷.binary ≡ 坤
@test Char(☷) ≡ '☷'
@test isprint(☷)

@test string(乾, base=2, pad=3) ≡ "111"
@test string(坤, base=2, pad=3) ≡ "000"

if VERSION >= v"1.14-DEV"
@test Base.ispacked(卦) ≡ false
else
@test Base.ispacked(卦)
end

for sym::Symbol in (:乾, :兌, :離, :震, :巽, :坎, :艮, :坤)
    x::卦 = getglobal(八卦, sym)
    @test nameof(x) ≡ sym
end

@test ndigits(乾) == 1

end # module test_hexagrams_八卦
