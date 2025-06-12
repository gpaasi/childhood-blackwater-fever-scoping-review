#!/usr/bin/env Rscript
# scripts/parse_included_studies.R
# --------------------------------
# reads the raw Excel table of included studies,
# cleans column names, computes case-fatality ratios,
# and writes out a cleaned CSV for downstream analysis.

# load required libraries
if (!requireNamespace("readxl", quietly = TRUE)) {
  install.packages("readxl")
}
if (!requireNamespace("janitor", quietly = TRUE)) {
  install.packages("janitor")
}
if (!requireNamespace("dplyr", quietly = TRUE)) {
  install.packages("dplyr")
}

library(readxl)    # for read_excel()
library(janitor)   # for clean_names()
library(dplyr)     # for mutate(), select()

# 1. Read raw data
raw_path <- "data/raw/included_studies_raw.xlsx"
message("Reading raw data from: ", raw_path)
raw <- read_excel(raw_path, sheet = 1)

# 2. Clean column names to snake_case
cleaned <- raw %>%
  clean_names()

# 3. Ensure numeric columns are correct type
#    (assumes columns n_cases and n_controls exist)
cleaned <- cleaned %>%
  mutate(
    n_cases    = as.numeric(n_cases),
    n_controls = as.numeric(n_controls)
  )

# 4. Compute case-fatality ratio percentage
cleaned <- cleaned %>%
  mutate(
    cfr_percent = 100 * n_cases / (n_cases + n_controls)
  )

# 5. Trim whitespace in text fields
cleaned <- cleaned %>%
  mutate_if(is.character, ~ trimws(.))

# 6. Write output
out_path <- "data/processed/included_studies_clean.csv"
message("Writing cleaned data to: ", out_path)
write.csv(cleaned, out_path, row.names = FALSE)

message("parse_included_studies.R completed successfully.")
