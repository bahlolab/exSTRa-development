# score_bam()

    Code
      score_bam(system.file("extdata", "ex1.bam", package = "Rsamtools"), system.file(
        "extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), sample_name_origin = "basename",
      groups.regex = c(case = ""), verbosity = 2)
    Message <simpleMessage>
      Reading sample ex1
        On locus seq1:21-60:AG
    Output
      exstra_score object with 15 observations of type ucsc ($data),
        for 1 samples. ($samples)
        Includes associated STR database of 1 locus. ($db)

---

    Code
      score_bam(system.file("extdata", "ex1.bam", package = "Rsamtools"), ex1_db_rev,
      sample_name_origin = "basename", groups.regex = c(case = ""), qname = TRUE)
    Message <simpleMessage>
      Reading sample ex1
    Output
      exstra_score object with 29 observations of type ucsc ($data),
        for 1 samples. ($samples)
        Includes associated STR database of 1 locus. ($db)

---

    Code
      score_bam(system.file("extdata", "ex1.bam", package = "Rsamtools"), system.file(
        "extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), sample_name_origin = "basename",
      groups.regex = c(case = ""), method = "count")
    Message <simpleMessage>
      Reading sample ex1
    Output
      exstra_score object with 7 observations of type ucsc ($data),
        for 1 samples. ($samples)
        Includes associated STR database of 1 locus. ($db)

