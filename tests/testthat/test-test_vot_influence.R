test_that("test_vot_influence works correctly", {
  before <- c(100, 102, 98, 105, 110)
  after <- c(95, 100, 97, 102, 108)

  result <- test_vot_influence(before, after)

  # Check the class of the result
  expect_s3_class(result, "data.frame")

  # Check if the ANOVA table has the expected structure
  expect_true("F" %in% colnames(result))
  expect_true("Pr(>F)" %in% colnames(result))
})
