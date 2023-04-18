
"""
Fill me in.
"""
function _build_stoichiometric_matrix(data::Dict{String,Any})::Array{Float64,2}
    
    # initialize -
    list_of_metabolites = data["metabolites"];
    list_of_reactions = data["reactions"];
    number_of_reactions = length(list_of_reactions);
    number_of_metabolites = length(list_of_metabolites);
    S = Array{Float64,2}(undef, number_of_metabolites, number_of_reactions);
    
    # TODO: fill in the entries of the stochiometric matrix 
    for i ∈ 1:number_of_metabolites
        metabolite_id = list_of_metabolites[i]["id"];
        for j ∈ 1:number_of_reactions
            reaction_meta = list_of_reactions[j]["metabolites"]
            if(haskey(reaction_meta,metabolite_id))
                S[i,j] = reaction_meta[metabolite_id];
            else
                S[i,j] = 0.0;
            end
        end
    end

    # return -
    return S
end

"""
Fill me in.
"""
function _build_metabolite_id_array(data::Dict{String,Any})::Array{String,1}

    # initialize -
    metabolite_id_array = Array{String,1}()

    # TODO: fill the metabolite_id_array with the metabolite id's from the data dictionary
    list_of_metabolites = data["metabolites"];
    for metabolite ∈ list_of_metabolites
        id_value = metabolite["id"];
        push!(metabolite_id_array,id_value);
    end

    # return -
    return metabolite_id_array;
end

"""
Fill me in.
"""
function _build_reaction_id_array(data::Dict{String,Any})::Array{String,1}
    
    # initialize -
    reaction_id_array = Array{String,1}()

    # TODO: fill the reaction_id_array with the reaction id's from the data dictionary
    list_of_reactions = data["reactions"];
    for reaction ∈ list_of_reactions
        id_value = reaction["id"];
        push!(reaction_id_array,id_value);
    end

    # return -
    return reaction_id_array;
end

"""
Fill me in.
"""
function _build_bounds_array(data::Dict{String,Any})::Array{Float64,2}

    # initialize -
    list_of_reactions = data["reactions"];
    number_of_reactions = length(list_of_reactions)
    bounds_array = Array{Float64,2}(undef,number_of_reactions,2)

    # TODO: fill in the entries of the bounds array, first col is the lower bound, second col is the upper bound
    for i ∈ 1:number_of_reactions
        lower_bound = list_of_reactions[i]["lower_bound"]
        upper_bound = list_of_reactions[i]["upper_bound"]
        bounds_array[i,1] = lower_bound
        bounds_array[i,2] = upper_bound
    end

    # return -
    return bounds_array
end

"""
Fill me in
"""
function build(type::Type{MyStoichiometricNetworkModel}, data::Dict{String,Any})::MyStoichiometricNetworkModel

    # build an empty instance of our model -
    model = MyStoichiometricNetworkModel();

    # construct model elements -
    model.species = _build_metabolite_id_array(data);
    model.reactions = _build_reaction_id_array(data);
    model.bounds = _build_bounds_array(data);
    model.S = _build_stoichiometric_matrix(data);

    # return -
    return model;
end