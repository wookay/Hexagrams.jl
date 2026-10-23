module test_hexagrams_array

using Test
using Hexagrams.八卦

≡(x, y) = x == y

const tau = 2pi
# rad2deg(tau/(8/卦))
# 兌 0b011 坎 0b010 震 0b001   135  90  45
# 艮 0b100          坤 0b000   180       0
# 離 0b101 巽 0b110 乾 0b111   225 270 315

R = [0b011 0b010 0b001   # 3 2 1
     0b100 0b0   0b000   # 4   0
     0b101 0b110 0b111]  # 5 6 7

@test R[0b10,0b11] ≡ 0b000 ≡ UInt8(坤)
@test R[0b01,0b11] ≡ 0b001 ≡ UInt8(震)
@test R[0b01,0b10] ≡ 0b010 ≡ UInt8(坎)
@test R[0b01,0b01] ≡ 0b011 ≡ UInt8(兌)
@test R[0b10,0b01] ≡ 0b100 ≡ UInt8(艮)
@test R[0b11,0b01] ≡ 0b101 ≡ UInt8(離)
@test R[0b11,0b10] ≡ 0b110 ≡ UInt8(巽)
@test R[0b11,0b11] ≡ 0b111 ≡ UInt8(乾)

# rad2deg(tau/(8/(xor(乾, 卦))))
# 艮 0b100 離 0b101 巽 0b110   4 5 6
# 兌 0b011          乾 0b111   3   7
# 坎 0b010 震 0b001 坤 0b000   2 1 0


# 伏羲先天八卦 복희선천팔괘
#  兌  乾  巽  0b011 0b111 0b110   3 7 6
#  離      坎  0b101       0b010   5   2
#  震  坤  艮  0b001 0b000 0b100   1 0 4
A = [0b011 0b111 0b110
     0b101 0b0   0b010
     0b001 0b000 0b100]

@test A[0b01,0b01] ≡ 0b011 ≡ UInt8(兌)
@test A[0b11,0b11] ≡ 0b100 ≡ UInt8(艮)

@test A[0b01,0b10] ≡ 0b111 ≡ UInt8(乾)
@test A[0b11,0b10] ≡ 0b000 ≡ UInt8(坤)

@test A[0b01,0b11] ≡ 0b110 ≡ UInt8(巽)
@test A[0b11,0b01] ≡ 0b001 ≡ UInt8(震)

@test A[0b10,0b01] ≡ 0b101 ≡ UInt8(離)
@test A[0b10,0b11] ≡ 0b010 ≡ UInt8(坎)

# 文王八卦     문왕팔괘
#  乾  坎  艮  0b111 0b010 0b100   7 2 4
#  兌      震  0b011       0b001   3   1
#  坤  離  巽  0b000 0b101 0b110   0 5 6


function bit_to_vec(byte::UInt8)::Vector{UInt8}
    [byte >> 2, byte >> 1 & 0b01, byte & 0b001]
end

function vec_to_bit(v::Vector{UInt8})::UInt8
    v[1] << 2 | v[2] << 1 | v[3]
end

@test (vec_to_bit ∘ bit_to_vec)(0b100) ≡ 0b100
@test (vec_to_bit ∘ bit_to_vec)(0b010) ≡ 0b010
@test (vec_to_bit ∘ bit_to_vec)(0b001) ≡ 0b001

end # module test_hexagrams_array
