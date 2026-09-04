# Data sources

The scripts in `code/` read data **directly from public URLs**. Nothing needs to
be downloaded by hand, and there are no file paths to fix. This folder therefore
contains no data files — only this note on where everything comes from.

The trade-off: you need an internet connection to run sessions 3–5.

---

## Session 1 — CEO salary

Comes from an R package, so no download at all:

```r
library(wooldridge)
ceo <- ceosal1
```

`ceosal1` is one of the datasets accompanying Wooldridge's *Introductory
Econometrics*. 209 CEOs, 1990. `?ceosal1` in R gives the variable definitions.

---

## Session 2 — no external data

The tibble is built by hand in the script.

---

## Session 3 — Football managers

English Premier League managers: games managed and points won, by team.

| Object | URL |
|--------|-----|
| `games.csv` | <https://raw.githubusercontent.com/gabors-data-analysis/da-coding-rstats/main/lecture03-tibbles/data/games.csv> |
| `points.csv` | <https://raw.githubusercontent.com/gabors-data-analysis/da-coding-rstats/main/lecture03-tibbles/data/points.csv> |

Both have the columns `team`, `manager_id`, `manager_name` plus
`manager_games` / `manager_points`.

> **Note for the 2026–27 revision:** the 2025–26 script read a *wide* version of
> `games.csv` (one column per team) from a local folder and pivoted it to long.
> The copy at the URL above is already in long format. Session 3 will pivot it
> *wide* first and then back to long, which teaches the same two functions and
> removes the dependency on a file we no longer have.

Source: Reguly & Békés, *Introduction to Data Analysis with R*, lecture 03.

---

## Session 4 and 5 — Hotels in Vienna

From the **hotels-europe** dataset of Békés & Kézdi, *Data Analysis for
Business, Economics, and Policy*. Prices and features of hotels in 46 European
cities on 10 different dates.

The official distribution splits the data in two files, hosted on OSF:

| Object | URL |
|--------|-----|
| prices | <https://osf.io/download/p6tyr/> |
| features | <https://osf.io/download/utwjs/> |

They are joined on `hotel_id`. Dataset documentation:
<https://gabors-data-analysis.com/datasets/hotels-europe/>

> **Note for the 2026–27 revision:** the 2025–26 script read a single
> pre-merged `hotels-europe.csv`. That file was not part of the handover.
> Joining the two official files reproduces it — and doubles as a second, real
> use of the joins taught in session 3.

Session 4 writes its cleaned Vienna sample to `output/data/`, and session 5
reads it back from there.
