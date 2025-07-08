# Set CRAN mirror explicitly
options(repos = c(CRAN = "https://cran.r-project.org"))

# List of required packages
packages <- c(
  "caret",
  "data.table",
  "dplyr",
  "ROSE",
  "rpart",
  "nnet",
  "gbm",
  "pROC"
)

# Install any that are missing
new.packages <- packages[!(packages %in% installed.packages()[, "Package"])]
if (length(new.packages)) install.packages(new.packages)
