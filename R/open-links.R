material_link <- "https://r-cubed.rostools.org/"

open_link <- function(link) {
    utils::browseURL(link)
}

#' Opens a browser to course resources.
#'
#' @name open_url
NULL

#' @describeIn open_url Opens website for course material.
#' @export
open_intro_course_site <- function() {
    open_link(material_link)
}

#' @describeIn open_url Opens GitHub account creation website.
#' @export
open_github_join <- function() {
    open_link("https://github.com/join")
}

#' @describeIn open_url Opens pre-course survey.
#' @export
open_pre_survey <- function() {
    open_link("https://docs.google.com/forms/d/e/1FAIpQLSeuMe485zZXlG9uQlUgcgsWBJvpHUB_-bMVkEtA4moWK_oUoQ/viewform?usp=sf_link")
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

# Chapters ----------------------------------------------------------------

open_chapter <- function(chapter) {
    link <- paste0(material_link, chapter)
    open_link(link)
}

#' @describeIn open_url Function to take you to the slides section.
#' @export
open_intro_slides <- function() {
    open_chapter("lecture-slides")
}

#' @describeIn open_url Function to take you to the group project.
#' @export
open_intro_assignment <- function() {
    open_chapter("assignment")
}

# Do I need this?
open_precourse_tasks <- function() {
    open_chapter("pre-course")
}
