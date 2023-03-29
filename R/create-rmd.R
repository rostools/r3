#' Create document in the doc folder.
#'
#' Make a draft of either an R Markdown document or a Quarto document
#'
#' @name create_doc
#' @return Creates a Markdown document in the `doc/` folder.
#'
NULL

#' @describeIn create_doc Creates a simple draft of a Quarto document.
#' @export
create_qmd_doc <- function() {
  create_generic_doc("basic-qmd")
}

#' @describeIn create_doc Creates a simple draft of a R Markdown document.
#' @export
create_rmd_doc <- function() {
  create_generic_doc("basic-rmd")
}

create_generic_doc <- function(template_name = c("basic-rmd", "basic-qmd")) {
  proj <- usethis::proj_path()
  if (is.null(proj)) {
    cli::cli_abort("You aren't in the R Project. Please open the R Project for the course and run this function again.")
  }
  new_file_name <- fs::path(proj, "doc", "learning")
  template_name <- rlang::arg_match(template_name)
  new_file_name <- switch(template_name,
    "basic-rmd" = fs::path_ext_set(new_file_name, ".Rmd"),
    "basic-qmd" = fs::path_ext_set(new_file_name, ".qmd")
  )
  if (!fs::dir_exists(fs::path(proj, "doc"))) {
    fs::dir_create(fs::path(proj, "doc"))
  }
  fs::file_copy(
    path_package_template("basic-rmd"),
    new_file_name
  )
  cli::cli_alert_success("Created {.val {fs::path_file(new_file_name)}} file in the {.val doc/} folder.")
  return(invisible(new_file_name))
}

path_package_template <- function(template_name) {
  fs::dir_ls(
    fs::path_package("r3", "rmarkdown", "templates",
                     template_name, "skeleton"),
    regexp = "\\.[Rq]md$"
  )
}
