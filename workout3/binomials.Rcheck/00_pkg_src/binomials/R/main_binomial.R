##**Main Binomial Functions**

#' @title binomial choose
#' @description calculates the number of combinations in which k successes can occur in n trials
#' @param prob a probability value
#' @param n is the number of trials; is an integer
#' @param k is the number of successes; is an integer
#' @return the number of calculations in which k  successes can occur in n trials
#' @export
#' @examples
#' bin_choose(n = 5, k = 2)

bin_choose <- function(k, n){
  if (k > n){
    stop("k cannot be greater than n")
  }
  else {
    top <- factorial(n)
    bottom <- factorial(k) * (factorial(n) - factorial(k))
    choose_bin <- top/bottom
    return(choose_bin)
}}


#' @title binomial probability
#' @description to check the probability of the binomial
#' @param success is the number of succcesses; is an integer
#' @param trials is the number of trials; is an integer
#' @param prob is the success probability; is a numeric
#' @return computes the probability of success, given probability and trials
#' @export
#' @examples
#' bin_probability(success = 2, trials = 5, prob = 0.5)
#' bin_probability(success = 0:2, trials = 5, prob = 0.5)
#' bin_probability(success = 55, trials = 100, prob = 0.45)

bin_probability <- function(success, trials, prob){
  if (check_trials(trials) != TRUE) {
    stop("invalid number of trials")
  }
  else if (check_prob(prob) != TRUE){
    stop("invalid probability")
  }
  else if (check_success(success, trials) != TRUE){
    stop("successes must be integers that are less than the number of trials")
  }
  else {
    probability <- bin_choose(k = success, n = trials) * ((prob)^success) * ((1 - prob)^(trials - success))
    return(probability)
}}


#' @title bin_distribution
#' @description to create a data frame with the successes and probability in two separate columns
#' @param trials is the number of trials; is an integer
#' @param prob is the success probability; is a double
#' @return data frame wih two classes: c("bindis", "data.frame")
#' @export
#' @examples
#' bin_distribution(trials = 5, prob = 0.5)
#' bin_distribution(5, 0.5)

bin_distribution <- function(trials, prob){
  bindis <- data.frame(success=(0:trials), probability = bin_probability(success = 0:trials, trials = trials, prob = prob))
  class(bindis) = c("bindis", "data.frame")
  return(bindis)
}

#' @export
plot.bindis <- function(x, ...){
  barplot(x$probability, xlab = 'successes', ylab = 'probability',
    names.arg = x$success,las = 1, col = #000080
  )
}

#' @title binomial cumulative distribution
#' @description to create a data frame with the successes, probability, and cumulative in three separate columns
#' @param trials is the numbers of trials; is an integer
#' @param prob is the success probability; is a double
#' @return data frame wih two classes: c("bincum", "data.frame")
#' @export
#' @examples
#' dis2 <- bin_cumulative(trials = 5, prob = 0.5)
#' plot(dis2)

bin_cumulative <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  success <- c(0:trials)
  bin_probability <- bin_probability(success, trials, prob)
  cum_probability <- cumsum(bin_probability)
  results <- data.frame("success" = success, "probability" = bin_probability, "cumulative" = cum_probability)
  class(results) <- c("bincum", "data.frame")
  return(results)
}

#' @export
plot.bincum <- function(x, ...){
  graphics::plot(
    x = x$success, y = x$cumulative, xlab = 'successes', ylab = 'probability'
  )
}

#' @title binomial variable
#' @description to return an object of a class
#' @param trials is the numbers of trials; is an integer
#' @param prob is the probability; is a double
#' @return object of a class "binvar"
#' @export
#' @examples
#' bin_variable(trials = 10, p = 0.3)
#'

bin_variable <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  result <- list(trials = trials, prob = prob)
  class(binvar) = c("binvar")
  return(result)
}

#' @export
print.binvar <- function(x, ...) {
  cat('"Binomial variable"\n')
  cat('"Parameters"\n')
  cat("- number of trials:", x$trials, '\n')
  cat("- prob of success:", x$prob)

}

#' @export
summary.binvar <- function(x, ...){
  cat('"Summary Binomial"\n\n')

  cat('"Parameters"\n')
  cat("- number of trials:", x$trials, '\n')
  cat("- prob of success:", x$prob)

  cat('"Measures"\n')
  cat("- mean:", aux_mean(x$trials, x$prob), '\n')
  cat("- variance:", aux_variance(x$trials, x$prob), '\n')
  cat("- mode:", aux_mode(x$trials, x$prob), '\n')
  cat("- skewness:", aux_mode(x$trials, x$prob), '\n')
  cat("- kurtosis:", aux_mode(x$trials, x$prob), '\n')
}

#' @export
print.summary.binvar <- function(x, ...){
    cat('"Summary Binomial"\n\n')

    cat('"Parameters"\n')
    cat("- number of trials:", x$trials, '\n')
    cat("- prob of success:", x$prob)

    cat('"Measures"\n')
    cat("- mean:", aux_mean(x$trials, x$prob), '\n')
    cat("- variance:", aux_variance(x$trials, x$prob), '\n')
    cat("- mode:", aux_mode(x$trials, x$prob), '\n')
    cat("- skewness:", aux_mode(x$trials, x$prob), '\n')
    cat("- kurtosis:", aux_mode(x$trials, x$prob), '\n')
  }

#' @title binomial mean
#' @description Calculates the mean of the binomal distribution
#' @param trials number of trials; is integer
#' @param prob probability of success; is a double
#' @return the average of the binomial distribution
#' @examples
#' # 10 trials with probability of success 0.7
#' bin_mean(10, 0.7)

bin_mean <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  mean <- aux_mean(trials, prob)
  return(mean)
}

#' @title binomial variance
#' @description Calculates the variance of the binomal distribution
#' @param trials number of trials; is an integer
#' @param prob probability of success; is a probability
#' @return the variance of the binomial
#' @examples
#' # 10 trials with probability of success 0.5
#' bin_variance(10, 0.5)
#'

bin_variance <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  variance <- aux_variance(trials, prob)
  return(variance)
}

#' @title binomial mode
#' @description Calculates the mode of the binomal distribution
#' @param trials number of trials; is an integer
#' @param prob probability of success; is a probability
#' @return the mode of the binomial
#' @examples
#' # 10 trials with probability of success 0.5
#' bin_mode(10, 0.5)
#'

bin_mode <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  mode <- aux_mode(trials, prob)
  return(mode)
}

#' @title binomial skewness
#' @description Calculates the skewness of the binomal distribution
#' @param trials number of trials; is an integer
#' @param prob probability of success; is a probability
#' @return the skewness of the binomial
#' @examples
#' # 10 trials with probability of success 0.5
#' bin_skewness(10, 0.5)
#'

bin_skewness <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  skewness <- aux_skewness(trials, prob)
  return(skewness)
}

#' @title binomial kurtosis
#' @description Calculates the kurtosis of the binomal distribution
#' @param trials number of trials; is an integer
#' @param prob probability of success; is a probability
#' @return the kurtosis of the binomial
#' @examples
#' # 10 trials with probability of success 0.5
#' bin_kurtosis(trials = 10, prob = 0.5)


bin_kurtosis <- function(trials, prob){
  check_trials(trials)
  check_prob(prob)
  kurtosis <- aux_kurtosis(trials, prob)
  return(kurtosis)
}
