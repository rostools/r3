# News

Since we follow
[Conventional Commits](https://decisions.seedcase-project.org/why-conventional-commits/)
when writing commit messages, we're able to automatically create formal
"releases" of the website based on the commit messages. Releases in the
context of websites are simply snapshots in time of the website content.
We use
[Commitizen](https://decisions.seedcase-project.org/why-semantic-release-with-commitizen/)
to be able to automatically create these releases, which uses
[SemVar](https://semverdoc.org) as the version numbering scheme.

Because releases are created based on commit messages, we release quite
often, sometimes several times in a day. This also means that any
individual release will not have many changes within it. Below is a list
of the releases we've made so far, along with what was changed within
each release.

## 0.8.2 (2026-04-07)

### Fix

- :bug: intermediate workshop uses `nurses-stress` data now

## 0.8.1 (2026-04-07)

### Fix

- :bug: `hd_line()` doesn't seem to use newline anymore

## 0.8.0 (2026-04-06)

### Feat

- :sparkles: add `create_sandbox_qmd()`

## 0.7.0 (2026-04-04)

### Feat

- :sparkles: add a new `create_cleaning_qmd()` function for intermediate

## 0.6.0 (2026-04-01)

### Feat

- :fire: remove `install_*()` functions in favor of keeping deps in r3

## 0.5.0 (2026-02-01)

### Feat

- :sparkles: moved get R and RStudio version functions from samwise

## 0.4.1 (2025-08-21)

### Refactor

- :fire: don't need "learning resources" RData in this package
- :recycle: use implicit returns, not explicitly use `return()`

## 0.4.0 (2025-08-21)

Started using automated releases via
[Commitizen](https://commitizen-tools.github.io/commitizen/), that also
includes automatic `NEWS.md` generation. This requires following
[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/).

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

- Add helper `fix_git_remotes()` function to remove Git remotes, which
  sometimes causes issues with participants projects if
  `usethis::use_github()` has a problem.
- Update `setup_git_config()` to set pull strategy to not be rebase,
  which is an issue with some Mac users.
- Add `setup_rproj()` function to set some project level settings that
  make it easier for participants during the course.
- Add `setup_rstudio()` function to set some settings that help during
  the course, like auto-saving.

## 0.2.5

- Switch all feedback survey links to go to the general one, with
  `open_feedback_surve()`.
- Fix code after update to use `.csv` instead of `.rda` in
  `check_project_setup_advanced()` for Advanced course.

## 0.2.4

- Added function to install packages for intermediate course.
- Added function to create a Qmd template file.
- Don't need `open_pre_survey()` anymore.
- Move package over to GitHub.
- Fix bug in `check_r_version()` where if condition was comparing a
  number with a character (PR #5).
- Fixed possible bug with `install_packages_generic()` where there was
  an error of installing pak while using `pak::pak()`.

## 0.2.3

- Fixed a bug with `check_git_config()` where it wasn't doing the checks
  properly.
- Remove installation of some packages for advanced course (like rspm).
- Add function to install packages for introduction course.

## 0.2.2

- Trimmed down dependencies by having a function install the packages
  for the course
- Added planning issue to send to GitLab or GitHub
- Added functions relevant to the advanced course (checks, etc)
- Removed most of the `open_*` functions, don't really need them

## 0.2.1

- Fix link to dataset.
- Remove extra commas from the Git setup (it was confusing some people)
  (#10).
- Checking the project folder structure was going too deep, changed
  recurse to 2 levels only (#11).

## 0.2.0

- Added a `NEWS.md` file to track changes to the package.
- Set minimum R version as 4.0.0 and RStudio to \>1.3.
- Add a check to `check_project_setup()` see if data was downloaded and
  unzipped for the intermediate course.
- Set the default Git branch to be "main" when setting up Git. This is
  due to multiple efforts at moving away from the term "master" (by Git
  itself and with GitHub).
- Start using cli package instead of usethis' `ui_*` functions.
