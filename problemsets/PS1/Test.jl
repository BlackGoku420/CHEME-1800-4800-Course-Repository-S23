#including the include
include("Include.jl")


    x = encrypt("Julia is awesome. The computer is my best friend, and it loves me. This is a test and only a test.")
    y = decrypt(x)

    println(x);
    println(y);
