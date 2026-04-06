#' Create document in the `docs/` folder.
#'
#' Make a draft of a Quarto document to use for the workshops.
#'
#' @name create_qmd
#' @returns Creates a Quarto Markdown document in the `docs/` folder.
NULL

#' @describeIn create_qmd Create a `learning.qmd` file in the `docs/` folder.
#' @export
create_learning_qmd <- function() {
  create_common_qmd("learning.qmd")
}

#' @describeIn create_qmd Create a `cleaning.qmd` file in the `docs/` folder.
#' @export
create_cleaning_qmd <- function() {
  create_common_qmd("cleaning.qmd")
}

#' @describeIn create_qmd Create a `sandbox.qmd` file in the `docs/` folder.
#' @export
create_sandbox_qmd <- function() {
  create_common_qmd("sandbox.qmd")
}

create_common_qmd <- function(output_file = "basic.qmd") {
  proj <- usethis::proj_path()
  if (is.null(proj)) {
    cli::cli_abort(
      "You aren't in the R Project. Please open the R Project for the workshop and run this function again."
    )
  }
  new_file_name <- fs::path(proj, "docs", output_file)
  if (!fs::dir_exists(fs::path(proj, "docs"))) {
    fs::dir_create(fs::path(proj, "docs"))
  }
  fs::file_copy(
    fs::path_package(
      "r3",
      "templates",
      "common.qmd"
    ),
    new_file_name
  )
  cli::cli_alert_success(
    "Created {.val {fs::path_file(new_file_name)}} file in the {.val docs/} folder."
  )
  invisible(new_file_name)
}
