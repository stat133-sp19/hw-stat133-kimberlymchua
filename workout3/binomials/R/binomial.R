#' @title binomial
#'
#' @description create the binomial function
#' @param prob a probability value
#' @param trials the number of trials
#' @param success the number of successes
#' @return the binomial equation

#private auxiliary function to check if probability is a valid probability between 0 and 1

check_prob <- function(prob) {
  if (prob > 1) {
    stop("probability has to be a number between 0 and 1")
  }
  if (prob < 0) {
    stop("probability has to be a number between 0 and 1")
  }
  TRUE
}

#private auxilitary function to check if trials is a valid number of trials

check_trials <- function(trials){
  if (trials < 0) {
    stop("invalid trials value")
  }
  TRUE
}

#private auxiliary function to check if success is valid number of successes

check_success <- function(success, trials){
  if (success < 0){
    stop("invalid success value")
  }
  if (trials < success){
    stop("success cannot be greater than trials")
  }
  TRUE
}

#private aux function to find mean
aux_mean <- function(trials, prob){
  #mean of binomial is np
  expected_values <- trials * prob
  return(expected_values)
}
#private aux function to find variance
aux_variance <- function(trials, prob){
  #variance of binomial is np(1-p)
  variance <- trials * prob * (1 - prob)
  return(variance)
}
#private aux function to find mode
aux_mode <- function(trials, prob){
  #mode of binomial is int(np + p) - int is integer part function
  mode <- floor((trials * prob) + prob))
return(mode)
}
#private aux function to find skewness
aux_skewness <- function(trials, prob){
  #skewness is (1 - 2p)/(sqrt(np(1-p)))
  numer <- (1 - 2*prob)
  denom <- sqrt((trials * prob)*(1 - prob))
  skewness <- numer/denom
  return(skewness)
}
#private aux function to find kurtosis
aux_kurtosis <- function(trials, prob){
  #kurtosis is (1-6p(1-p))/np(1-p)
  numerator <- (1 - (6 * prob)) * (1 - prob)
  denominator <- ((trials * prob)*(1 - prob))
  kurtosis <- numerator/denominator
  return(kurtosis)
}
