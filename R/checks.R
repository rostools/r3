
cran_link <- "https://cran.r-project.org/"
rstudio_dl_link <- "https://rstudio.com/products/rstudio/download/#download"

check_r_version <- function() {
    latest_version <- rversions::r_release()$version
    current_version <- getRversion()
    if (latest_version != current_version) {
        ui_oops("Your version of R is {current_version}, but the latest is {latest_version}.")
        ui_todo("You need to update your R version, please download the newest version at {ui_value(cran_link)}.")
        ui_line("Opening the R download page in a browser...")
        utils::browseURL(cran_link)
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
        utils::browseURL(rstudio_dl_link)
    } else {
        ui_done("Your RStudio is at the latest version!")
    }
    return(invisible())

    # gh::gh("/repos/:owner/:repo/releases/", owner = "rstudio", repo = "rstudio")
    # Use gh package for this..?
}

check_git_config <- function() {


    # hd_line("Git config (global)")
    # kv_line("Name", get_git_config("user.name"))
    # kv_line("Email", get_git_config("user.email"))
}

# Taken from usethis:::git_config_get
get_git_config <- function(name) {
    config <- git2r::config()
    config$global[[name]]
}
