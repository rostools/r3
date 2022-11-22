#' Install the R packages necessary for the Advanced R course.
#'
#' @return Outputs nothing, used to install packages for the R course.
#' @export
#'
install_packages_advanced <- function() {
  description_text <- readLines("https://raw.githubusercontent.com/rostools/r-cubed-advanced/main/DESCRIPTION")
  # -1 to remove the R dependency from the vector.
  needed_packages <- desc::desc(text = description_text)$get_deps()$package[-1]
  needed_packages <- stringr::str_subset(needed_packages, "RcppTOML|rspm|todor", negate = TRUE)
  pak::pkg_install(needed_packages, ask = FALSE, upgrade = TRUE)
  return(invisible(NULL))
}
