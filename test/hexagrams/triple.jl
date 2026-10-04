baremodule test_hexagrams_triple

using Test
using Base: Base
using Hexagrams.八卦

struct Triple
    a::卦
    b::卦
    c::卦
end

function Base.UInt16(x::卦)
    UInt16(UInt8(x))
end

function Base.:(|)(n::UInt16, y::卦)
    Core.Intrinsics.or_int(n, UInt16(y))
end

using .Base: <<, |

function Base.UInt16(triple::Triple)::UInt16
    UInt16(triple.a) << 0b110 | triple.b << 0b11 | triple.c
end

using .Base: ≡

@test UInt16(Triple(乾, 乾, 乾)) ≡ 0b111_111_111

end # module test_hexagrams_triple
