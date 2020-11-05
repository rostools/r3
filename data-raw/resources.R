
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
    "broom",
    "fs",
    "here",
    "knitr",
    "bookdown"
)

package_metadata <- useful_pkgs %>%
    stringr::str_sort() %>%
    pkgsearch::cran_packages()

useful_packages_list <- package_metadata %>%
    select(Package, Title, Description, URL) %>%
    mutate(
        URL = str_remove(URL, ",[\\n]?.*$") %>%
            str_remove(",.*$") %>%
            str_replace("http:", "https:"),
        Package = glue::glue("[{Package}]({URL})"),
        Description = str_replace_all(Description, "\\n", " ")
    ) %>%
    select(-URL)

usethis::use_data(useful_packages_list, overwrite = TRUE)

# Useful websites ---------------------------------------------------------

library(rvest)

useful_learning_sites <- c(
    "https://swirlstats.com/",
    "https://r4ds.had.co.nz/",
    "https://rstudio.com/resources/cheatsheets/",
    "https://moderndive.com/",
    "https://clauswilke.com/dataviz/",
    "https://stat545.com/",
    "https://rstudio.cloud/learn/primers"
)

extract_title <- function(content, link_name) {
    page_title <- content %>%
        html_node("title") %>%
        html_text()
    tibble(Site = as.character(glue::glue("[{page_title}]({link_name})")))
}

site_contents <- useful_learning_sites %>%
    map(read_html)

useful_learning_sites_list <- site_contents %>%
    map2_dfr(useful_learning_sites,
             extract_title)

usethis::use_data(useful_learning_sites_list, overwrite = TRUE)
