
"""
    load_review_file(path::String) -> Dict{Int,String}
"""
function load_review_file(path::String)::Dict{Int,String}
    
    # check: is path legit?
    # ...

    # initialize -
    sentences = Dict{Int, String}()
    counter = 0; # zero-based index

    # use example pattern from: https://varnerlab.github.io/CHEME-1800-Computing-Book/unit-1-basics/data-file-io.html#program-read-a-csv-file-refactored
    open(path, "r") do io # open a stream to the file
        for line in eachline(io) # read each line from the stream
            # Impl me -
            # write code to store the lines of text in the sentences dictionary
            
            #grab sentence
            sentences[counter] = line;

            #update counter
            counter = counter + 1;
        end
    end

    # return -
    return sentences;
end