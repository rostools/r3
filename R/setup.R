#' Set the user's git configuration.
#'
#' @return Modifies global git configuration.
#' @export
#'
setup_git_config <- function() {
  # TODO: Run check to make sure not to overwrite if it exists.
  user_name <- rstudioapi::showPrompt(
    "What is your name?",
    "Please type out your full name (e.g. first middle last)."
  )
  user_email <- rstudioapi::showPrompt(
    "What is your email?",
    "Type out your email. It's recommended to use an email like Gmail, as you always have access to it."
  )
  usethis::use_git_config(
    "user",
    user.name = user_name,
    user.email = user_email,
    init.defaultBranch = "main"
  )
  setup_git_settings()
}

# TODO: remove this function after course.
#' Set some Git config settings like main as default and rebase as false.
#'
#' @return Invisible, values of previous settings.
#' @export
#'
setup_git_settings <- function() {
  usethis::use_git_config(
    scope = "user",
    pull.rebase = FALSE,
    init.defaultBranch = "main"
  )
}

#' Setup the R project file to simplify learning in the course.
#'
#' @return Invisibly outputs the contents of the `.Rproj` file. Writes to file
#'   as side effect.
#' @export
#'
setup_rproj <- function() {
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    cli::cli_abort("You aren't in the R project. Please open the R Project for the course and run this function again in the Console.")
  }

  rproj_filepath <- fs::dir_ls(proj, regexp = "^.*\\.Rproj")
  rproj <- readLines(rproj_filepath) |>
    set_rproj_tab_spaces_to_2() |>
    set_rproj_native_pipe()

  writeLines(rproj, rproj_filepath)
  cli::cli_inform("Now using 2 spaces for a tab along with the native R pipe ({.val |>}).")
  invisible(rproj)
}

set_rproj_tab_spaces_to_2 <- function(text) {
  if (sum(stringr::str_detect(text, "UseSpacesForTab|NumSpacesForTab")) == 2) {
    text <- text |>
      stringr::str_replace("UseSpacesForTab.*", "UseSpacesForTab: Yes") |>
      stringr::str_replace("NumSpacesForTab.*", "NumSpacesForTab: 2")
  } else {
    text <- text |>
      append("UseSpacesForTab: Yes") |>
      append("NumSpacesForTab: 2")
  }
  text
}

set_rproj_native_pipe <- function(text) {
  if (any(stringr::str_detect(text, "UseNativePipeOperator"))) {
    text <- text |>
      stringr::str_replace("UseNativePipeOperator.*", "UseNativePipeOperator: Yes")
  } else {
    text <- text |>
      append("UseNativePipeOperator: Yes")
  }
  text
}
