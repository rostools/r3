cran_link <- "https://cran.r-project.org/"
rstudio_dl_link <- "https://posit.co/download/rstudio-desktop/#download"

#' Runs checks on your system for R, RStudio, and Git.
#'
#' @name check_system
#' @return Prints information on given check.
NULL

#' @describeIn check_system Check version of R that is installed.
#' @export
check_r_version <- function() {
  allowed_versions <- samwise::get_allowed_r_versions()
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
  return(invisible(NULL))
}

#' @describeIn check_system Check version of RStudio that is installed.
#' @export
check_rstudio_version <- function() {
  allowed_versions <- samwise::get_allowed_rstudio_versions() |>
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
  return(invisible(NULL))

  # gh::gh("/repos/:owner/:repo/releases/", owner = "rstudio", repo = "rstudio")
  # Use gh package for this..?
}

#' @describeIn check_system Checks your computer's Git config settings.
#' @export
check_git_config <- function() {
  git_config_values <- list(
    name = get_git_config("user.name"),
    email = get_git_config("user.email")
  )
  git_config_values <- Filter(function(f) length(f) > 0, git_config_values)

  if (length(git_config_values) == 0) {
    ui_oops("Your name and email aren't configured in Git.")
    ui_todo("Please paste and run the below code in the RStudio Console.")
    ui_code_block("r3::setup_git_config()")
  } else if (length(git_config_values) == 1) {
    ui_oops("Your {names(git_config_values)} isn't configured in Git.")
    ui_todo("Please paste and run the below code in the RStudio Console.")
    ui_code_block("r3::setup_git_config()")
  } else {
    ui_done(
      c(
        "Your Git configuration is all setup!",
        "Git now knows that:",
        "- Your name is {ui_value(git_config_values$name)}",
        "- Your email is {ui_value(git_config_values$email)}"
      )
    )
  }

  return(invisible(NULL))
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
  hd_line("Checking RStudio version:")
  check_rstudio_version()
  hd_line("Checking Git config settings:")
  check_git_config()
  return(invisible(NULL))
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
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    usethis::ui_stop(
      "You aren't in the R project. Please open the R Project for the workshop and run this function again in the Console."
    )
  }
  if (
    !(fs::file_exists(fs::path(proj, "data-raw", "dime.zip")) &
      fs::dir_exists(fs::path(proj, "data-raw", "dime")))
  ) {
    cli::cli_abort(
      "The {.file data-raw/dime/} folder and {.file data-raw/dime.zip} don't exist. Please follow the instructions to download and unzip the dataset."
    )
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo(
    "Please copy and paste this output into the survey question:"
  )
  file_tree <- fs::dir_tree(proj, recurse = 2)
  return(invisible(file_tree))
}

#' @describeIn check_system For the advanced workshop: Check your project setup
#'   for the files and folders created during the pre-workshop tasks.
#' @export
check_project_setup_advanced <- function() {
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    cli::cli_abort(
      "You aren't in the R project. Please open the R Project for the workshop and run this function again in the Console."
    )
  }
  if (
    !(fs::file_exists(fs::path(proj, "data-raw", "nmr-omics.R")) &
      fs::dir_exists(fs::path(proj, "data-raw", "nmr-omics")) &
      fs::file_exists(fs::path(proj, "data", "lipidomics.csv")))
  ) {
    cli::cli_abort(
      "The folder {.path data-raw/nmr-omics/} and files {.path data-raw/nmr-omics.R} and {.path data/lipidomics.csv} don't exist. Please follow the instructions to download and process the dataset."
    )
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo(
    "Please copy and paste this output into the survey question:"
  )
  file_tree <- fs::dir_tree(proj, recurse = 2)
  return(invisible(file_tree))
}

one_year_ago <- function() {
  lubridate::today() - lubridate::years(1)
}
