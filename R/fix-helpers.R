#' Fix some Git remote issues that occur during the workshop.
#'
#' @returns Used for the side effect of connecting to Git. Returns NULL invisibly.
#' @export
#'
fix_git_remotes <- function() {
  proj <- fs::path_wd()
  check_in_rproj(proj)
  remotes <- gert::git_remote_list(proj)$name
  purrr::walk(
    remotes,
    \(name) gert::git_remote_remove(name, repo = proj)
  )
  cli::cli_inform(
    "Removing the {.val {remotes}} remote{?s} from your Git repo."
  )
  invisible(NULL)
}
