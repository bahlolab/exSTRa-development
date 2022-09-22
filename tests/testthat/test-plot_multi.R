data(exstra_wgs_pcr_2)
image_directory <- tempfile("example_images")
test_that("plot_multi()", {
  vdiffr::expect_doppelganger(
    "Plot multi FRDA", 
    fig = function() 
      plot_multi(exstra_wgs_pcr_2["FRDA"], 
                 prefix = "HiSeqXTen_WGS_PCR_2", 
                 plot_types = 1, alpha_case = 0.2)
  )
  expect_null(
    plot_multi(exstra_wgs_pcr_2[c("HD", "SCA6", "FRDA", "SCA1")], 
               dir = image_directory, prefix = "HiSeqXTen_WGS_PCR_2", 
               plot_types = 2, alpha_case = 0.2)
  )
  expect_null(
    plot_multi(exstra_wgs_pcr_2[c("SCA6", "FRDA"), 
                                c("WGSrpt_05", "WGSrpt_07", 
                                  "WGSrpt_19", "WGSrpt_11")], 
               prefix = "HiSeqXTen_WGS_PCR_2", alpha_case = 0.2,
               custom_legend = c(WGSrpt_05 = "red", WGSrpt_07 = "blue"),
               plot_cols = c(WGSrpt_05 = "red", WGSrpt_07 = "blue", 
                             WGSrpt_19 = "green"),
               plot_types = 3, dir = image_directory,
               color_only = list(
                 FRDA = c("WGSrpt_19"), SCA6 = c("WGSrpt_05", "WGSrpt_07")))
  )
  expect_error(
    plot_multi(exstra_wgs_pcr_2, 
               plot_types = 1,
               color_only = c(FRDA = "WGSrpt_19")),
    "color_only should be a list")
})
unlink(image_directory)

image_directory_tsum4 <- tempfile("example_images_tsum4")
test_that("plot_multi() should work on exstra_tsum objects (does not at present", {
  expect_error(
    plot_multi(tsum_4, dir = image_directory_tsum4, 
               prefix = "HiSeqXTen_WGS_PCR_2", alpha_case = 0.2))
})
unlink(image_directory_tsum4)
