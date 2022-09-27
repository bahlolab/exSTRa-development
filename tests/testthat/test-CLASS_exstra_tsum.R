test_that("exstra_tsum plots", {
  expect_null(plot(Tsum_stats))
  expect_null(plot(tsum_4))
  vdiffr::expect_doppelganger("Tsum_stats plot", 
                              fig = function() plot(Tsum_stats["SCA6"]))
  vdiffr::expect_doppelganger(
    "tsum_4 plots with sample correction", 
    fig = function() 
      plot(tsum_4["FRDA"], 
           sample_col = c(WGSrpt_19 = "red", WGSrpt_09 = "green", 
                          WGSrpt_11 = "blue"), 
           correction = "sample")
  )
  vdiffr::expect_doppelganger(
    "tsum_4 plots with 0.1 alpha", 
    fig = function() 
      plot(tsum_4["FRDA"], 
        sample_col = c(WGSrpt_19 = "blue", WGSrpt_09 = "red", 
                       WGSrpt_11 = "blue"), 
           alpha = 0.1)
  )
})

test_that("Extract exstra_tsum", {
  expect_equal(tsum_4[, "WGSrpt_11"]$samples$sample, "WGSrpt_11")
  expect_equal(tsum_4["HD", ]$db$locus, "HD")
  expect_snapshot(tsum_4["HD", "WGSrpt_11"])
})
