#' Visualize VOT Differences
#'
#' This function creates a boxplot to visualize the difference in Voice Onset Time (VOT) before and after the auditory stimuli, in order to to check if the stimuli had an influence on VOT.
#'
#' @param before A numeric vector representing VOT values of 9 speakers before they perceived auditory stimuli.
#' @param after A numeric vector representing VOT values of 9 speakers after they perceived auditory stimuli.
#' @return A ggplot object showing the boxplot of differences.
#' @examples
#' before <- c(100, 102, 98, 105, 110)
#' after <- c(95, 100, 97, 102, 108)
#' visualize_vot(before, after)
#' @export

visualize_vot <- function(before, after) {
  if (length(before) != length(after)) {
    stop("Both 'before' and 'after' must be numeric vectors of the same length.")
  }

  library(ggplot2)
  library(dplyr)

  # Calculate differences
  d <- before - after

  # Create a data frame
  data <- data.frame(d = d)

  # Generate boxplot
  p <- data %>%
    ggplot(aes(y = d)) +
    geom_boxplot() +
    labs(title = "Boxplot of VOT Differences", y = "Difference in VOT before and after the stimuli (ms)") +
    theme_minimal()

  return(p)
}
