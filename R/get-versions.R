#' Get a list of the allowed R versions for the rostools workshops.
#'
#' The allowed versions are those that are at maximum a year old from today,
#' sorted by the oldest first.
#'
#' @return A character vector of allowed R versions.
#' @export
#'
#' @examples
#' get_allowed_r_versions()
get_allowed_r_versions <- function() {
  if (!rlang::is_installed("rversions")) {
    cli::cli_abort(
      "The {.pkg rversions} package is required for this function. Please install it with {.code install.packages('rversions')} and try again."
    )
  }
  rversions::r_versions() |>
    dplyr::filter(
      date >= one_year_ago()
    ) |>
    dplyr::pull(version)
}

#' Get a list of the allowed RStudio versions for the rostools workshops.
#'
#' The versions are those that are at a maximum one year old from today,
#' sorted by the oldest first.
#'
#' @return A character vector of allowed RStudio versions.
#' @export
#'
#' @examples
#' get_allowed_rstudio_versions()
get_allowed_rstudio_versions <- function() {
  if (!rlang::is_installed("gh")) {
    cli::cli_abort(
      "The {.pkg gh} package is required for this function. Please install it with {.code install.packages('gh')} and try again."
    )
  }
  # https://posit.co/wp-content/uploads/downloads.json
  versions <- gh::gh(
    "/repos/:owner/:repo/tags",
    owner = "rstudio",
    repo = "rstudio"
  ) |>
    purrr::map_chr("name") |>
    stringr::str_subset("\\d{4}\\.\\d{2}")

  tibble::tibble(
    version = versions,
    date = versions |>
      stringr::str_extract("\\d{4}\\.\\d{2}") |>
      stringr::str_c(".01") |>
      lubridate::as_date()
  ) |>
    dplyr::filter(
      date >= one_year_ago()
    ) |>
    dplyr::arrange(date) |>
    dplyr::pull(version)
}

one_year_ago <- function() {
  lubridate::today() - lubridate::years(1)
}
