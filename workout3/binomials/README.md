# Workout3 README 

- Author: Kimberly Chua
- Date: April 30, 2019
- GSI: Dodo Qian
- Section: 102

Overview
--------

The package `"binomial"` is an R package that implements functions for calculating probabilities of a Binomial random variable, and related calculations such as the probability distribution, the expected value, variance, etc.

-   `bin_variable()` initiates a binomial variable
-   `summary()` provides a summary of the given binomial variable
-   `bin_choose()` calculates the number of combinations in which k successes can occur in n trials
-   `bin_probability()` calculates the probability of certain successes in certain trials with certain probability
-   `bin_distribution()` creates a dataframe for the probability of each successes with certain probability and trials
-   `bin_cumulative()` creates a dataframe for cumulative probability of each successes certain with probability and trials
-   `bin_mean()`,`bin_variance()`,`bin_mode()`,`bin_skewness()`,`bin_kurtosis()` calculate important statistic measurements of the binomial distribution

Motivation
----------

This package has been developed to help people better understand the concepts behind the creation of an R package

Installation
------------

Install the development version from GitHub via the package `"devtools"`:

```{r}
# development version from GitHub:
#install.packages("devtools") 
# install "binomial" 
devtools::install_github("hw-stat133-UpwithSylvia/workout03/binomial")
```
