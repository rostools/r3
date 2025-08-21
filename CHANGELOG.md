## 0.4.1 (2025-08-21)

### Refactor

- :fire: don't need "learning resources" RData in this package
- :recycle: use implicit returns, not explicitly use `return()`

## 0.4.0 (2025-08-21)

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
