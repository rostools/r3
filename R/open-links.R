material_link <- "https://r-cubed.rostools.org/"
website_link <- "https://dda-rcourse.lwjohnst.com/"

open_link <- function(link) {
    utils::browseURL(link)
}

#' Opens a browser to course resources.
#'
#' @name open_url
NULL

#' @describeIn open_url Opens website for course material.
#' @export
open_course_material <- function() {
    open_link(material_link)
}

#' @describeIn open_url Opens website for DDA R course, March 2020.
#' @export
open_course_website <- function() {
    open_link(website_link)
}

#' @describeIn open_url Opens schedule for the DDA R course.
#' @export
open_schedule <- function() {
    link <- paste0(website_link, "#schedule")
    open_link(link)
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

#' @describeIn open_url Opens daily feedback survey.
#' @export
open_feedback_survey <- function() {
    open_link("https://docs.google.com/forms/d/e/1FAIpQLSdhvOl7ifRIQouuv4jZVldJTcyrCTy935PTnTUlCsoF9WA_zA/viewform?usp=sf_link")
}


# Chapters ----------------------------------------------------------------

open_chapter <- function(chapter) {
    link <- paste0(material_link, chapter)
    open_link(link)
}

#' @describeIn open_url Function to take you to the slides section.
#' @export
open_slides <- function() {
    open_chapter("lecture-slides")
}

#' @describeIn open_url Function to take you right to Project Management session.
#' @export
open_rproject_management <- function() {
    open_chapter("r-project-management")
}

#' @describeIn open_url Function to take you right to Version Control session.
#' @export
open_version_control <- function() {
    open_chapter("version-control")
}

#' @describeIn open_url Function to take you right to Data Management and Wrangling session.
#' @export
open_data_wrangling <- function() {
    open_chapter("wrangling")
}

#' @describeIn open_url Function to take you right to Data Visualization session.
#' @export
open_data_visualization <- function() {
    open_chapter("visualization")
}

#' @describeIn open_url Function to take you right to Reproducible Documents session.
#' @export
open_reproducible_documents <- function() {
    open_chapter("reproducible-documents")
}

#' @describeIn open_url Opens the Code of Conduct webpage.
#' @export
open_code_of_conduct <- function() {
    open_chapter("conduct")
}

#' @describeIn open_url Function to take you right to the Syllabus webpage.
#' @export
open_syllabus <- function() {
    open_chapter("index")
}

#' @describeIn open_url Function to take you to the group project.
#' @export
open_assignment <- function() {
    open_chapter("assignment")
}

# Do I need this?
open_precourse_tasks <- function() {
    open_chapter("pre-course")
}
