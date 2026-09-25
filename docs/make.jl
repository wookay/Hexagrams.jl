using Documenter
using Hexagrams

makedocs(
    build = joinpath(@__DIR__, "local" in ARGS ? "build_local" : "build"),
    modules = [Hexagrams],
    clean = false,
    format = Documenter.HTML(
        prettyurls = !("local" in ARGS),
        assets = ["assets/custom.css"],
        size_threshold = 1_000_000,
    ),
    sitename = "Hexagrams.jl ☯",
    authors = "WooKyoung Noh",
    pages = Any[
        "Home" => "index.md",
        "Octahedral Symmetry" => "OctahedralSymmetry.md",
        "Dominant Frequency"  => "DominantFrequency.md",
    ],
)
