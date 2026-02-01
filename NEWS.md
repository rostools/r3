## 0.5.0 (2026-02-01)

### Feat

- :sparkles: moved get R and RStudio version functions from samwise

## 0.4.1 (2025-08-21)

### Refactor

- :fire: don't need "learning resources" RData in this package
- :recycle: use implicit returns, not explicitly use `return()`

## 0.4.0 (2025-08-21)

Started using automated releases via
[Commitizen](https://commitizen-tools.github.io/commitizen/),
that also includes automatic `NEWS.md` generation. This
requires following [Conventional
Commits](https://www.conventionalcommits.org/en/v1.0.0/).

### Feat

- add setup code to set the auto-save. Closes #15
- function to set rproj settings
- add helper function to remove remotes when issues come up. Closes #10
- add function to fix rebase issue. Closes #9 and #13

### Fix

- :heavy_plus_sign: fix name of old dependency (now samwise)
- use the correct link for rstudio

### Refactor

- :pushpin: use R 4.1.0, since we use the pipe
- :fire: remove `open_feedback_survey()`, use HTML buttons instead
- :fire: remove leftover functions
- :recycle: remove the Rmd doc creation
- :recycle: clarify that check_project is for intermediate
- :recycle: make use of the new r3admin functions for getting versions
- :recycle: update versions checked for R and RStudio
- match minimum RStudio version listed on website
- update the minimum version needed for rstudio
- add informative message to fixer

## 0.3.0

-   Add helper `fix_git_remotes()` function to remove Git remotes, which
    sometimes causes issues with participants projects if
    `usethis::use_github()` has a problem.
-   Update `setup_git_config()` to set pull strategy to not be rebase,
    which is an issue with some Mac users.
-   Add `setup_rproj()` function to set some project level settings that
    make it easier for participants during the course.
-   Add `setup_rstudio()` function to set some settings that help during
    the course, like auto-saving.

## 0.2.5

-   Switch all feedback survey links to go to the general one, with
    `open_feedback_surve()`.
-   Fix code after update to use `.csv` instead of `.rda` in
    `check_project_setup_advanced()` for Advanced course.

## 0.2.4

-   Added function to install packages for intermediate course.
-   Added function to create a Qmd template file.
-   Don't need `open_pre_survey()` anymore.
-   Move package over to GitHub.
-   Fix bug in `check_r_version()` where if condition was comparing a
    number with a character (PR #5).
-   Fixed possible bug with `install_packages_generic()` where there was
    an error of installing pak while using `pak::pak()`.

## 0.2.3

-   Fixed a bug with `check_git_config()` where it wasn't doing the
    checks properly.
-   Remove installation of some packages for advanced course (like
    rspm).
-   Add function to install packages for introduction course.

## 0.2.2

-   Trimmed down dependencies by having a function install the packages
    for the course
-   Added planning issue to send to GitLab or GitHub
-   Added functions relevant to the advanced course (checks, etc)
-   Removed most of the `open_*` functions, don't really need them

## 0.2.1

-   Fix link to dataset.
-   Remove extra commas from the Git setup (it was confusing some
    people) (#10).
-   Checking the project folder structure was going too deep, changed
    recurse to 2 levels only (#11).

## 0.2.0

-   Added a `NEWS.md` file to track changes to the package.
-   Set minimum R version as 4.0.0 and RStudio to \>1.3.
-   Add a check to `check_project_setup()` see if data was downloaded
    and unzipped for the intermediate course.
-   Set the default Git branch to be "main" when setting up Git. This is
    due to multiple efforts at moving away from the term "master" (by
    Git itself and with GitHub).
-   Start using cli package instead of usethis' `ui_*` functions.
