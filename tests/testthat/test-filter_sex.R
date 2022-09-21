data(exstra_wgs_pcr_2)
#exstra_wgs_pcr_2_p <- exstra_wgs_pcr_2 # weird hack needed for copy
exstra_wgs_pcr_2_sex <- copy(exstra_wgs_pcr_2)
exstra_wgs_pcr_2_sex$sample[10, sex := NA]

test_that("filter_sex()", {
  expect_snapshot(filter_sex(exstra_wgs_pcr_2))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "known"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "all"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "male"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "female"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2, "missing"))
  expect_snapshot(filter_sex(exstra_wgs_pcr_2_sex, "missing"))
  expect_error(filter_sex(exstra_wgs_pcr_2_sex, "female"), 
               "some samples have not been assigned a sex")
})
