#' Create document in the `docs/` folder.
#'
#' Make a draft of a Quarto document to use for the workshops.
#'
#' @return Creates a Quarto Markdown document in the `docs/` folder.
#' @export
#'
create_qmd_doc <- function() {
  proj <- usethis::proj_path()
  if (is.null(proj)) {
    cli::cli_abort("You aren't in the R Project. Please open the R Project for the course and run this function again.")
  }
  new_file_name <- fs::path(proj, "docs", "learning.qmd")
  if (!fs::dir_exists(fs::path(proj, "docs"))) {
    fs::dir_create(fs::path(proj, "docs"))
  }
  fs::file_copy(
    fs::path_package(
      "r3", "templates", "learning.qmd"
    ),
    new_file_name
  )
  cli::cli_alert_success("Created {.val {fs::path_file(new_file_name)}} file in the {.val docs/} folder.")
  return(invisible(new_file_name))
}
