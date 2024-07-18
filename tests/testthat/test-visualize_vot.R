test_that("visualize_vot works correctly", {
  before <- c(100, 102, 98, 105, 110)
  after <- c(95, 100, 97, 102, 108)

  plot <- visualize_vot(before, after)

  # Check that the output is a ggplot object
  expect_s3_class(plot, "ggplot")
})
