"""
    encrypt(plaintext::String) -> Dict{Int64,String}

Fill me in
"""
function encrypt(plaintext::String)::Dict{Int64,String}
    #initialize
    message = Dict{Int64, String}();
    counter = 0;
    
    #build encryption key
    encryption_model = build(DNAEncryptionKey);
    encryptionkey = encryption_model.encryptionkey;

    for i ∈ uppercase(plaintext)
        message[counter] = encryptionkey[i];
        counter = counter + 1;
    end
    return message
end


"""
    decrypt(encrypteddata::Dict{Int64,String}) -> String

Fill me in
"""
function decrypt(encrypteddata::Dict{Int64,String})::String
    #= I shall get back to this later
    #initialize
    temp = "";
    plaintext = Vector{Char}();
    
    #build encryption key
    decrypted = length(encrypteddata)
    encryption_model = build(DNAEncryptionKey);
    encryptionkey = encryption_model.encryptionkey;
    

    for i ∈ 0:decrypted
        for j ∈ encryptionkey
            if(encrypteddata[i] == encryptionkey[j])
                plaintext = plaintext + j;
                #push!(plaintext, i)
            else
                break;
            end
        end
    end
    return String(plaintext)
    =#

    # the actual solution
    # initialize -
    number_of_chars = length(encrypteddata)
    inverse_encryptionkey_dict = Dict{String, Char}()
    plaintext = Vector{Char}()

   # build encryptionkey -
   encryption_model = build(DNAEncryptionKey);
   encryptionkey = encryption_model.encryptionkey;

   # build the inverse_key -
   for (key, value) ∈ encryptionkey
       inverse_encryptionkey_dict[value] = key
   end

   for i ∈ 0:(number_of_chars - 1)
       
       codon = encrypteddata[i]
       value = inverse_encryptionkey_dict[codon]
       push!(plaintext, value)
   end

   # return -
   return String(plaintext)
end
