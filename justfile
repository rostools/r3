# These are for admin tasks that really only need to be done once or twice

@_default:
  just --list --unsorted

@basic-checks: check-code check-spelling-cran check-spelling-typos check-url-cran check-url-lychee
# Run build recipes and install the package
run-all: install-deps format-r format-md document basic-checks build-readme check-cran install-package

# Install the pre-commit hooks
install-precommit:
    # Install pre-commit hooks
    uvx pre-commit install
    # Run pre-commit hooks on all files
    uvx pre-commit run --all-files
    # Update versions of pre-commit hooks
    uvx pre-commit autoupdate

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
format-r:
  air format .

# Format Markdown files
format-md:
  uvx rumdl fmt --silent

# Check code (lint)
check-code:
  jarl check .

# Run typos spell checker
check-spelling-typos:
  uvx typos

# Run CRAN spell checker
check-spelling-cran:
  #!/usr/bin/env Rscript
  devtools::spell_check()

# Check URLs based on CRAN requirements
check-url-cran:
  #!/usr/bin/env Rscript
  urlchecker::url_check()

# Install https://github.com/lycheeverse/lychee#installation
# Check URLs using lychee tool
check-url-lychee:
  lychee . --verbose

# Re-build the README file from the Rmd
build-readme:
  #!/usr/bin/Rscript
  devtools::build_readme()

# Run local CRAN checks
check-cran:
  #!/usr/bin/env Rscript
  devtools::check(error_on = "note")
