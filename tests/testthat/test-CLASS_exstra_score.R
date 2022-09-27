data("exstra_wgs_pcr_2")
exstra_wgs_pcr_2_sex <- copy(exstra_wgs_pcr_2)
exstra_wgs_pcr_2_sex$samples[1:9, sex := NA]
test_that("CLASS exstra_score", {
  expect_equal(as.exstra_score(exstra_wgs_pcr_2, copy = TRUE), exstra_wgs_pcr_2)
  expect_equal(dim(exstra_wgs_pcr_2), c(21, 18))
  expect_equal(
    dim(exstra_wgs_pcr_2["HD", c("WGSrpt_11", "WGSrpt_13")]), c(1, 2))
  expect_equal(length(exstra_wgs_pcr_2), 33072)
  expect_error(length(exstra_wgs_pcr_2) <- 9, "Cannot reassign length")
  vdiffr::expect_doppelganger(
    "SCA1 ECDF xlim", 
    fig = function() plot(exstra_wgs_pcr_2["SCA1"], xlim = c(90, 140))
  )
  vdiffr::expect_doppelganger(
    "FRAXA males ECDF", 
    fig = function() 
      plot(exstra_wgs_pcr_2["FRAXA"], xlinked = "male")
  )
  vdiffr::expect_doppelganger(
    "FRAXA both test ECDF", 
    fig = function() 
      plot(exstra_wgs_pcr_2_sex["FRAXA"], xlinked = "both", 
           xlinked.safe = FALSE, main = "FRAXA both assigned (test)")
  )
  expect_equal(
    plot_names(exstra_wgs_pcr_2, names = c("WGSrpt_11", "WGSrpt_13")),
    c("11", "13")
  )
})

