open_link <- function(link) {
    utils::browseURL(link)
}

#' Opens a browser to course resources.
#'
#' @name open_url
NULL

#' @describeIn open_url Opens GitHub account creation website.
#' @export
open_github_join <- function() {
    open_link("https://github.com/join")
}

#' @describeIn open_url Opens daily feedback survey for all courses.
#' @export
open_feedback_survey <- function() {
  open_link("https://docs.google.com/forms/d/e/1FAIpQLScTbsxHSLrQxn38KS7kCklurFrccN8g3kVdm6WTSxEiIBypWg/viewform?usp=sf_link")
}

#' @describeIn open_url Opens daily feedback survey for intro course.
#' @export
open_feedback_survey_intro <- function() {
    open_feedback_survey()
}

#' @describeIn open_url Opens daily feedback survey for intermediate course.
#' @export
open_feedback_survey_intermediate <- function() {
    open_feedback_survey()
}

#' @describeIn open_url Opens daily feedback survey for advanced course.
#' @export
open_feedback_survey_advanced <- function() {
    open_feedback_survey()
}
