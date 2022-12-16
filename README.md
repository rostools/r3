
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r3

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of r3 is to provide helper functions for the
[r-cubed](https://gitlab.com/rostools/r-cubed) introduction to R course
and the
[r-cubed-intermediate](https://gitlab.com/rostools/r-cubed-intermediate)
R course.

## Installation

You can install the released version of r3 from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("rostools/r3", upgrade = TRUE)
```

## Using or modifying for courses based on r-cubed

If you want to run your own version of the course and would like to use
this helper package for the course, you’ll likely want to modify it.
While many functions don’t need to be modified for your own course,
there are several that will need to be:

- `open_pre_survey()`, `open_feedback_survey()` in the `R/open-links.R`
  file: The Google Form (or other survey platform) URLs should be
  replaced to the one you will use for the course.
- Opening any of the website links with the `open_` functions in
  `R/open-links.R`: The variable `material_link` at the top of this R
  file should be replaced to which ever other URL location you will have
  the course material.

Check out the [CONTRIBUTING.md](CONTRIBUTING.md) file for other details
about contributing or working with this package.

## Code of Conduct

Please note that the r3 project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/1/0/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
