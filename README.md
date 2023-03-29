
<!-- README.md is generated from README.Rmd. Please edit that file -->

# r3

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R-CMD-check](https://github.com/rostools/r3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/rostools/r3/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

The goal of r3 is to provide helper functions for several `r-cubed` R
courses.

## Installation

You can install the released version of r3 from GitHub with:

``` r
# install.packages("pak")
pak::pkg_install("rostools/r3", upgrade = TRUE)
```

## Using or modifying for courses based on r-cubed

If you want to run your own version of the course and would like to use
this helper package for the course, you’ll likely want to modify it.
While many functions don’t need to be modified for your own course,
there are several that will need to be, especially:

- Any of the `open_feedback_*` functions in the `R/open-links.R` file:
  The Google Form (or other survey platform) URLs should be replaced to
  the one you will use for the course.

Check out the [CONTRIBUTING.md](CONTRIBUTING.md) file for other details
about contributing or working with this package.

## Code of Conduct

Please note that the r3 project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/1/0/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
