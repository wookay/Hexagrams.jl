using Pkg
# https://github.com/oscar-system/Oscar.jl
const oscar_path = normpath(Pkg.devdir(), "Oscar")

using Jive
@If isdir(oscar_path) module test_Oscar_RootSystem

# from Oscar/test/LieTheory/RootSystem.jl

import AbstractAlgebra # https://github.com/Nemocas/AbstractAlgebra.jl
import Hecke # https://github.com/thofma/Hecke.jl
             # https://github.com/nemocas/Nemo.jl

using Test
using Random
using .AbstractAlgebra: @attributes, @req
using .Hecke.Nemo: ZZMatrix, QQMatrix, Group, GroupElem, IntegerUnion, @show_name, @show_special, @attr, RationalUnion, @enable_all_show_via_expressify, ConformanceTests, @show_special_elem
using .Hecke.Nemo: diagonal_matrix, ZZ, nrows, matrix, QQ
using .Hecke.Nemo: RationalUnionOrPtr, IntegerUnionOrPtr
import .Hecke.Nemo: zero

const oscar_path = parentmodule(@__MODULE__).oscar_path

include(normpath(oscar_path, "src/LieTheory/LieTheory.jl"))

R = root_system(:B, 2)
@test rank(R) == 2

end # module test_Oscar_RootSystem
