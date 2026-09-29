module 八卦 # module Hexagrams

export 乾, 兌, 離, 震, 巽, 坎, 艮, 坤
export Trigram

const 乾 = 0b111 # 건 ☰ U+2630
const 兌 = 0b011 # 태 ☱ U+2631
const 離 = 0b101 # 리 ☲ U+2632
const 震 = 0b001 # 진 ☳ U+2633
const 巽 = 0b110 # 손 ☴ U+2634
const 坎 = 0b010 # 감 ☵ U+2635
const 艮 = 0b100 # 간 ☶ U+2636
const 坤 = 0b000 # 곤 ☷ U+2637

struct Trigram
    binary::UInt8
end

function Base.Char(trigram::Trigram)::Char
    a = (0b100 & trigram.binary) >> 2
    b = (0b010 & trigram.binary) >> 1
    c = (0b001 & trigram.binary)
    '☰' + xor(0b111, a, b << 1, c << 2)
end

# 伏羲先天八卦 복희선천팔괘
#  兌  乾  巽  0b011 0b111 0b110
#  離      坎  0b101       0b010
#  震  坤  艮  0b001 0b000 0b100

# 文王八卦     문왕팔괘
#  乾  坎  艮  0b111 0b010 0b100
#  兌      震  0b011       0b001
#  坤  離  巽  0b000 0b101 0b110

end  # module Hexagrams.八卦
