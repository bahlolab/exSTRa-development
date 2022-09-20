suggested_file <- tempfile(fileext = ".svg")
test_that("suggested_exstra_pipeline() check", {
  expect_null(suggested_exstra_pipeline())
  expect_null(suggested_exstra_pipeline(suggested_file, show.with.file = TRUE))
})
