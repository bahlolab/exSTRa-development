tsum_4_p_over_1 <- copy(tsum_4)
tsum_4_p_over_1$stats[70, p.value := 2]
tsum_4_p_under_0 <- copy(tsum_4)
tsum_4_p_under_0$stats[70, p.value := -1]

test_that("tsum_p_value_summary() tests", {
  expect_snapshot(tsum_p_value_summary(tsum_4))
  expect_error(tsum_p_value_summary(tsum_4_p_over_1), "appear to be above 1")
  expect_error(tsum_p_value_summary(tsum_4_p_under_0), "appear to be below 0")
})
