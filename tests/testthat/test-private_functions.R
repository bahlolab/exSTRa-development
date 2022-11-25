test_that("make_quantiles_matrix()", {
  expect_equal(2 * 2, 4)
  expect_warning(
    make_quantiles_matrix(exstra_wgs_pcr_2[c("HD", "SCA1")],
      method = "quantile7"
    ),
    "More than one locus has been passed to make_quantiles_matrix"
  )
  expect_error(
    make_quantiles_matrix(exstra_wgs_pcr_2[c("HD")]),
    "Please choose type for quantile with method"
  )
  expect_error(
    make_quantiles_matrix(exstra_wgs_pcr_2[c("HD")], method = "sdsa"),
    "Undefined method sdsa"
  )
})
