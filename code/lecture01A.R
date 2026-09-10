# ------------------------------------------------------------------------------
# Coding basics in R
# based on
#   - Ágoston Reguly, Gábor Békés: Introduction to Data Analysis with R - lecture materials
#   - Rafael Irizarry: Introduction to Data Science: Data Wrangling and Visualization with R

# Edited using Positron by E. Timár
# ------------------------------------------------------------------------------

## Useful shortcuts ------------------------------------------------------------
# assignment: Alt + - / Option + -
# pipe operator: Ctrl + Shift + M / Command + Shift + M
# run current line/selection: Ctrl + Enter / Command + Enter
# comment/uncomment line/selection: Ctrl + Shift + C / Command + Shift + C

## Housekeeping -------------------------------------------------------
# Use this only if you want to reset the workspace
# rm(list = ls())

sessionInfo() # check the R version and other details

## Packages/libraries ----------------------------------------------------------
# Run once when you first install packages:
install.packages('tidyverse')
install.packages('wooldridge')

# load packages
library(tidyverse)
library(wooldridge)

## 1) Objects and variables ----------------------------------------------------
# everything in R is an object

# define numeric objects:
a <- 2
b <- 3
c <- a * b

# do mathematical operations with them:
a + b
a + b - (a * b) ^ a

# store a result as an object:
d <- a + b
d

# logical expressions:
a == b
a != b
equality <- a == b
 a == a
1/2 == 0.5
# negation:
a != b

# other logical operators for multiple statements
2 == 2 & 3 == 2  # and
2 == 2 | 3 == 2  # either/or

# Boolean objects:
male <- TRUE
female <- FALSE

typeof(male)

## 2) Character strings --------------------------------------------------------
mystring <- "Hello"
myotherstring <- "World"

paste(mystring, myotherstring)

## 3) Functions ---------------------------------------------------------------
# R has many built-in functions

sqrt(4)
sum(c(1, 2, 3))
mean(c(5, 7, 8, 10))

# get help
?sqrt

## 4) Vectors -----------------------------------------------------------------
v <- c(2, 5, 10, 13)
z <- c(3, 4, 7, 10)

v
z

length(v)
sum(v)
mean(v)

# indexing: select an element from a vector (or matrix)
v[1]
v[2:4]
v[c(1, 3)]

# arithmetic on vectors
v + z
v * z

## 5) Matrices -----------------------------------------------------------------
M <- matrix(c(1, 2, 3, 4), nrow = 2)
M
M[1, 2]
t(M)
dim(M)


## 6) Data frames --------------------------------------------------------------
# this is the most important object for econometrics! 

ceo <- ceosal1  # it loads a dataset that is part of the wooldridge package, no need to download it 
str(ceo)
head(ceo)
names(ceo)

# access a column with $
ceo$salary
mean(ceo$salary)
summary(ceo$salary)

# subset rows
ceo[1:5, c("salary", "roe")]

# subset by condition
subset(ceo, roe > 20)

## 7) Indexing and missing values ---------------------------------------------
na_vector <- c(1, NA, 3, 4)
is.na(na_vector)

mean(na_vector, na.rm = TRUE)

# special values
nan_vector <- c(NaN, 1, 2, 3)
inf_vector <- c(Inf, 1, 2, 3)

nan_vector
inf_vector

## 8) Practice exercise -------------------------------------------------------
# 1. Create a vector of 5 numbers
# 2. Compute the mean
# 3. Store the result in an object called avg_x
# 4. Create a small data frame with two columns: name and score
# 5. Print the first few rows
