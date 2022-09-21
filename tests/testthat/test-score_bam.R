test_that("motif_cycle()", {
  expect_equal(motif_cycles("GATA"), c("GATA", "ATAG", "TAGA", "AGAT"))
})


test_that("score_overlap_method()", {
  expect_equal(score_overlap_method("TTCAGGCATT", "CAG"), 6)
  expect_equal(score_overlap_method("TTCAGCAGTT", "CAG"), 6)
  expect_equal(score_overlap_method("TTCAAGCATT", "CAG"), 4)
  expect_equal(score_overlap_method("CAGCAGCAGCA", "CAG"), 11)
})

test_that("score_count_method()", {
  expect_equal(score_count_method("TTCAGGCATT", "CAG"), 2)
  expect_equal(score_count_method("TTCAGCAGTT", "CAG"), 4)
  expect_equal(score_count_method("TTCAAGCATT", "CAG"), 2)
  expect_equal(score_count_method("CAGCAGCAGCA", "CAG"), 9)
})

test_that("set_sample_names_score_bam", {
  # Don't know of data set to test RG extraction
  skip_if_not_installed("NGScopydata")
  expect_equal(
    set_sample_names_score_bam(NULL, NGScopyData::tps_27.chr6()$bamFpath, 
                               "basename", "\\.chr6\\.sort", ".+"), 
    "tps_27")
})

ex1_db_rev <- read_exstra_db(system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"))
ex1_db_rev$db[, strand := "-"]

test_that("score_bam()", {
  skip_if_not_installed("Rsamtools")
  expect_snapshot(
    score_bam(
      system.file("extdata", "ex1.bam", package = "Rsamtools"), 
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), 
      sample_name_origin = "basename", groups.regex = c("case" = ""),
      verbosity = 2)
  )
  expect_snapshot(
    score_bam(
      system.file("extdata", "ex1.bam", package = "Rsamtools"), 
      ex1_db_rev, 
      sample_name_origin = "basename", groups.regex = c("case" = ""),
      qname = TRUE)
  )
  expect_snapshot(
    score_bam(
      system.file("extdata", "ex1.bam", package = "Rsamtools"), 
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), 
      sample_name_origin = "basename", groups.regex = c("case" = ""),
      method = "count")
  )
  expect_error(score_bam("fake", 5, groups.regex = c("case" = "")), 
               "not of a recognised type")
  expect_error(score_bam("fake", 
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"),
      groups.regex = c("case" = ""), sample_names = c("a", "b")), 
    "does not match length of 'paths'")
})

test_that("score_bam() parallel", {
  skip_if_not_installed("Rsamtools")
  expect_s3_class(
    score_bam(
      system.file("extdata", "ex1.bam", package = "Rsamtools"), 
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), 
      sample_name_origin = "basename", groups.regex = c("case" = ""),
      parallel = TRUE, cluster_n = 1),
    "exstra_score"
  )
})
