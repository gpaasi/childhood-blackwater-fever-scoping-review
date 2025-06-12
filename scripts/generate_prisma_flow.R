#!/usr/bin/env Rscript
# scripts/generate_prisma_flow.R
# --------------------------------
# constructs a PRISMA-ScR flow diagram from screening counts
# and saves it as a PNG in the figures folder.

# load required libraries
if (!requireNamespace("PRISMAstatement", quietly = TRUE)) {
  install.packages("PRISMAstatement")
}
if (!requireNamespace("yaml", quietly = TRUE)) {
  install.packages("yaml")
}
if (!requireNamespace("ggplot2", quietly = TRUE)) {
  install.packages("ggplot2")
}

library(PRISMAstatement)  # for prisma_flowdiagram()
library(yaml)            # for read_yaml()
library(ggplot2)         # for ggsave()

# 1. Read screening counts
counts_path <- "data/processed/screening_counts.yaml"
message("Loading screening counts from: ", counts_path)
counts <- yaml::read_yaml(counts_path)

# 2. Create the flow diagram object
flow <- prisma_flowdiagram(
  title = "PRISMA-ScR flow diagram",
  records_identified   = counts$identified,
  records_screened     = counts$screened,
  records_excluded     = counts$excluded,
  full_text_assessed   = counts$full_text_assessed,
  full_text_excluded   = counts$full_text_excluded,
  studies_included     = counts$included
)

# 3. Save to PNG
output_path <- "figures/figure1_prisma_flow.png"
message("Saving PRISMA flow diagram to: ", output_path)
ggsave(output_path, plot = flow, width = 6, height = 6, units = "in")

message("generate_prisma_flow.R completed successfully.")
