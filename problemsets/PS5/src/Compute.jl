"""
    build_data_matrix(data::DataFrame) --> Array{Float64,2}

    Makes data matrix from data file.
"""
function build_data_matrix(data::DataFrame)::Array{Float64,2}
    substrate_conc = nrow(data);
    rates = ncol(data)
    data_matrix = zeros(substrate_conc,rates)
    for i ∈ 1:substrate_conc
        for j ∈ 1:rates
            data_matrix[i,j] = data[i,j]
        end
    end
    return data_matrix
end

"""
    build_output_vector(data::DataFrame) --> Array{Float64,1}

TODO: Creates output vector from data file.
"""
function build_output_vector(data::DataFrame)::Array{Float64,1}
    substrate_conc = nrow(data);
    output = zeros(substrate_conc);
    for i ∈ 1:substrate_conc
        output[i,1] = 1/data[i,:v1];
    end
    return output
end

"""
    build_error_distribution(residuals::Array{Float64,1}) -> Normal

    Calculates mean and standard deviation given a model of data.
"""
function build_error_distribution(residuals::Array{Float64,1})::Normal

    # initialize -
    #μ = 0.0; # default value, replace with your value
    #σ = 0.0; # default value, replace with your value

    μ = mean(residuals);
    σ = std(residuals);

    # return -
    return Normal(μ, σ);
end

