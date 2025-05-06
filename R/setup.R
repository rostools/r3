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
