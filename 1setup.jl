# from a suggestion at https://discourse.julialang.org/t/install-a-packages-from-a-list/30920/3
# These are additional dependencies found when running the code

using Pkg

dependencies = [
    "DataFrames", 
    "CSV"
]

Pkg.add(dependencies)

