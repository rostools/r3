# r3 0.2.1

# r3 0.2.0

* Added a `NEWS.md` file to track changes to the package.
* Set minimum R version as 4.0.0 and RStudio to >1.3.
* Add a check to `check_project_setup()` see if data was downloaded and unzipped
for the intermediate course.
* Set the default Git branch to be "main" when setting up Git. This is due to 
multiple efforts at moving away from the term "master" (by Git itself and with
GitHub).
* Start using cli package instead of usethis' `ui_*` functions.
