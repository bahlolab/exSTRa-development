data(exstra_wgs_pcr_2)
exstra_wgs_pcr_2_test <- exstra_wgs_pcr_2
test_that("Plotnames works", {
  expect_snapshot(plot_names(exstra_wgs_pcr_2))
  expect_snapshot( {
    plot_names(exstra_wgs_pcr_2_test) <- LETTERS[1:18]; 
    plot_names(exstra_wgs_pcr_2_test)
  })
})
