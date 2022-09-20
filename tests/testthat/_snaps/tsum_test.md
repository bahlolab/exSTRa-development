# tsum_test()

    Code
      print(tsum_test(exstra_wgs_pcr_2[c("HD", "SCA6", "SCA1", "FRDA")]))
    Message <simpleMessage>
      Working on locus HD
      Working on locus SCA1
      Working on locus SCA6
      Working on locus FRDA
    Output
      exstra_tsum object with 72 T sum statistics ($stats),
        with p-values calculated ($stats),
        over 4 loci. ($db)
      
          T sum statistics summary:
          exSTRa T := sum of two sample t-tests
      
      Alternative hypotheses: subject sample has a larger allele than background samples.
      
      alpha  Bonferroni unadjusted
      0.0001          0          7 
      0.001           0          1 
      0.01            7          0 
      0.05            1          2 
      1              64         62 
      NA              0          0 
      
      Number of samples: 18 
      Number of loci:    4 
      Defined p-values:  72 
      NA p-values:       0 
      Function arguments: trim = 0.15, min.quant = 0.5, B = 999

---

    Code
      tsum_test(exstra_wgs_pcr_2[c("SCA1")], case_control = TRUE)
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
      0.05            0          9 
      1              16          7 
      NA              0          0 
      
      Number of samples: 18 
      Number of loci:    1 
      Defined p-values:  16 
      NA p-values:       0 
      Function arguments: trim = 0, min.quant = 0.5, B = 999

