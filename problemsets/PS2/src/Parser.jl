"""
    _recursive_compound_parser()

TODO: Describe what this function does, the args and what we expect it to return
"""
function _recursive_compound_parser()
    # TODO: Implement me
          
end

"""
    recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel}) -> Dict{String, MyChemicalCompoundModel}

    takes in a Dictionary of String and MyChemicalCompoundModel 
    and returns the same dictionary with the composition data of the compounds stored in the dictionary
    this composition data is able to be added due to the mutable struct MyChemicalCompoundModel
"""
function recursive_compound_parser(compounds::Dict{String, MyChemicalCompoundModel})::Dict{String, MyChemicalCompoundModel}

    # TODO: Implement a function that computes a composition dictionary of type Dict{Char,Int} for each of the compounds in the compounds dictionary
    #
    # Composition dictionary:
    # The composition dictionary will hold the elements of the compounds as Chars 
    # The number of each element will be the value held in the composition dictionary
    # the parsering logic should be written in the _recursive_compound_parser function.

    # This function should return the updated instances of the MyChemicalCompoundModel types holding the composition dictionary in the 
    # the composition field.

    # process each compound
    for (name, compound) ∈ compounds
        # TODO: Implement me
        # initialize
        compositionDict = Dict{Char, Int}();
        numComp = ""; # string representing the number of times this character appears in the compound, which is the number following that letter and that ends before the next letter in the compound String
        tmp = ""; #string representing the temporary character that is representing the element
        pound = compound.compound # string storing the compound string stored in the compound model

        # loops through the length of the compound string
        for c ∈ eachindex(pound)
            # if the character at an index c of the compound string is not a number,
            # set a temp variable equal to the character at that index c
            # each time a new character is reached that is not a number, the String holding the number of times the element appears is reset to an empty String
            if(isnumeric(pound[c]) == false)
                tmp = pound[c];
                numComp = ""; 
                # say if a chemical formula is like H2O (the subscript for O is 1 but is not explicitly written), or if a formula is PH4 (the subscript for P is 1 but is not explicitly written), we need O to point to a 1 in the composition dictionary
                # then if the index is equal to the length of the compound string (therefore if it is the last character in that string, and is not a number)
                # or if the character stored in the next index of the compound string from the character at index c (index c+1) is also non-numeric
                # concatenate a 1 onto the numComp String, add that to the dictionary at this temp character (index c)
                if(c == length(pound) || isnumeric(pound[c+1]) == false)
                    numComp = numComp * "1";
                    # turns the numComp string into an Int, since the composition dictionary is of type {Char, Int}
                    # and stores it in the dictionary at the index of the temp variable
                    compositionDict[tmp] = parse(Int, numComp); 

                    # builds model
                    comps = build(MyChemicalCompoundModel, name, pound)

                    # based on the mutable struct in Types.jl, the composition is a dictionary of this same type, so you can call .composition on the model and set it equal to the created composition dictionary 
                    comps.composition = compositionDict;

                    # adds the updated MyChemicalCompoundModel to the original compounds dictionary under the same name index as before
                    compounds[name] = comps;
                end
            else
                # if the character at an index c of the compound string IS a number
                # concatenate the char of the number to the numComp variable (say a number is 10, then the 1 will get added first and then the 0 without messing with the temp variable holding the respective character of this number in the composition dictionary)
                numComp = numComp * string(pound[c]);
                
                # parses numComp string as Int, adds it to dictionary at index of the temp variable
                compositionDict[tmp] = parse(Int, numComp);
            end
            if(numComp != "")
                # builds model for when the numComp variable is not empty (so when there is a number stored in it up to this line in the code)
                # does the same thing as the code inside the if statement on line
                comps = build(MyChemicalCompoundModel, name, pound)
                comps.composition = compositionDict;
                compounds[name] = comps;
            end
        end

    end

    # return the updated dictionary
    return compounds;
end
