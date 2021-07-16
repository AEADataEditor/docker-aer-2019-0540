# from a suggestion at https://discourse.julialang.org/t/install-a-packages-from-a-list/30920/3

using Pkg

dependencies = [
    "JLD", 
    "LoopVectorization", 
    "Optim", 
    "NLsolve", 
    "StatsBase", 
    "Distributions", 
    "Plots", 
    "Revise"
]

Pkg.add(dependencies)

