# tsum_test()

    Code
      print(tsum_test(exstra_wgs_pcr_2[c("HD", "SCA6", "SCA1", "FRDA", "SCA3")]))
    Message <simpleMessage>
      Working on locus HD
      Working on locus SCA1
      Working on locus SCA3
          Reduced replicates to 62.
      Working on locus SCA6
      Working on locus FRDA
    Output
      exstra_tsum object with 90 T sum statistics ($stats),
        with p-values calculated ($stats),
        over 5 loci. ($db)
      
          T sum statistics summary:
          exSTRa T := sum of two sample t-tests
      
      Alternative hypotheses: subject sample has a larger allele than background samples.
      
      alpha  Bonferroni unadjusted
      0.0001          0          7 
      0.001           0          1 
      0.01            7          0 
      0.05            0          3 
      1              83         79 
      NA              0          0 
      
      Number of samples: 18 
      Number of loci:    5 
      Defined p-values:  90 
      NA p-values:       0 
      Function arguments: trim = 0.15, min.quant = 0.5, B = 999

---

    Code
      tsum_test(exstra_wgs_pcr_2[c("SCA1")], case_control = TRUE, early_stop = FALSE)
    Warning <simpleWarning>
      Trimming at each quantile only leaves 2 observations at each level.
      May have too few control samples (n = 2).
      Same tsum statistics may be NaN.
    Message <simpleMessage>
      Working on locus SCA1
    Output
      exstra_tsum object with 16 T sum statistics ($stats),
        with p-values calculated ($stats),
        over 1 locus. ($db)
      
          T sum statistics summary:
          exSTRa T := sum of two sample t-tests
      
      Alternative hypotheses: subject sample has a larger allele than background samples.
      
      alpha  Bonferroni unadjusted
      0.0001          0          0 
      0.001           0          0 
      0.01            0          0 
      0.05            0          6 
      1              16         10 
      NA              0          0 
      
      Number of samples: 18 
      Number of loci:    1 
      Defined p-values:  16 
      NA p-values:       0 
      Function arguments: trim = 0, min.quant = 0.5, B = 999

---

    Code
      tsum_test(exstra_wgs_pcr_2["FRAXE"])
    Message <simpleMessage>
      Working on locus FRAXE
    Output
      exstra_tsum object with 18 T sum statistics ($stats),
        with p-values calculated ($stats),
        over 1 locus. ($db)
      
          T sum statistics summary:
          exSTRa T := sum of two sample t-tests
      
      Alternative hypotheses: subject sample has a larger allele than background samples.
      
      alpha  Bonferroni unadjusted
      0.0001          0          1 
      0.001           0          1 
      0.01            2          0 
      0.05            0          0 
      1              15         15 
      NA              1          1 
      
      Number of samples: 18 
      Number of loci:    1 
      Defined p-values:  17 
      NA p-values:       1 
      Function arguments: trim = 0.15, min.quant = 0.5, B = 999

