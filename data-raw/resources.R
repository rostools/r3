
# Useful packages ---------------------------------------------------------

library(tidyverse)
library(pkgsearch)

useful_pkgs <- c(
    "dplyr",
    "tidyverse",
    "tidyr",
    "stringr",
    "lubridate",
    "forcats",
    "purrr",
    "ggplot2",
    "tibble",
    "readr",
    "vroom",
    "data.table",
    "rmarkdown",
    "haven",
    "readxl",
    "googledrive",
    "rio",
    "datapasta",
    "patchwork",
    "glue",
    "janitor",
    "usethis",
    "broom"
)

package_metadata <- useful_pkgs %>%
    stringr::str_sort() %>%
    pkgsearch::cran_packages()


usethis::use_data(DATASET, overwrite = TRUE)


# Useful websites ---------------------------------------------------------

"https://awesome-r.com/"

"https://swirlstats.com/"

"https://r4ds.had.co.nz/"

"rstudio cheatsheets"

"moderndive"

"https://stat545.com/"

"https://rstudio.cloud/learn/primers"
