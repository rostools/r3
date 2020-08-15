
#' Create a basic R Markdown document in the doc folder.
#'
#' @return Creates an R Markdown file called `lesson.Rmd` in the `doc/` folder.
#' @export
#'
create_rmarkdown_doc <- function() {
    proj <- rstudioapi::getActiveProject()
    if (is.null(proj)) {
        usethis::ui_stop("You aren't in the R project. Please open the R project for the course and run this function again.")
    }
    new_rmd <- rmarkdown::draft(
        file = fs::path(proj, "doc", "lesson.Rmd"),
        template = "basic-rmd",
        package = "r3",
        edit = FALSE
    )
    if (!fs::file_exists(new_rmd)) {
        usethis::ui_stop("Not sure why, but the Rmd file was not created. Try restarting R and doing it again?")
    }
    usethis::ui_done("Created {usethis::ui_code('lesson.Rmd')} file in the {usethis::ui_code('doc/')} folder.")
    return(invisible(new_rmd))
}
