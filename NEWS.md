# r3 0.2.3

# r3 0.2.2

* Trimmed down dependencies by having a function install the packages for the course
* Added planning issue to send to GitLab or GitHub
* Added functions relevant to the advanced course (checks, etc)
* Removed most of the `open_*` functions, don't really need them

# r3 0.2.1

* Fix link to dataset.
* Remove extra commas from the Git setup (it was confusing some people) (#10).
* Checking the project folder structure was going too deep, changed recurse to 2
levels only (#11).

# r3 0.2.0

* Added a `NEWS.md` file to track changes to the package.
* Set minimum R version as 4.0.0 and RStudio to >1.3.
* Add a check to `check_project_setup()` see if data was downloaded and unzipped
for the intermediate course.
* Set the default Git branch to be "main" when setting up Git. This is due to 
multiple efforts at moving away from the term "master" (by Git itself and with
GitHub).
* Start using cli package instead of usethis' `ui_*` functions.
