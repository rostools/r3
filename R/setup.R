#' Set the user's git configuration.
#'
#' @param force Force setting up Git config and overwrite the old values.
#'
#' @returns Modifies global git configuration.
#' @export
#'
setup_git_config <- function(force = FALSE) {
  setup_git_settings()
  config_set <- has_git_config(get_git_user_config())
  if (config_set && !force) {
    cli::cli_alert_success("Git config settings are already set, cancelling.")
    return(invisible(TRUE))
  }
  user_name <- readline(
    "What is your name? Type out your full name (e.g. first middle last) here: "
  )
  user_email <- readline(
    "What is your email? We recommend using a personal email or an email you will always have access to. Type out your email here: "
  )

  correct <- yesno::yesno(
    "Is your user name `",
    user_name,
    "` and email `",
    user_email,
    "`?"
  )
  if (!correct) {
    cli::cli_abort(
      "Re-run {.run r3::setup_git_config()} to correctly fill out the Git config."
    )
  }

  usethis::use_git_config(
    scope = "user",
    user.name = user_name,
    user.email = user_email
  )
  return(invisible(TRUE))
}

#' Set some Git config settings like main as default and rebase as false.
#'
#' @returns Invisible, values of previous settings.
#' @export
#'
setup_git_settings <- function() {
  usethis::use_git_config(
    scope = "user",
    pull.rebase = FALSE,
    init.defaultBranch = "main"
  )
}
