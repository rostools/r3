
#' Set the user's git configuration.
#'
#' @return Modifies global git configuration.
#' @export
#'
setup_git_config <- function() {
    user_name <- rstudioapi::showPrompt(
        "What is your name?",
        "Please type out your full name (e.g. first, middle, last)."
    )
    user_email <- rstudioapi::showPrompt(
        "What is your email?",
        "Type out your email. It's recommended to use an email like Gmail, as you always have access to it."
    )
    usethis::use_git_config(
        "user",
        user.name = user_name,
        user.email = user_email
    )
}
