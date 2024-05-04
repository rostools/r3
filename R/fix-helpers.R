#' Fix some Git remote issues that occur during the course.
#'
#' @return Used for the side effect of connecting to Git. Returns NULL invisibly.
#' @export
#'
fix_git_remotes <- function() {
  proj <- rstudioapi::getActiveProject()
  if (is.null(proj)) {
    usethis::ui_stop("You aren't in the R project. Please open the R Project for the course and run this function again in the Console.")
  }
  remotes <- gert::git_remote_list(proj)$name
  purrr::walk(
    remotes,
    \(name) gert::git_remote_remove(name, repo = proj)
  )
  cli::cli_inform("Removing the {.val {remotes}} remote{?s} from your Git repo.")
  invisible(NULL)
}
