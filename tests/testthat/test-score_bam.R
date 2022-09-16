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
  expect_equal(
    set_sample_names_score_bam(NULL, NGScopyData::tps_27.chr6()$bamFpath, 
                               "basename", "\\.chr6\\.sort", ".+"), 
    "tps_27")
})

test_that("score_bam()", {
  expect_s3_class(read_exstra_db(system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa")), "exstra_db")
  expect_snapshot(
    score_bam(
      system.file("extdata", "ex1.bam", package = "Rsamtools"), 
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"), 
      sample_name_origin = "basename", groups.regex = c("case" = ""))
  )
})