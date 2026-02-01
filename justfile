# These are for admin tasks that really only need to be done once or twice

@_default:
  just --list --unsorted

# Run build recipes and install the package
run-all: install-deps style check-code check-spelling document build-readme check install-package

# Install package dependencies
install-deps:
  #!/usr/bin/Rscript
  pak::pak(ask = FALSE)

# Install the package and its dependencies
install-package:
  #!/usr/bin/Rscript
  devtools::install()

# Re-build Roxygen docs
document:
  #!/usr/bin/Rscript
  devtools::document()

# Run style formatter
style:
  air format .

# Check code (lint)
check-code:
  jarl check .

# Run spell checker
check-spelling:
  uvx typos

# Re-build the README file from the Rmd
build-readme:
  #!/usr/bin/Rscript
  devtools::build_readme()

# Run local CRAN checks
check:
  #!/usr/bin/env Rscript
  devtools::check(error_on = "note")
