cran_link <- "https://cran.r-project.org/"
rstudio_dl_link <- "https://posit.co/download/rstudio-desktop/#download"

#' Runs checks on your system for R, RStudio, and Git.
#'
#' @name check_system
#' @returns Prints information on given check.
NULL

#' @describeIn check_system Check version of R that is installed.
#' @export
check_r_version <- function() {
  allowed_versions <- get_allowed_r_versions()
  current_version <- as.character(getRversion())
  if (current_version %in% allowed_versions) {
    cli::cli_alert_success(
      "Your R is at the latest version of {current_version}!"
    )
  } else {
    cli::cli_alert_danger(
      "Your version of R is {.val {current_version}}, but you need at least {.val {allowed_versions[1]}}."
    )
    cli::cli_ul(
      "Please update your R version by downloading the newest version at {.href {cran_link}}."
    )
  }
  invisible(NULL)
}

#' @describeIn check_system Check version of RStudio that is installed.
#' @export
check_rstudio_version <- function() {
  allowed_versions <- get_allowed_rstudio_versions() |>
    stringr::str_replace_all("\\+", ".") |>
    stringr::str_remove("v")
  current_version <- as.character(rstudioapi::getVersion()) |>
    stringr::str_replace("^(\\d{4})\\.([1-9])\\.", "\\1.0\\2.")
  if (!current_version %in% allowed_versions) {
    cli::cli_alert_danger(
      "Your version of RStudio is {.val {rstudioapi::getVersion()}}, but you need at least {.val minimum_version}."
    )
    cli::cli_ul("Please update your RStudio at {.href {rstudio_dl_link}}.")
  } else {
    cli::cli_alert_success(
      "Your RStudio is at the latest version of {.val {rstudioapi::getVersion()}}!"
    )
  }
  invisible(NULL)
}

#' @describeIn check_system Checks your computer's Git config settings.
#' @export
check_git_config <- function() {
  config <- get_git_user_config()
  config_set <- has_git_config(config)

  if (!config_set) {
    cli::cli_abort(
      c(
        "Your name and/or email aren't configured in Git.",
        "*" = "Paste and run this code in the RStudio Console (or click to run): {.run r3::setup_git_config()}"
      )
    )
  }
  cli::cli_bullets(
    c(
      "Your Git configuration is all setup! Git knows that:",
      "*" = "Your name is {ui_value(config$name)}",
      "*" = "Your email is {ui_value(config$email)}"
    )
  )

  invisible(NULL)
}

# Whether both user and email are set.
has_git_config <- function(config) {
  !all(length(config) == 0, length(config) == 1)
}

get_git_user_config <- function() {
  list(
    name = get_git_config("user.name"),
    email = get_git_config("user.email")
  ) |>
    purrr::keep(\(f) length(f) > 0)
}

get_git_config <- function(name) {
  config <- gert::git_config_global()
  config$value[which(config$name == name)]
}

#' @describeIn check_system Check your setup in preparation for the workshop.
#' @export
check_setup <- function() {
  hd_line("Checking R version:")
  check_r_version()
  hd_line("\nChecking RStudio version:")
  check_rstudio_version()
  hd_line("\nChecking Git config settings:")
  check_git_config()
  invisible(NULL)
}

# From usethis:::hd_line
hd_line <- function(name) {
  cat_line <- function(...) {
    lines <- paste0(..., "\n")
    cat(lines, sep = "")
  }
  cat_line(crayon::bold(name))
}

#' @describeIn check_system Check your project setup for the files and folders created.
#' @export
check_project_setup_intermediate <- function() {
  proj <- fs::path_wd()
  check_in_rproj(proj)
  if (
    !(fs::file_exists(fs::path(proj, "data-raw", "nurses-stress.tar")) &
      fs::dir_exists(fs::path(proj, "data-raw", "nurses-stress")))
  ) {
    cli::cli_abort(
      "The {.file data-raw/nurses-stress/} folder and {.file data-raw/nurses-stress.tar} don't exist. Please follow the instructions to download and unzip the dataset."
    )
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo(
    "Please copy and paste this output into the survey question:"
  )
  file_tree <- fs::dir_tree(proj, recurse = 2)
  invisible(file_tree)
}

#' @describeIn check_system For the advanced workshop: Check your project setup
#'   for the files and folders created during the pre-workshop tasks.
#' @export
check_project_setup_advanced <- function() {
  proj <- fs::path_wd()
  check_in_rproj(proj)
  if (
    !(fs::file_exists(fs::path(proj, "data-raw", "cv-risk.R")) &
      fs::file_exists(fs::path(proj, "data", "cv-risk.csv")))
  ) {
    cli::cli_abort(
      "The files {.path data-raw/cv-risk.R} and {.path data/cv-risk.csv} don't exist. Please follow the instructions to download and save the dataset."
    )
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo(
    "Please copy and paste this output into the survey question:"
  )
  file_tree <- fs::dir_tree(proj, recurse = 2)
  invisible(file_tree)
}

one_year_ago <- function() {
  lubridate::today() - lubridate::years(1)
}

# Whether working directory is in an R Project
check_in_rproj <- function(path) {
  rproj_path <- path |>
    fs::dir_ls(glob = "*.Rproj")

  if (is.null(rproj_path) || length(rproj_path) == 0) {
    cli::cli_abort(
      "You aren't in the R project. Please open the R Project for the workshop and run this function again in the Console."
    )
  }
}
