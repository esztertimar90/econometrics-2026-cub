# ------------------------------------------------------------------------------
# Coding basics in R
# based on
#   - Ágoston Reguly, Gábor Békés: Introduction to Data Analysis with R - lecture materials
#   - Rafael Irizarry: Introduction to Data Science: Data Wrangling and Visualization with R

# Edited using Positron by E. Timár 

## useful short cuts -----------------------------------------------------------
# assignment: Alt + - / Option + -
# pipe operator: Ctrl + Shift + M / Command + Shift + M
# run current line/selection: Ctrl + Enter / Command + Enter
# comment/uncomment line/selection: Ctrl + Shift + C / Command + Shift + C

## cleaning the environment ----------------------------------------------------
rm(list = ls())

## packages/libraries ----------------------------------------------------------
# install packages
install.packages('tidyverse')
install.packages('wooldridge')

# load packages
library(tidyverse)
library(wooldridge)

## 1) Coding basics ------------------------------------------------------------
# objects and variables: essentially, everything in R is an object 

# we can define numeric R-objects:
a <- 2 
b <- 3
c <- a*b

# do mathematical operations with them:
a+b-(a*b)^a

c <- a + b
d <- a*c/b*c

# define and evaluate logical expressions:
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

# define boolean objects (= TRUE or FALSE):
male <- TRUE 
female <- FALSE

# objects can store text (string):
mystring <- 'Hello' # character/string
myotherstring <- 'World'

## R has functions: a reusable block of code that executes a task. 
# R has built-in functions, but you can also create your own. 

# some built-in functions:

sqrt(4)  #calculate the square root of 4
typeof(male)  #retrieve the type of an object 
print(c)  #display an object
print(equality)

print(mystring + myotherstring) 
paste(mystring, myotherstring)

?sqrt # get help on a function

# vectors
v <- c(2, 5, 10, 13)
z <- c(3, 4, 7, 10)
u <- c("one", "two", "apple")
w <- c(v, z) # concatenation of vectors
  # structure: name of vector <- c('name1', 'name2', 'name3', 'name4')

# matrices
    # Questionwhat is the difference between a vector and a matrix?

A = matrix(data = c(2, 5, 3, 8, 7, 1), nrow = 2)
B = matrix(data = c(7, 10, 1, 2, 1, 5), nrow = 3)
print(A)
print(B)

  # matrix with named rows and columns
  C = matrix( data = c(2, 5, 3, 8), nrow = 2,
              dimnames = list(c('row1', 'row2'), # first argument is for rows
                              c('col1', 'col2'))) # second argument is for columns

print(C)

  # define a matrix using row binds and column binds
  # row bind
  d1 <- c(100, 47, 178)
  d2 <- c(45, 24, 176)
  d3 <- c(57, 29, 189)
  rownames <- list(c('Alex', "Bob", "Charlie"))
  colnames <- list(c('wage', 'age', 'height'))
  M1 <- rbind(d1, d2, d3)
  dimnames(M1) <- c(rownames, colnames)
  print(M1)
  
  # column bind
  e1 <- c(2, 5)
  e2 <- c(8, 3)
  M2 <- cbind(e1, e2)
  
  C[1,2] # indexing
  C['row1', 'col2'] # indexing with names

  # operations with vectors and matrices
  v + z # element-wise addition
  v*z # element-wise multiplication
  a+v # simple arithmetic with a vector
  v%*%t(z) # matrix multiplication
  A%*%B # matrix multiplication
  t(A) # transpose of a matrix
  solve(C) # inverse of a matrix
  
# lists
my_list <- list('a', 2, 0 == 1)
my_list2 <- list(c('a','b'), c(1,2,3), sqrt(2)^2==2, my_list)
  
  # list indexing
  my_list2[1]
  typeof(my_list2[1]) # list
  
  my_list2[[1]]
  typeof(my_list2[[1]]) # character vector
  
  my_list2[[1]][2]
  typeof(my_list2[[1]][2]) # character vector

# number of elements
length(v)
length(w) # number of elements in the new vector
length(A) # number of elements in the matrix
dim(A) # dimensions of the matrix

# indexing: select an element from the matrix or vector
print(v)
v[1]
v[2:4]
v[c(2, 4)]

# special objects
null_vector <- c() # null vector
inf_vector <- c(Inf, 1, 2, 3, 4) # infinity
nan_vector <- c(NaN, 1, 2, 3, 4) # impossible values (e.g., dividing by zero) are represented by NaN (not a number)
na_vector <- c(NA, 1, 2, 3, 4) # missing values are represented by NA (not available)

  # operations with special objects
  null_vector + 3
  nan_vector + 3
  na_vector + 3
  inf_vector + 3
  
# rounding
sqrt(2)^2 == 2 # why? -> numerical approximation
round(sqrt(2)^2) == 2 # fixing

