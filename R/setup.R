
#' Set the user's git configuration.
#'
#' @return Modifies global git configuration.
#' @export
#'
setup_git <- function() {
    user_name <- rstudioapi::showPrompt("What is your name?",
                                        "Please type out your first and last name.")
    user_email <- rstudioapi::showPrompt(
        "What is your email?",
        "Use an email that you'll always have (e.g., your work email is only yours while as an employee)."
    )
    usethis::use_git_config(
        "user",
        user.name = user_name,
        user.email = user_email
    )
}
