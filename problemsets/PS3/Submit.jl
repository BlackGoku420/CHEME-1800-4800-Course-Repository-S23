include("Include.jl");

numSteps = trunc(Int, 20/0.1)

case_1 = build(MyChemicalDecayModel, κ = 1.0, h = 0.1, N = numSteps, Cₒ = 10.0)
case_2 = build(MyChemicalDecayModel, κ = 10.0, h = 0.1, N = numSteps, Cₒ = 10.0)
case_3 = build(MyChemicalDecayModel, κ = 100.0, h = 0.1, N = numSteps, Cₒ = 10.0)



zₒ = zeros(Float64, numSteps)

#case1 Solvers
jacobi_1 = solve(JacobiIterationSolver(), case_1, zₒ)
gauss_1 = solve(GaussSeidelIterationSolver(), case_1, zₒ)


#case2 Solvers
jacobi_2 = solve(JacobiIterationSolver(), case_2, zₒ)
gauss_2 = solve(GaussSeidelIterationSolver(), case_2, zₒ)

#case3 Solvers
jacobi_3 = solve(JacobiIterationSolver(), case_3, zₒ)
gauss_3 = solve(GaussSeidelIterationSolver(), case_3, zₒ)



#inverses
inv_1 = inv(case_1.A)
inv_2 = inv(case_2.A)
inv_3 = inv(case_3.A)

#multiply inverses
prod_inv_1 = inv_1*case_1.b
prod_inv_2 = inv_2*case_2.b
prod_inv_3 = inv_3*case_3.b

#determinants
det_case_1 = det(case_1.A)
det_case_2 = det(case_2.A)
det_case_3 = det(case_3.A)


#jacobi norms
j_norm_1 = norm(jacobi_1 - prod_inv_1)
j_norm_2 = norm(jacobi_2 - prod_inv_2)
j_norm_3 = norm(jacobi_3 - prod_inv_3)

#gauss norms
g_norm_1 = norm(gauss_1 - prod_inv_1)
g_norm_2 = norm(gauss_2 - prod_inv_2)
g_norm_3 = norm(gauss_3 - prod_inv_3)



