# ==============================================================================
# Session 01 — Coding basics in R
# Econometrics seminar, Corvinus University, 2026-27
#
# Case study: What is the connection between CEO salary and return on equity?
#
# HOW TO USE THIS SCRIPT
#   Run it line by line (Ctrl/Cmd + Enter), not all at once. Two lines below are
#   marked "!! meant to fail" — run them anyway and read the error message.
#   That is part of the lesson.
#
# Based on
#   - Ágoston Reguly & Gábor Békés: Introduction to Data Analysis with R
#   - Rafael Irizarry: Introduction to Data Science
# ==============================================================================


## Useful keyboard shortcuts ---------------------------------------------------
# (Windows/Linux                 / macOS)
# assignment  <-                 Alt + -           / Option + -
# pipe        |>                 Ctrl + Shift + M  / Cmd + Shift + M
# run line / selection           Ctrl + Enter      / Cmd + Enter
# comment / uncomment            Ctrl + Shift + C  / Cmd + Shift + C
# document outline (this menu)   Ctrl + Shift + O  / Cmd + Shift + O
#
# A comment line ending in four or more dashes ---- becomes a section in the
# outline. That is how this script is organised.


## Cleaning the environment ----------------------------------------------------
# Removes every object you have created. Start every script with this: it makes
# sure your results come from the code, not from something left over in memory.
rm(list = ls())


## Packages --------------------------------------------------------------------
# INSTALL ONCE (uncomment and run the first time, then comment out again).
# Installing takes minutes; loading takes seconds. Never leave install.packages()
# uncommented in a script you run repeatedly.

# install.packages("tidyverse")
# install.packages("wooldridge")

# LOAD EVERY TIME
library(tidyverse)   # data manipulation and visualisation
library(wooldridge)  # datasets from Wooldridge's econometrics textbook


# ==============================================================================
# 1) Coding basics
# ==============================================================================

## Objects and variables -------------------------------------------------------
a <- 2   # numerical
b <- 3
c <- a * b

# Look at the Environment pane (top right): every object you create appears there.


### Integers and doubles -------------------------------------------------------
num_val  <- as.numeric(1.2)
doub_val <- as.double(1.2)
int_val  <- as.integer(1.2)   # note: 1.2 becomes 1 — the decimals are dropped

is.numeric(num_val)
is.double(num_val)
is.integer(num_val)


### Character strings ----------------------------------------------------------
mystring      <- 'Hello'
myotherstring <- 'World'

# !! meant to fail — run it and read the error. You cannot add up text.
themstring <- mystring + myotherstring

# This is how you glue strings together:
themstring <- paste0(mystring, " ", myotherstring)
themstring


### Logical (boolean) values ---------------------------------------------------
male   <- TRUE
female <- FALSE

# A logical expression asks a question and answers TRUE or FALSE.
a == b   # is a equal to b?
a != b   # is a different from b?

equality <- a == b   # the answer can be stored, like any other value

# Watch the difference:
#   =   assigns a value inside a function argument
#   <-  assigns a value to an object
#   ==  compares two values


### Built-in functions ---------------------------------------------------------
sqrt(4)
typeof(male)
print(c)
print(themstring)
print(equality)

# Any function's help page: put a question mark in front of it.
?sqrt


## Vectors ---------------------------------------------------------------------
# c() means "combine". A vector holds several values of the SAME type.
v <- c(2, 5, 10, 13)
z <- c(3, 4, 7, 10)
u <- c("one", "two", "apple")
w <- c(v, z)   # combining two vectors gives one longer vector


## Matrices --------------------------------------------------------------------
A <- matrix(data = c(2, 5, 3, 8, 7, 1), nrow = 2)
B <- matrix(data = c(7, 10, 1, 2, 1, 5), nrow = 3)

# Note that R fills the matrix COLUMN by column, not row by row.


### Named rows and columns -----------------------------------------------------
C <- matrix(data = c(2, 5, 3, 8), nrow = 2,
            dimnames = list(c('row1', 'row2'),    # first argument: rows
                            c('col1', 'col2')))   # second argument: columns
C


### Building matrices with rbind() and cbind() ---------------------------------
# rbind: stack vectors on top of each other as rows
d1 <- c(100, 47, 178)
d2 <- c(45, 24, 176)
d3 <- c(57, 29, 189)

M1 <- rbind(d1, d2, d3)

# Careful: do NOT call your objects rownames or colnames — those are the names
# of existing R functions, and you would hide them.
row_names <- list(c('Alex', 'Bob', 'Charlie'))
col_names <- list(c('wage', 'age', 'height'))
dimnames(M1) <- c(row_names, col_names)
M1

# cbind: put vectors next to each other as columns
e1 <- c(2, 5)
e2 <- c(8, 3)
M2 <- cbind(e1, e2)
M2


### Indexing a matrix ----------------------------------------------------------
# The rule everywhere in R: [row, column]
C[1, 2]
C['row1', 'col2']   # the same element, by name


### Operations with vectors and matrices ---------------------------------------
v + z          # element-wise addition
v * z          # element-wise multiplication (NOT matrix multiplication)
a + v          # a single number is applied to every element
v %*% t(z)     # matrix multiplication: %*%
A %*% B        # 2x3 times 3x2 gives 2x2
t(A)           # transpose
solve(C)       # inverse


## Lists -----------------------------------------------------------------------
# A vector holds one type. A list can hold anything, including other lists.
my_list  <- list('a', 2, 0 == 1)
my_list2 <- list(c('a', 'b'), c(1, 2, 3), sqrt(2)^2 == 2, my_list)


### Single vs. double square brackets ------------------------------------------
my_list2[1]
typeof(my_list2[1])          # list — a shorter list

my_list2[[1]]
typeof(my_list2[[1]])        # character — the contents of that slot

my_list2[[1]][2]
typeof(my_list2[[1]][2])     # character — one element out of those contents

# [ ] keeps the box, [[ ]] takes what is inside it.


## Size of an object -----------------------------------------------------------
length(v)
length(w)
length(A)   # number of ELEMENTS in the matrix
dim(A)      # its dimensions: rows, columns


## Indexing a vector -----------------------------------------------------------
v[1]          # first element
v[2:4]        # elements 2 to 4
v[c(2, 4)]    # elements 2 and 4

# R counts from 1, not from 0.


## Special values --------------------------------------------------------------
null_vector <- c()                  # nothing at all
inf_vector  <- c(Inf, 1, 2, 3, 4)   # infinity
nan_vector  <- c(NaN, 1, 2, 3, 4)   # NaN: "not a number", e.g. 0/0
na_vector   <- c(NA, 1, 2, 3, 4)    # NA:  "not available", a missing value

# What happens when you compute with them?
null_vector + 3   # stays empty
nan_vector + 3    # NaN stays NaN
na_vector + 3     # NA stays NA  <- this is the one you will meet constantly
inf_vector + 3    # Inf stays Inf

# The lesson: missing values are contagious. One NA in a column is enough to
# make the mean of that column NA. Session 4 is largely about dealing with this.


## Rounding and numerical precision --------------------------------------------
sqrt(2)^2 == 2          # FALSE! Why?
sqrt(2)^2 - 2           # the computer stores an approximation
round(sqrt(2)^2) == 2   # TRUE

# Never test two computed numbers for exact equality.


## Loops -----------------------------------------------------------------------
### for loop: repeat something a known number of times -------------------------
for (i in 1:5) {
  print(paste0("i = ", i))
}

### while loop: repeat until a condition stops being true ----------------------
x <- 100
while (x > 10) {
  x <- x - 10
  print(paste0("There are ", x, " km left."))
}


## if conditions ---------------------------------------------------------------
price_apple <- 105
price_tesla <- 100

# If Apple is cheaper, buy Apple; if it is more expensive, buy Tesla;
# if the prices are the same, say so.
if (price_apple < price_tesla) {
  print('Buy Apple!')
} else if (price_apple > price_tesla) {
  print('Buy Tesla!')
} else {
  print('Prices are equal!')
}

# Change price_apple and run the block again to see the other branches.


# >>> COMMIT CHECKPOINT 1 <<<
# Save this file in your own repository and make your first commit.


# ==============================================================================
# 2) Case study: CEO salary and return on equity
# ==============================================================================
# Story: firms pay their CEOs a lot. Is the pay related to how well the firm
# does? We use return on equity (ROE) as the measure of firm performance.
#
# The data comes with the wooldridge package: 209 US CEOs, 1990.
# salary is in thousands of dollars, roe is in per cent.
# ?ceosal1 gives the full variable list.

ceo <- ceosal1


## First look at the data ------------------------------------------------------
str(ceo)      # structure: variables, their types, first values
head(ceo)     # first six rows
summary(ceo)  # descriptive statistics of every variable
view(ceo)     # the whole table in a spreadsheet-like viewer

# Always look at your data before you analyse it.


## A first plot ----------------------------------------------------------------
# ggplot2 builds a plot in layers, added together with +
#   data     what to plot from
#   mapping  which variable goes on which axis (aes = aesthetics)
#   geom_*   what to actually draw
ggplot(data = ceo,
       mapping = aes(x = roe,
                     y = salary)) +
  geom_point()


## Saving the "base" of a plot -------------------------------------------------
# The base can be stored and reused, so you do not retype it every time.
roe_salary_plot <- ggplot(data = ceo,
                          mapping = aes(x = roe,
                                        y = salary))

# Add a scatter plot and a fitted straight line to it.
roe_salary_plot +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x)

# Two or three firms pay far more than the rest, and they stretch the whole
# picture. Let us look at that.


## Looking for outliers --------------------------------------------------------
ggplot(data = ceo,
       mapping = aes(x = salary)) +
  geom_histogram(binwidth = 100) +
  scale_x_continuous(breaks = seq(0, 15000, by = 3000))

# The 99th percentile of salary:
quantile(ceo$salary, probs = 0.99)

# $  pulls one variable out of a data set as a vector.


## Dropping the outliers -------------------------------------------------------
# NOTE: this changes the data. Dropping observations is a decision you must be
# able to defend, and you should always say in your write-up that you did it.
cutoff <- quantile(ceo$salary, probs = 0.99)
ceo <- ceo[ceo$salary < cutoff, ]

# The [row, column] rule again: keep the rows where salary is below the cutoff,
# keep all columns. Session 2 shows the tidyverse way of doing the same thing.


## Creating a new variable -----------------------------------------------------
# The data has four 0/1 dummies for industry. One readable variable is nicer.
# ifelse(condition, value if TRUE, value if FALSE), nested three deep.
# with() lets you refer to the variables without writing ceo$ every time.
ceo$industry <- factor(
  with(ceo,
       ifelse(indus == 1, 'industrial',
              ifelse(finance == 1, 'financial',
                     ifelse(consprod == 1, 'consumer products',
                            'transport and utility'))))
)

table(ceo$industry)

# A factor is R's type for a categorical variable: values plus a fixed set of
# allowed categories, called levels.


## Rebuilding the plot with the new data ---------------------------------------
# The stored plot base still points at the OLD data, so build it again.
roe_salary_plot <- ggplot(data = ceo,
                          mapping = aes(x = roe,
                                        y = salary))

### Colour everything by industry ----------------------------------------------
# The colour is in the main mapping, so BOTH the points and the lines split.
roe_salary_plot +
  aes(colour = industry) +
  geom_point() +
  geom_smooth(method = "lm", formula = y ~ x)

### Colour only the points -----------------------------------------------------
# The colour is inside geom_point(), so only the points split, and the line is
# fitted to all the data at once.
roe_salary_plot +
  geom_point(mapping = aes(colour = industry)) +
  geom_smooth(method = "lm", formula = y ~ x)

### Set the colour of the line by hand -----------------------------------------
# colour INSIDE aes() = "use this variable to decide the colour"
# colour OUTSIDE aes() = "make it this colour, full stop"
roe_salary_plot +
  geom_point(mapping = aes(colour = industry)) +
  geom_smooth(method = "lm", formula = y ~ x,
              colour = 'black')

### Label the axes -------------------------------------------------------------
# A plot without units on the axes cannot be read. Always add labs().
roe_salary_plot +
  geom_point(mapping = aes(colour = industry)) +
  geom_smooth(method = "lm", formula = y ~ x,
              colour = 'black') +
  labs(x = 'ROE (%)',
       y = 'Salary ($1000)',
       colour = 'Industry')


## From a working plot to a presentable one ------------------------------------
# Everything above is the analysis. Everything below is presentation: sizes,
# transparency, a title, a theme, a colour palette, nicer axis ticks.
#
# This is a good place to use an AI assistant: describe the plot you want in
# words and let it write the theme() and scale_*() lines. Then read what it
# produced and check that it did not change the DATA — only the appearance.
roe_salary_figure <- roe_salary_plot +
  geom_point(mapping = aes(colour = industry),
             size = 3,
             alpha = 0.7) +                      # alpha = transparency
  geom_smooth(method = "lm", formula = y ~ x,
              colour = 'black',
              linetype = 'dashed',
              linewidth = 1) +
  labs(title = 'CEO salary and return on equity',
       subtitle = '209 US firms, 1990, top 1% of salaries excluded',
       x = 'ROE (%)',
       y = 'Salary ($1000)',
       colour = '') +
  theme_minimal() +
  theme(text = element_text(size = 14),
        plot.title = element_text(hjust = 0.5, face = 'bold', size = 16),
        plot.subtitle = element_text(hjust = 0.5, size = 12),
        legend.position = 'top') +
  scale_colour_brewer(palette = 'Set1') +
  scale_x_continuous(breaks = seq(-20, 80, by = 10)) +
  scale_y_continuous(breaks = seq(0, 6000, by = 500))

roe_salary_figure


## Saving the figure -----------------------------------------------------------
# ggsave() writes the LAST plot shown, or the one you name explicitly.
ggsave(filename = 'ceo_salary_roe.png',
       plot = roe_salary_figure,
       path = 'output/figures/',
       width = 10,
       height = 6,
       dpi = 300)

# The path is relative to the project folder. It works because you opened the
# .Rproj file — which is exactly why this script contains no setwd() line.


# >>> COMMIT CHECKPOINT 2 <<<
# Commit your work to your own repository before you leave.


# ==============================================================================
# What we did
# ==============================================================================
# - objects, types, vectors, matrices, lists, indexing
# - missing and special values, and why exact equality fails on decimals
# - loops and if conditions
# - a first real data set, and a plot built up layer by layer
#
# Next session: tidy data, tibbles, and the pipe operator — the tools that make
# the base-R indexing above unnecessary.
