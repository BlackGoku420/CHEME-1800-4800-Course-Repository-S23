
"""
    read_compounds_file(path::String) -> Dict{String, MyChemicalCompoundModel}

TODO: Describe what this function is doing, the args and the what is contained in the data that is returned.
    take in a file path, reads through file line by line, cuts by a specific delimiter, and the data is stored
    in a dictionary of type {String, MyChemicalCompoundModel}
    the MyChemicalCompoundModel is built with the data taken from the line itself, stored in this dictionary, and that dictionary is returned
"""
function read_compounds_file(path::String)::Dict{String, MyChemicalCompoundModel}
    
    # check: is path legit?
    # in production we would check this path, assume ok for now

    # initialize -
    compounds = Dict{String, MyChemicalCompoundModel}()
    counter = 0; # zero-based index

    # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            

            # TODO: Implement the logid to process the records in the Test.data file
            # line is a line from the file  

            # A couple of things to think about: 
            # a) ignore the comments, check out the contains function: https://docs.julialang.org/en/v1/base/strings/#Base.contains
            # b) ignore the header data
            # c) records are comma delimited. Check out the split functions: https://docs.julialang.org/en/v1/base/strings/#Base.split
            # d) from the data in each reacord, we need to build a MyChemicalCompoundModel object. Each compound object should be stored in the compound dict with the name as the key
            if(contains(line, "#") == false)
                for i ∈ line
                    if(isnumeric(i) == true)
                        # split by the comma delimiter
                        fields = split(line, ",")

                        #grab the fields
                        name = string(fields[1]);
                        formula = string(fields[2]);
                        
                        # build the model
                        model = build(MyChemicalCompoundModel, name, formula)

                        # add model to dictionary
                        compounds[name] = model;
                    end
                end
            end
        end
    end

    # return -
    return compounds;
end