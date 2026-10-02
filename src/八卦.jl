baremodule 八卦 # module Hexagrams

using Base: Base
using .Base: |, <<, >>, &, +, xor
# using .Base: >=, @v_str, VERSION

export 卦
export 乾, 兌, 離, 震, 巽, 坎, 艮, 坤
export Trigram, Double, Triple

# primitive type 卦 3 end
  primitive type 卦 8 end

function 卦(k::UInt8)
    Core.Intrinsics.bitcast(卦, k)
end

function Base.UInt8(x::卦)
    Core.Intrinsics.bitcast(UInt8, x)
end

function Base.UInt16(x::卦)
    UInt16(UInt8(x))
end

function Base.string(x::卦; base::Int, pad::Int)::String
    Base.string(UInt8(x); base, pad)
end

function Base.xor(x::卦, y::卦)
    Core.Intrinsics.xor_int(x, y)
end

function Base.xor(n::UInt8, y::卦)
    Core.Intrinsics.xor_int(卦(n), y)
end

function Base.:(<<)(x::卦, k::UInt8)
    Core.Intrinsics.shl_int(x, k)
end

function Base.:(>>)(x::卦, k::UInt8)
    Core.Intrinsics.lshr_int(x, k)
end

function Base.:(|)(x::卦, y::卦)
    Core.Intrinsics.or_int(x, y)
end

function Base.:(|)(n::UInt16, y::卦)
    Core.Intrinsics.or_int(n, UInt16(y))
end

function Base.:(&)(n::UInt8, y::卦)
    Core.Intrinsics.and_int(卦(n), y)
end

function Base.:(+)(ch::Char, x::卦)
    Base.:+(ch, UInt8(x))
end

const 乾 = 卦(0b111) # 건 ☰ U+2630
const 兌 = 卦(0b011) # 태 ☱ U+2631
const 離 = 卦(0b101) # 리 ☲ U+2632
const 震 = 卦(0b001) # 진 ☳ U+2633
const 巽 = 卦(0b110) # 손 ☴ U+2634
const 坎 = 卦(0b010) # 감 ☵ U+2635
const 艮 = 卦(0b100) # 간 ☶ U+2636
const 坤 = 卦(0b000) # 곤 ☷ U+2637

struct Trigram
    binary::卦
end

function Base.Char(trigram::Trigram)::Char
    a = (0b100 & trigram.binary) >> 0b10
    b = (0b010 & trigram.binary) >> 0b01
    c = (0b001 & trigram.binary)
    '☰' + xor(0b111, a, b << 0b01, c << 0b10)
end

struct Double
    a::卦
    b::卦
end

function Base.UInt8(double::Double)::UInt8
    UInt8(double.a << 0b11 | double.b)
end

struct Triple
    a::卦
    b::卦
    c::卦
end

function Base.UInt16(triple::Triple)::UInt16
    UInt16(triple.a) << 0b110 | triple.b << 0b11 | triple.c
end

end  # module Hexagrams.八卦
