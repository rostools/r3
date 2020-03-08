#' @keywords internal
#' @importFrom usethis ui_todo ui_line ui_done ui_oops ui_info ui_stop ui_warn
#'   ui_field ui_value ui_path ui_code ui_code_block
#' @importFrom utils tail
"_PACKAGE"

# The following block is used by usethis to automatically manage
# roxygen namespace tags. Modify with care!
## usethis namespace: start
## usethis namespace: end
NULL

#' List of some useful sites for learning R.
#'
#' A one-column dataset containing a Markdown formatted list of learning sites
#' with URLs.
#'
#' @format A column with 8 rows and 1 variables:
#' \describe{
#'   \item{Site}{List of learning sites, as a Markdown link.}
#' }
"useful_learning_sites_list"

#' List of some useful packages to use in R.
#'
#' A data frame containing a Markdown formatted list of packages
#' with URLs, their titles, and their description.
#'
#' @format A column with 27 rows and 3 variables:
#' \describe{
#'   \item{Package}{List of useful packages, as a Markdown link.}
#'   \item{Title}{Package title.}
#'   \item{Description}{Package description.}
#' }
"useful_packages_list"
