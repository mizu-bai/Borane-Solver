push!(LOAD_PATH, "../src/")

using BoraneSolver

borane_formula = "B5H9"

"Possible sets of STYX numbers for $(borane_formula)" |> println

BoraneSolver.solver(borane_formula) |> println
