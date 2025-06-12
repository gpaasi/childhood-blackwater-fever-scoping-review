# blackwater fever scoping review

[![Release v1.0.0](https://img.shields.io/github/v/release/gpaasi/childhood-blackwater-fever-scoping-review)](https://github.com/gpaasi/childhood-blackwater-fever-scoping-review/releases/latest)
[![Zenodo](https://zenodo.org/badge/DOI/10.5281/zenodo.15647335.svg)](https://doi.org/10.5281/zenodo.15647335)
[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](LICENSE.md)
[![GitHub issues](https://img.shields.io/github/issues/gpaasi/childhood-blackwater-fever-scoping-review)](https://github.com/gpaasi/childhood-blackwater-fever-scoping-review/issues)

---

## table of contents
1. [overview](#overview)  
2. [repository structure](#repository-structure)  
3. [data description](#data-description)  
4. [installation & environment setup](#installation--environment-setup)  
5. [workflow 1: data management & table preparation](#workflow-1-data-management--table-preparation)  
6. [workflow 2: prisma flow diagram](#workflow-2-prisma-flow-diagram)  
7. [running the pipeline](#running-the-pipeline)  
8. [how to cite](#how-to-cite)  
9. [license](#license)  
10. [zenodo deposition](#zenodo-deposition)  
11. [contact information](#contact-information)  

---

## overview
this repository contains all materials, data and reproducible workflows to conduct and report a scoping review on blackwater fever among children in sub–saharan africa. it includes raw and processed data, analysis scripts, figures, supplementary files, and detailed documentation to ensure transparency and ease of peer review.

**key objectives:**  
- map prevalence and incidence of blackwater fever in children across sub–saharan africa  
- characterize clinical features and diagnostic approaches  
- identify genetic, treatment-related and environmental risk factors  
- highlight knowledge gaps and propose future research priorities  

---

## repository structure

```txt
bwf-scoping-review/
├── README.md                                ← this file (project overview & instructions)
├── LICENSE.md                               ← cc by 4.0 license text
├── CITATION.cff                             ← citation metadata for github/zenodo
├── zenodo.json                              ← metadata for zenodo deposition
├── data/
│   ├── raw/
│   │   ├── search_strategy_final.doc         ← final search syntax across databases
│   │   ├── screening_log.csv                ← records screened at each stage
│   │   └── included_studies_raw.xlsx        ← initial table of included studies
│   └── processed/
│       ├── included_studies_clean.csv       ← cleaned and annotated study table
│       └── screening_counts.yaml            ← counts for prisma flow diagram
├── scripts/
│   ├── parse_included_studies.R             ← cleans raw table to csv
│   └── generate_prisma_flow.R               ← creates prisma-scr flow diagram
├── figures/
│   ├── figure1_prisma_flow.png              ← prisma-scr flow diagram
│   ├── figure2_geographic_distribution.png  ← map of study locations
│   ├── figure3_publication_trend.png        ← temporal trend chart
│   └── README_figures.md                    ← naming and generation notes
├── supplementary/
│   ├── supplementary-1_prisma-scr.pdf       ← completed prisma-scr checklist
│   ├── supplementary-2_included-studies.xlsx← final table of included studies
│   └── supplementary-3_search-strategy.pdf  ← formatted search strategy
├── docs/
│   ├── contributing.md                      ← guide for issues & pull requests
│   ├── code_of_conduct.md                   ← contributor covenant
│   └── citation.md                          ← how to cite this repository
└── .github/
    ├── workflows/ci.yml                     ← github actions for ci and link checks
    ├── ISSUE_TEMPLATE/bug_report.md         ← template for reporting bugs
    └── PULL_REQUEST_TEMPLATE.md             ← template for pull requests
data description
screening log (data/raw/screening_log.csv)
purpose: records counts at each screening stage: identified, deduplicated, screened, full-text assessed, and included

columns:

stage – screening stage name

count – number of records

included studies (data/raw/included_studies_raw.xlsx)
purpose: initial extraction of study details from peer-reviewed clinical/epidemiological publications

columns:

author_year – lead author and publication year

country – study location

design – study design (cohort, case-control, descriptive)

population – age group or clinical setting

n_cases – number of BWF cases

n_controls – number of comparison or control subjects

cfr – case fatality ratio (%)

features – main clinical or diagnostic findings

notes – additional context

After running scripts/parse_included_studies.R, you will find data/processed/included_studies_clean.csv with standardized column names, computed CFR percentages, and cleaned notes.

installation & environment setup
system requirements
operating system: windows, macos, or linux

r: version ≥ 4.0.0 (https://cran.r-project.org/)

r packages: readxl, janitor, dplyr, PRISMAstatement, yaml, sf, ggplot2

clone the repository
bash
Copy
git clone https://github.com/YourUser/bwf-scoping-review.git
cd bwf-scoping-review
install r dependencies
r
Copy
install.packages(c(
  "readxl", "janitor", "dplyr",
  "PRISMAstatement", "yaml",
  "sf", "ggplot2"
))
workflow 1: data management & table preparation
see scripts/parse_included_studies.R for detailed steps to:

read raw excel table

clean column names and formats

calculate case fatality ratios

export data/processed/included_studies_clean.csv

workflow 2: prisma flow diagram
see scripts/generate_prisma_flow.R for instructions to:

load screening counts from data/processed/screening_counts.yaml

generate a prisma-scr flow diagram object

save as figures/figure1_prisma_flow.png

running the pipeline
after setting up data and r environment:

bash
Copy
Rscript scripts/parse_included_studies.R
Rscript scripts/generate_prisma_flow.R
verify that:

data/processed/included_studies_clean.csv exists

figures/figure1_prisma_flow.png was generated

how to cite
if you use any data or code from this repository, please cite:

Paasi, G.; Okwware, S.; Olupot-Olupot, P. (2025).
the resurgence of Blackwater Fever among children in sub–Saharan Africa: a scoping review
Zenodo. https://doi.org/10.5281/zenodo.15647335



license
this repository is licensed under the Creative Commons Attribution 4.0 International (CC BY 4.0). see LICENSE.md for full terms.

zenodo deposition
after creating a release (e.g., v1.0.0), zenodo will archive it and mint a DOI. update zenodo.json with:

json
Copy
{
  "title": "Blackwater Fever scoping review repository",
  "upload_type": "dataset",
  "description": "Data and code for a scoping review on blackwater fever among children in sub–Saharan Africa, including search strategies, extracted tables, prisma-scr flow diagram, and analysis scripts. Licensed under CC BY 4.0.",
  "creators": [
    { "name": "Paasi, George", "https://orcid.org/0000-0001-6360-0589" },
        { "name": "Olupot-Olupot, Peter" }
  ],
  "license": "CC-BY-4.0"
}

contact information
lead author
george paasi, MPH, Advanced-FETP
clinical trials dept., mbale clinical research institute
busitema university faculty of health sciences
mbale, uganda
email: georgepaasi8@gmail.com

for issues or suggestions, please open an issue or pull request.

vbnet
Copy

---

## `LICENSE.md`

```markdown
Creative Commons Attribution 4.0 International License

Copyright (c) 2025 George Paasi


