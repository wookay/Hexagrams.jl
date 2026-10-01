module 八卦 # module Hexagrams

export 乾, 兌, 離, 震, 巽, 坎, 艮, 坤
export Trigram, Double, Triple

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
    a = (0b100 & trigram.binary) >> 0b10
    b = (0b010 & trigram.binary) >> 0b01
    c = (0b001 & trigram.binary)
    '☰' + xor(0b111, a, b << 0b01, c << 0b10)
end

struct Double
    a::UInt8
    b::UInt8
end

function Base.UInt8(double::Double)::UInt8
    double.a << 0b11 | double.b
end

struct Triple
    a::UInt8
    b::UInt8
    c::UInt8
end

function Base.UInt16(triple::Triple)::UInt16
    UInt16(triple.a) << 0b110 | triple.b << 0b11 | triple.c
end

end  # module Hexagrams.八卦
