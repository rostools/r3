open_link <- function(link) {
  utils::browseURL(link)
}

#' Opens daily feedback survey for the workshops.
#'
#' @return Nothing, used for the side effect of opening the survey link.
#' @export
open_feedback_survey <- function() {
  open_link("https://docs.google.com/forms/d/e/1FAIpQLScTbsxHSLrQxn38KS7kCklurFrccN8g3kVdm6WTSxEiIBypWg/viewform?usp=sf_link")
}
