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

#' @describeIn open_url Opens daily feedback survey for intro course.
#' @export
open_feedback_survey_intro <- function() {
    open_link("https://docs.google.com/forms/d/e/1FAIpQLSdhvOl7ifRIQouuv4jZVldJTcyrCTy935PTnTUlCsoF9WA_zA/viewform?usp=sf_link")
}

#' @describeIn open_url Opens daily feedback survey for intermediate course.
#' @export
open_feedback_survey_intermediate <- function() {
    open_link("https://docs.google.com/forms/d/e/1FAIpQLSd_C-enA4y8PNOehvpqbxBtknsRVzvIOCt_0fAGpDysJWb0FQ/viewform?usp=sf_link")
}

#' @describeIn open_url Opens daily feedback survey for advanced course.
#' @export
open_feedback_survey_advanced <- function() {
    open_link("https://docs.google.com/forms/d/e/1FAIpQLScwyqQJpuzoalyFQpiI3XjqWg6Aw8ox5ZFDJegYpmwNH0ekSQ/viewform?usp=sf_link")
}
