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
  latest_version <- dplyr::filter(rversions::r_versions(), version > "4.0.0")$version
  current_version <- as.character(getRversion())
  if (current_version %in% latest_version) {
    ui_done("Your R is at the latest version of {current_version}!")
  } else {
    ui_oops("Your version of R is {current_version}, but you need at least {latest_version[1]}.")
    ui_todo("You need to update your R version, please download the newest version at {ui_value(cran_link)}.")
  }
  return(invisible(NULL))
}

#' @describeIn check_system Check version of RStudio that is installed.
#' @export
check_rstudio_version <- function() {
  minimum_version <- "2023.06.2"
  if (!rstudioapi::isAvailable(minimum_version)) {
    cli::cli_alert_danger("Your version of RStudio is {.val {rstudioapi::getVersion()}}, but you need at least {.val minimum_version}.")
    cli::cli_ul("Please update your RStudio at {.val {rstudio_dl_link}}.")
  } else {
    ui_done("Your RStudio is at the latest version of {rstudioapi::getVersion()}!")
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

#' @describeIn check_system Check your setup in preparation for the r-cubed course.
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
check_project_setup <- function() {
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    usethis::ui_stop("You aren't in the R project. Please open the R Project for the course and run this function again in the Console.")
  }
  if (!(fs::file_exists(fs::path(proj, "data-raw", "mmash-data.zip")) &
    fs::dir_exists(fs::path(proj, "data-raw", "mmash")))) {
    usethis::ui_stop("The mmash folder and mmash-data don't exist. Please follow the instructions to download and unzip the dataset.")
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo("Please copy and paste this output into the survey question:")
  file_tree <- fs::dir_tree(proj, recurse = 2)
  return(invisible(file_tree))
}

#' @describeIn check_system For the Advanced Course: Check your project setup
#'   for the files and folders created during the pre-course tasks.
#' @export
check_project_setup_advanced <- function() {
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    cli::cli_abort("You aren't in the R project. Please open the R Project for the course and run this function again in the Console.")
  }
  if (!(fs::file_exists(fs::path(proj, "data-raw", "nmr-omics.R")) &
    fs::dir_exists(fs::path(proj, "data-raw", "nmr-omics")) &
    fs::file_exists(fs::path(proj, "data", "lipidomics.csv")))) {
    cli::cli_abort("The folder {.path data-raw/nmr-omics/} and files {.path data-raw/nmr-omics.R} and {.path data/lipidomics.csv} don't exist. Please follow the instructions to download and process the dataset.")
  }
  hd_line("Show folders and files of project:")
  usethis::ui_todo("Please copy and paste this output into the survey question:")
  file_tree <- fs::dir_tree(proj, recurse = 2)
  return(invisible(file_tree))
}
