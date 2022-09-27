data(exstra_wgs_pcr_2)
exstra_wgs_pcr_2_p <- exstra_wgs_pcr_2
exstra_wgs_pcr_2_copy <- copy(exstra_wgs_pcr_2_p)
exstra_wgs_pcr_2_copy$sample[10, sex := NA]
exstra_wgs_pcr_2_copy$data[7074, group := NA]
exstra_wgs_pcr_2_copy$db[1, locus := NA]

tsum_4_copy <- copy(tsum_4)
tsum_4_copy$stats[70, B := NA]
tsum_4_copy$data[7074, group := NA]
tsum_4_copy$sample[10, sex := NA]
tsum_4_copy$db[1, locus := NA]

test_that("copy", {
  expect_false(any(is.na(exstra_wgs_pcr_2$samples$sex)))
  expect_false(any(is.na(exstra_wgs_pcr_2$data$group)))
  expect_false(any(is.na(exstra_wgs_pcr_2$db$locus)))
  expect_false(any(is.na(tsum_4$stats$B)))
  expect_false(any(is.na(tsum_4$samples$sex)))
  expect_false(any(is.na(tsum_4$data$group)))
  expect_false(any(is.na(tsum_4$db$locus)))
})
