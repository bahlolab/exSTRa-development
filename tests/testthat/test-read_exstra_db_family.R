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

tf1 <- tempfile("wrong", fileext = ".txt")
write.table(data.frame(dog = 5, cw = 9), tf1, quote = FALSE, sep = "\t", row.names = FALSE, col.names = FALSE)

tf2 <- tempfile("nohead", fileext = ".txt")
ucsc_lines <- readLines(system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa"))
writeLines(ucsc_lines[-1], tf2)

test_that("read_exstra_db error catching", {
  expect_error(read_exstra_db(5), "file must be character")
  expect_error(read_exstra_db_ucsc(7), "file must be character")
  expect_error(read_exstra_db_known(TRUE), "file must be character")
  expect_error(purrr::quietly(read_exstra_db)(tf1), "17 is not TRUE")
  expect_equal(
    read_exstra_db(tf2), 
    read_exstra_db(
      system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa")
    )
  )
  expect_error(read_exstra_db("file.xlsx"), "no longer supported")
})
