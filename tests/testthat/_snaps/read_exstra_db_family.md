# Read UCSC simple repeats file

    Code
      read_exstra_db(system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"))
    Output
      exstra_db object with 1 locus ($db) of type ucsc

# Read known repeats file

    Code
      read_exstra_db(system.file("extdata", "repeat_expansion_disorders_grch38.txt",
        package = "exSTRa"))
    Output
      exstra_db object with 26 loci ($db) of type named

