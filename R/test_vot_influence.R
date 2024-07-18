#' Test Influence of Stimuli on VOT
#'
#' This function performs an ANOVA to test if the auditory stimuli have a significant influence on Voice Onset Time (VOT).
#'
#' @param before A numeric vector representing VOT values of 9 speakers before they perceived auditory stimuli.
#' @param after A numeric vector representing VOT values of 9 speakers after they perceived auditory stimuli.
#' @return An ANOVA table and a statement about the significance.
#' @examples
#' before <- c(100, 102, 98, 105, 110)
#' after <- c(95, 100, 97, 102, 108)
#' test_vot_influence(before, after)
#' @export

test_vot_influence <- function(before, after) {
  if (length(before) != length(after)) {
    stop("Both 'before' and 'after' must be numeric vectors of the same length.")
  }

  library(afex)
  library(dplyr)

  # Combine 'before' and 'after' into 'vot'
  vot <- c(before, after)

  # Create 'posn' and 'vpn' factors
  posn <- factor(rep(c("before", "after"), each = length(vot)/2))
  vpn <- factor(rep(1:(length(vot)/2), times = 2))

  # Create data frame
  data <- data.frame(vot = vot, posn = posn, vpn = vpn)

  # Perform ANOVA
  aov_result <- aov_4(vot ~ posn + (posn | vpn), data = data)

  # Get ANOVA summary
  anova_result <- anova(aov_result)

  # Extract degrees of freedom and F-value
  df <- anova_result$Df[2]
  f_value <- anova_result$F[1]
  p_value <- anova_result$`Pr(>F)`[1]

  # Check significance
  if (p_value < 0.05) {
    print(paste("The stimuli have a significant effect on VOT (F[", df, "]= ", format(f_value, digits = 2), ", p<0.05).", sep = ''))
  } else {
    print("The stimuli do not have a significant effect on VOT (p >= 0.05).")
  }

  return(anova_result)
}
