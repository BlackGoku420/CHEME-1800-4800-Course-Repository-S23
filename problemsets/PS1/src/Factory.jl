"""
    build(type::Type{DNAEncryptionKey}) -> DNAEncryptionKey

Factory method to construct and initialize an instance of `DNAEncryptionKey`
"""
function build(type::Type{DNAEncryptionKey})::DNAEncryptionKey

    # implement me 
    # ...

    #initialize
    changer = DNAEncryptionKey();
    enc_dict = Dict{Char,String}()
    enc_dict['A'] = "CGA"
    enc_dict['B'] = "CCA"
    enc_dict['C'] = "GTT"
    enc_dict['D'] = "TTG"
    enc_dict['E'] = "GGC"
    enc_dict['F'] = "GGT"
    enc_dict['G'] = "TTT"
    enc_dict['H'] = "CGC"
    enc_dict['I'] = "ATG"
    enc_dict['J'] = "AGT"
    enc_dict['K'] = "AAG"
    enc_dict['L'] = "TGC"
    enc_dict['M'] = "TCC"
    enc_dict['N'] = "TCT"
    enc_dict['O'] = "GGA"
    enc_dict['P'] = "GTG"
    enc_dict['Q'] = "AAC"
    enc_dict['R'] = "TCA"
    enc_dict['S'] = "ACG"
    enc_dict['T'] = "TTC"
    enc_dict['U'] = "CTG"
    enc_dict['V'] = "CCT"
    enc_dict['W'] = "CCG"
    enc_dict['X'] = "CTA"
    enc_dict['Y'] = "AAA"
    enc_dict['Z'] = "CTT"
    enc_dict[' '] = "ATA"
    enc_dict[','] = "TCG"
    enc_dict['.'] = "GAT"
    enc_dict[':'] = "GCT"
    enc_dict['0'] = "ACT"
    enc_dict['1'] = "ACC"
    enc_dict['2'] = "TAG"
    enc_dict['3'] = "GCA"
    enc_dict['4'] = "GAG"
    enc_dict['5'] = "AGA"
    enc_dict['6'] = "TTA"
    enc_dict['7'] = "ACA"
    enc_dict['8'] = "AGG"
    enc_dict['9'] = "GCG"

    changer.encryptionkey = enc_dict;
    
    #return
    return changer



end