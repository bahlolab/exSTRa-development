test_that("Read UCSC simple repeats file", {
  expect_s3_class(
    read_exstra_db(
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa")), 
    "exstra_db"
  )
})

test_that("Read known repeats file", {
  expect_s3_class(
    read_exstra_db(
      system.file("extdata", "repeat_expansion_disorders_grch38.txt", 
                  package = "exSTRa")),
    "exstra_db"
  )
})
