test_that("Read UCSC simple repeats file", {
  expect_snapshot(
    read_exstra_db(
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa")) 
  )
  
})

test_that("Read known repeats file", {
  expect_snapshot(
    read_exstra_db(
      system.file("extdata", "repeat_expansion_disorders_grch38.txt", 
                  package = "exSTRa"))
  )
})

test_that("read_exstra_db error catching", {
  expect_error(read_exstra_db(5), "file must be character")
  expect_error(read_exstra_db_ucsc(7), "file must be character")
  expect_error(read_exstra_db_known(TRUE), "file must be character")
})
