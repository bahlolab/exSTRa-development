data(exstra_wgs_pcr_2)
test_that("ggplot() and ggexstra_ecdf()", {
  vdiffr::expect_doppelganger("SCA1 ECDF ggplot2",
    fig = function() ggexstra_ecdf(exstra_wgs_pcr_2["SCA1"])
  )
})
