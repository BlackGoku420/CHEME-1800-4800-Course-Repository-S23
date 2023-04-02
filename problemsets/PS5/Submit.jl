# TODO: Fill me in with your program to compute the uknown model parameters from the data
include("Include.jl")

#loading in the data file
path_to_exp_file = joinpath(_PATH_TO_DATA, "PS5-dataset-w-repeats.csv")
exp_data = loaddataset(path_to_exp_file);

#solving for the unknown parameter vector?
M_exp = build_data_matrix(exp_data)
unknown = build_output_vector(exp_data)

tpose = transpose(M_exp)
#building error model
model = inv(tpose*M_exp)*tpose
β = model*unknown

error = unknown - M_exp*β
error_model = build_error_distribution(error)
