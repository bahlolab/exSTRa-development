data(exstra_wgs_pcr_2)
test_that("filter_sex()", {
  expect_snapshot(filter_sex(exstra_wgs_pcr_2))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "known"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "all"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "male"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "female"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "missing"))
})
