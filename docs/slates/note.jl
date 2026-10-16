try; import KaimonSlate; catch; error("This is a Kaimon Slate notebook — running it as plain Julia needs the KaimonSlate runtime in this environment. Add it with `import Pkg; Pkg.add(\"KaimonSlate\")`, or open it in Kaimon Slate."); end; KaimonSlate.standalone!(@__MODULE__; dir=@__DIR__)

#%% md id=intro
@md"""
# Hexagrams.八卦
"""

#%% code id=de5e61
using Hexagrams.八卦

#%% code id=5305bd
乾

#%% code id=2947c3
using LogicalOperators

#%% code id=fdfa9b
@logic 乾 ⊻ 坤

# ╔═╡ Slate.config · per-notebook settings (Settings panel)
#   docid = ebefae55-0a4f-48d4-b87a-22f9e019b8f5
# ╚═╡
