#' Install the R packages necessary for the specific R course.
#'
#' @name install_packages
#' @return Outputs nothing, used to install packages for the R course.
#'
NULL

#' @describeIn install_packages Install necessary packages for the intermediate course.
#' @export
install_packages_intermediate <- function() {
  install_packages_generic(
    url = url_gh_raw_file("rostools/r-cubed-intermediate", "DESCRIPTION"),
    ignore_packages = "r3admin|r3"
  )
}

#' @describeIn install_packages Install necessary packages for the advanced course.
#' @export
install_packages_advanced <- function() {
  install_packages_generic(
    url = url_gh_raw_file("rostools/r-cubed-advanced", "DESCRIPTION"),
    ignore_packages = "r3admin|RcppTOML|rspm|todor|r3"
  )
}

#' @describeIn install_packages Install necessary packages for the introduction course.
#' @export
install_packages_introduction <- function() {
  install_packages_generic(
    url = url_gh_raw_file("rostools/r-cubed-intro", "DESCRIPTION"),
    ignore_packages = "downlit|r3|r3admin"
  )
}

install_packages_generic <- function(url, ignore_packages = NULL) {
  rlang::check_installed("pak")
  description_text <- readLines(url)
  # -1 to remove the R dependency from the vector.
  needed_packages <- desc::desc(text = description_text)$get_deps()$package[-1]
  if (!is.null(ignore_packages)) {
    needed_packages <- stringr::str_subset(needed_packages, ignore_packages, negate = TRUE)
  }
  pak::pkg_install(needed_packages, ask = FALSE, upgrade = TRUE)
  return(invisible(NULL))
}

url_gh_raw_file <- function(repo, file) {
  paste0(
    "https://raw.githubusercontent.com/",
    repo,
    "/main/",
    file
  )
}
