#' Install the R packages necessary for the Advanced R course.
#'
#' @name install_packages
#' @return Outputs nothing, used to install packages for the R course.
#'
NULL

#' @describeIn install_packages Install necessary packages for the advanced course.
#' @export
install_packages_advanced <- function() {
  install_packages_generic(
    url = "https://raw.githubusercontent.com/rostools/r-cubed-advanced/main/DESCRIPTION",
    ignore_packages = "r3admin|RcppTOML|rspm|todor"
  )
}

#' @describeIn install_packages Install necessary packages for the introduction course.
#' @export
install_packages_introduction <- function() {
  install_packages_generic(
    url = "https://gitlab.com/rostools/r-cubed/-/raw/main/DESCRIPTION",
    ignore_packages = "xaringan|xaringanthemer|showtext|downlit|r3"
  )
}

install_packages_generic <- function(url, ignore_packages = NULL) {
  description_text <- readLines(url)
  # -1 to remove the R dependency from the vector.
  needed_packages <- desc::desc(text = description_text)$get_deps()$package[-1]
  if (!is.null(ignore_packages))
    needed_packages <- stringr::str_subset(needed_packages, ignore_packages, negate = TRUE)
  pak::pkg_install(needed_packages, ask = FALSE, upgrade = TRUE)
  return(invisible(NULL))
}
