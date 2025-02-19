# setup path -
const _ROOT = pwd();
const _PATH_TO_SRC = joinpath(_ROOT, "src")

# load external packages -
using Distributions
using DataStructures
using Statistics
using Plots
using Colors

# load my codes -
include(joinpath(_PATH_TO_SRC, "Types.jl"))
include(joinpath(_PATH_TO_SRC, "Factory.jl"))
include(joinpath(_PATH_TO_SRC, "Compute.jl"))

