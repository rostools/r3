#' Update r3's dependencies from the workshops' `DESCRIPTION` files
#'
#' Compares with all the workshops
#'
#' @returns Doesn't output anything, used for the side effect to update the
#'   `DESCRIPTION` file.
#' @export
#'
admin_update_deps <- function() {
  missing_deps <- missing_deps_r3()
  if (length(missing_deps) == 0) {
    cli::cli_alert_success(
      "All dependencies for the workshops are already in r3!"
    )
    return(invisible(NULL))
  }

  cli::cli_alert_info(
    "The following dependencies are missing from r3: {.val {missing_deps}}"
  )
  cli::cli_alert_info("Adding these dependencies to r3's DESCRIPTION file.")
  purrr::walk(missing_deps, usethis::use_package)
  cli::cli_alert_info(
    "Add them to the {.fn ignore_deps_check} function in {.path R/workshop-deps.R} to avoid CRAN check warnings/errors."
  )
  invisible(NULL)
}

workshops <- function() {
  c("r-cubed-intro", "r-cubed-intermediate", "r-cubed-advanced")
}

url_gh_raw_file <- function(repo, file) {
  paste0(
    "https://raw.githubusercontent.com/",
    repo,
    "/main/",
    file
  )
}
workshop_desc <- function() {
  workshops() |>
    purrr::map_chr(\(repo) {
      url_gh_raw_file(paste0("rostools/", repo), "DESCRIPTION")
    })
}

get_deps_workshop <- function(url) {
  description_text <- readLines(url)
  # -1 to remove the R dependency from the vector.
  desc::desc(text = description_text)$get_deps()$package |>
    stringr::str_subset("^R$", negate = TRUE)
}

get_deps_workshops <- function() {
  workshop_desc() |>
    purrr::map(get_deps_workshop) |>
    unlist() |>
    unique() |>
    stringr::str_subset(
      "samwise|r3|r3admin|tidyverse|igraph|htmltools|downlit",
      negate = TRUE
    )
}

get_deps_r3 <- function() {
  r3_desc <- rprojroot::is_r_package$find_file("DESCRIPTION")
  if (r3_desc == "" || !stringr::str_detect(r3_desc, "r3/DESCRIPTION")) {
    cli::cli_abort(
      "You need to run this function while in the {.pkg r3} project."
    )
  }
  desc::desc_get_deps()$package |>
    stringr::str_subset("^R$", negate = TRUE)
}

missing_deps_r3 <- function() {
  setdiff(get_deps_workshops(), get_deps_r3())
}


ignore_deps_check <- function() {
  # List just functions to avoid CRAN check warnings
  rmarkdown::yaml_front_matter
  xml2::as_list
  gitcreds::gitcreds_list
  targets::all_of
  tidyselect::contains
  tarchetypes::all_of
  targets::tar_read
  readxl::read_excel
  markdown::html_format
  commonmark::markdown_text
  broom::tidy
  roxygen2::parse_text
  readr::read_csv
  withr::with_options
  glue::glue
  snakecase::to_snake_case
  quarto::quarto_version
  styler::style_file
  hexbin::hexbin
  prodigenr::setup_project
  ggplot2::ggplot
  tidyr::as_tibble
  here::here
  magrittr::add
  vroom::vroom
}
