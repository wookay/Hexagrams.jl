# Hexagrams.jl ☯

|  **Documentation**                        |  **Build Status**                 |
|:-----------------------------------------:|:---------------------------------:|
|  [![][docs-latest-img]][docs-latest-url]  |  [![][actions-img]][actions-url]  |

```julia
julia> using Hexagrams.八卦

julia> 乾 ≡ 卦(0b111)
true

julia> 坤 ≡ 卦(0b000)
true

julia> ⊻(乾, 坤) ≡ ⊻(震, 巽) ≡ ⊻(坎, 離) ≡ ⊻(艮, 兌)
true
```

* 八卦  https://en.wikipedia.org/wiki/Bagua

### repositories
 - Hexagrams.jl ☯  https://github.com/wookay/Hexagrams.jl
 - Sexagesimal.jl ♒️  https://github.com/wookay/Sexagesimal.jl


[docs-latest-img]: https://img.shields.io/badge/docs-latest-blue.svg
[docs-latest-url]: https://wookay.github.io/docs/Hexagrams.jl/

[actions-img]: https://github.com/wookay/Hexagrams.jl/workflows/CI/badge.svg
[actions-url]: https://github.com/wookay/Hexagrams.jl/actions
