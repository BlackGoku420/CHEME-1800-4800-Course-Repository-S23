# include the include -
include("Include.jl")

# load the metabolic JSON file -
path_to_json_file = joinpath(_PATH_TO_DATA,"e_coli_core.json");
data = readreactionfile(path_to_json_file);

# build my stochiometric model -
model = build(MyStoichiometricNetworkModel,data);

max_growth_rate = compute_maximum_growth_rate(model)
#rate = max_growth_rate["BIOMASS_Ecoli_core_w_GAM"]