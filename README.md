# Econometrics Seminar — Coding in R

Corvinus University of Budapest · 2026–27

This repository holds the code and materials for the **seminar** part of the
Econometrics course. The seminar teaches you how to *do* data analysis in R:
how to get data in, clean it, reshape it, describe it, visualise it, and write
it up reproducibly. The lecture and the parallel econometrics course cover the
theory; here we build the practical skills that go with it.

---

## Course materials

The seminar follows the data analysis workflow of

- **Békés, G. & Kézdi, G. (2021): _Data Analysis for Business, Economics, and
  Policy_.** Cambridge University Press.
  Website and free data: <https://gabors-data-analysis.com>
- **Kertesi, G. & Kézdi, G.:** Hungarian data analysis materials used in the
  lecture.

Additional references used in building these sessions:

- Reguly, Á. & Békés, G.: *Introduction to Data Analysis with R* —
  <https://github.com/gabors-data-analysis/da-coding-rstats>
- Wickham, H., Çetinkaya-Rundel, M. & Grolemund, G.: *R for Data Science (2e)* —
  <https://r4ds.hadley.nz>
- Irizarry, R.: *Introduction to Data Science* — <https://rafalab.dfci.harvard.edu/dsbook/>

---

## Sessions

| # | Topic | Case study | Files |
|---|-------|-----------|-------|
| 1 | Getting set up: GitHub, RStudio, coding basics in R `code/session01.R` |
| 2 | Tidy data, tibbles, the pipe operator | `code/session02.R` |
| 3 | Importing data, wide vs. long format, joins, aggregation | `code/session03.R` |
| 4 | Data cleaning: strings and regex, missing values, duplicates, recoding | `code/session04.R` |
| 5 | Markdown, RMarkdown and reproducible reports; visualization with ggplot |  `code/session05.Rmd` |
| 6 | Using git and GitHub for version control and collaboration | 

Each session's script is written to be run **top to bottom**, line by line, and
is commented so that it works as your own notes afterwards.

---

## What you need

1. **R** — <https://cran.r-project.org>
2. **RStudio** — <https://posit.co/download/rstudio-desktop/> or **Positron** <https://positron.posit.co/download.html>
3. **A GitHub account** — <https://github.com>

Install the packages we use once, at the start of the course:

```r
install.packages(c("tidyverse", "wooldridge", "writexl",
                   "rmarkdown", "knitr", "stargazer", "viridis"))
```

If you are working on a university computer where you cannot install software,
there should be RStudio installed.

---

## How to use this repository

**Open the project, not the file.** Double-click `econometrics-seminar.Rproj`.
This sets the working directory for you, which is why none of the scripts
contain a `setwd()` line — and why they run on your machine exactly as they run
on anyone else's.

**Data is read from the internet.** The scripts download the datasets straight
from their public URLs, so there is nothing for you to download by hand and no
file paths to fix. See `data/README.md` for where each dataset comes from. You
need an internet connection to run sessions 3–5.

## Your own repository

In session 1 you will create your own repository for this course. That is where
your work goes — you commit to it during and at the end of every session. This
repository is the reference: read from it, copy from it, but do your own work in
your own repo.
