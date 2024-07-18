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

