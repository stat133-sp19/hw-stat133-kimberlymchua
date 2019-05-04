## ---- include = FALSE----------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup---------------------------------------------------------------
library(binomials)

## ---- echo=FALSE---------------------------------------------------------
bin_distribution <- function(trials, prob){
  bindis <- data.frame(success=(0:trials), probability = bin_probability(success = 0:trials, trials = trials, prob = prob))
  class(bindis) = c("bindis", "data.frame")
  return(bindis)
}


## ---- echo=FALSE---------------------------------------------------------
bin_cumulative <- function(trials, prob){
  test <- bin_probability(success = 0:trials, trials = trials, prob = prob)
  cum_sum <- cumsum(test)
  dframe <- data.frame(success = c(0:trials), probability = test, cumulative = cum_sum)
  class(dframe) <- c("bincum", "data.frame")
  return(dframe)
}

