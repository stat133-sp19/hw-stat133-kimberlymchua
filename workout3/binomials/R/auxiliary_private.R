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
  mode <- floor((trials * prob) + prob)
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
