# These are for admin tasks that really only need to be done once or twice

@_default:
  just --list --unsorted

# Run build recipes and install the package
run-all: install-package-dependencies style check-spelling document install-package

# Install package dependencies
install-package-dependencies:
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

# Run spell checker
check-spelling:
  uvx typos
