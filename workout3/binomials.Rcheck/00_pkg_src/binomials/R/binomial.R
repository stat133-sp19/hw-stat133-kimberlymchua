#' @title bin_choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param prob a probability value
#' @param n is the number of trials
#' @param k is the number of successes
#' @return the number of calculations in which k  successes can occur in n trials
#' @export
#' @examples
#' # default
#' bin_choose(n = 5, k = 2)
#' bin_choose(5, 0)
#' bin_choose(5, 1:3)

bin_choose <- function(k, n){
  if (k > n){
    stop("k cannot be greater than n")
  }
  top <- factorial(trials)
  bottom <- factorial(success) * (factorial(trials) - factorial(success))
  choose_bin <- top/bottom
  return(choose_bin)
}

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
#' @title bin_probability
#' @description to check the probability of the binomial
#' @param success is the number of succcesses
#' @param trials is the number of trials
#' @param prob is the number of parameters
#' @return computes the probability of success, given probability and trials
#' @export
#' @examples
#' # default
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob){
  check_trials(trials)
  check_prob(prob)
  check_success(success, trials)

  probability <- bin_choose * ((prob)**success) * ((1 - prob)**(trials - success))
  return(probability)
}


#' @title bin_distribution
#' @description to create a data frame with the successes and probability in two separate columns
#' @param trials is the number of trials
#' @param prob is the probability
#' @return data frame wih two classes: c("bindis", "data.frame")
#' @export
#' @examples
#' # default
#' bin_distribution(trials = 5, prob = 0.5)

bin_distribution <- function(trials, prob){
  bindis <- data.frame(success=(0:trials), probability=bin_probability)
  class(bindis) = c("bindis", "data.frame")
  return(bindis)
}

#' @export
plot.bindis <- function(bin_distribution){
  plot(bin_distribution$success, bin_distribution$probability, freqs, type = "n", ylim = c(0, 1), las = 1,
       xlab = "successes", 0:trials,
       ylab = "probability", bin_distribution$probability,
  abline(h = 0.5, col = "gray70", lwd = 1.5))
}

#' @title bin_cumulative
#' @description to create a data frame with the successes, probability, and cumulative in three separate columns
#' @param trials is the numbers of trials
#' @param prob is the probability
#' @return data frame wih two classes: c("bincum", "data.frame")
#' @export
#' @examples
#' # default
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)

bin_cumulative <- function(trials, prob){
  bincum <- bin_distribution(trials, prob)
  bincum[, "cumulative"] <- cumsum(bin_distribution$prob)
  class(bincum) = c("bincum", "data.frame")
  return(bincum)
}

#' @export
plot.bincum <- function(bin_cumulative){
  plot(bin_cumulative$success, bin_cumulative$probability, freqs, type = "n", ylim = c(0, 1), las = 1,
       xlab = "successes", 0:trials,
       ylab = "probability", bin_cumulative$bincum,
       abline(h = 0.5, col = "gray70", lwd = 1.5))
}

#' @title bin_variable
#' @description to return an object of a class
#' @param trials is the numbers of trials
#' @param prob is the probability
#' @return object of a class "binvar"
#' @export
#' @examples
#' # default
#' bin1 <- bin_variable(trials = 10, p = 0.3)
#' bin1
#'

bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  result <-
  class(binvar) = c("binvar")
}

#' @export
print.binvar <- function(bin_variable){
  print("Binomial Variable")

  print("Parameters")
  cat("- number of trials:", trials)
  cat("- prob of success:", prob)
}

#' @export
summary.binvar <- function(bin_variable){
  print("Summary Binomial")

  print("Parameters")
  cat("- number of trials:", trials)
  cat("- prob of success:", prob)

  print("Measures")
  cat("- mean:", aux_mean(trials, prob))
  cat("- variance:", aux_variance(trials, prob))
  cat("- mode:", aux_mode(trials, prob))
  cat("- skewness:", aux_mode(trials, prob))
  cat("- kurtosis:", aux_mode(trials, prob))
}

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  mean <- aux_mean(trials, prob)
  return(mean)
}

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  variance <- aux_variance(trials, prob)
  return(variance)
}

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  mode <- aux_mode(trials, prob)
  return(mode)
}

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  skewness <- aux_skewness(trials, prob)
  return(skewness)
}

bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  kurtosis <- aux_kurtosis(trials, prob)
  return(kurtosis)
}
