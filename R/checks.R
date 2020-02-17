
cran_link <- "https://cran.r-project.org/"
rstudio_dl_link <- "https://rstudio.com/products/rstudio/download/#download"

check_r_version <- function() {
    latest_version <- rversions::r_release()$version
    current_version <- getRversion()
    if (latest_version != current_version) {
        ui_oops("Your version of R is {current_version}, but the latest is {latest_version}.")
        ui_todo("You need to update your R version, please download the newest version at {ui_value(cran_link)}.")
        ui_line("Opening the R download page in a browser...")
        open_link(cran_link)
    } else {
        ui_done("Your R is at the latest version!")
    }
    return(invisible())
}

check_rstudio_version <- function() {
    if (!rstudioapi::isAvailable("1.2.5033")) {
        ui_oops("Your version of RStudio is {rstudioapi::getVersion()}, but the latest is 1.2.5033.")
        ui_todo("Please update your RStudio at {ui_value(rstudio_dl_link)}.")
        ui_line("Opening the RStudio download page in a browser...")
        open_link(rstudio_dl_link)
    } else {
        ui_done("Your RStudio is at the latest version!")
    }
    return(invisible())

    # gh::gh("/repos/:owner/:repo/releases/", owner = "rstudio", repo = "rstudio")
    # Use gh package for this..?
}

check_git_config <- function() {
    git_config_values <- list(
        name = get_git_config("user.name"),
        email = get_git_config("user.email")
    )
    git_config_values <- Filter(Negate(is.null), git_config_values)

    if (length(git_config_values) == 0) {
        ui_oops("Your name and email aren't configured in Git.")
        ui_todo("Please paste and run the below code in the RStudio Console.")
        ui_code_block("r3::setup_git_config()")
    } else if (length(git_config_values) == 1) {
        ui_oops("Your {names(git_config_values)} isn't configured in Git.")
        ui_todo("Please paste and run the below code in the RStudio Console.")
        ui_code_block("r3::setup_git_config()")
    } else {
        ui_done("Your Git configuration is all setup!")
    }

    return(invisible())
}

# Taken from usethis:::git_config_get
get_git_config <- function(name) {
    config <- git2r::config()
    config$global[[name]]
}

#' Check your setup in preparation for the r-cubed course.
#'
#' @return Don't output anything, only runs checks on the setup.
#' @export
#'
check_setup <- function() {
    hd_line("Checking R version:")
    check_r_version()
    hd_line("Checking RStudio version:")
    check_rstudio_version()
    hd_line("Checking Git config settings:")
    check_git_config()
    return(invisible())
}

# From usethis:::hd_line
hd_line <- function(name) {
    cat_line <- function(...) {
        lines <- paste0(..., "\n")
        cat(lines, sep = "")
    }
    cat_line(crayon::bold(name))
}
