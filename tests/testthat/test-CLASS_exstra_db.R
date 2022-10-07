data(exstra_wgs_pcr_2)
data(exstra_known)

test_that("is.exstra_db() works", {
  expect_true(is.exstra_db(exstra_known))
  expect_true(is.exstra_db(exstra_wgs_pcr_2))
  expect_false(is.exstra_db(pi))
})

test_that("exstra_db_new_() works", {
  expect_error(exstra_db_new_(5))
  expect_true(inherits(exstra_db_new_(exstra_known$db), "exstra_db"))
  expect_true(inherits(exstra_db_new_(setnames(copy(exstra_known$db), "locus", "disease.symbol")), "exstra_db"))
})

test_that("print.exstra_db() works", {
  expect_output(print(exstra_known), "exstra_db object with 21 loci \\(\\$db\\) of type named")
})

test_that("loci on exstra_db works", {
  expect_true(all(is.element(loci(exstra_known), exstra_known$db$locus)))
  expect_true(all(is.element(exstra_known$db$locus, loci(exstra_known))))
})

exstra_known_bad <- exstra_known
exstra_known_bad$input_type <- "broken"

test_that("exstra_db loci function errors", {
  expect_error(
    loci_text_info(exstra_known_bad, "HD"),
    "Unrecognised input_type in exstra_db"
  )
  expect_error(
    loci_normal_exp(exstra_known_bad, "HD"),
    "Unrecognised input_type in exstra_db"
  )
})

# loci_text_info.exstra_db
db_ucsc <- read_exstra_db(
  system.file("extdata", "ex1_dummy_repeat.txt", package = "exSTRa")
)

test_that("loci_text_info", {
  expect_equal(loci_text_info(db_ucsc, "seq1:21-60:AG"), "seq1:21-60:AG")
})

test_that("loci size", {
  expect_equal(loci_normal(exstra_known, "HD"), 63)
  expect_equal(loci_min_exp(exstra_known, "SCA1"), 117)
  expect_equal(loci_normal_exp(exstra_known, "FRDA"), c(20, 600))
  expect_equal(loci_normal_exp(db_ucsc, "seq1:21-60:AG"), c(40, NA))
})

# `[.exstra_db`
test_that("subsetting", {
  expect_equal(exstra_known["HD"]$db[, long_name], "Huntington disease")
})

# verify.exstra_db()
X_verify <- copy(exstra_known)
setkey(X_verify$db, "motif")
test_that("verify.exstra_db() works", {
  local_edition(2)
  expect_true(verify.exstra_db(exstra_known))
  expect_error(verify.exstra_db(X_verify))
  expect_error(verify.exstra_db(6))
})
