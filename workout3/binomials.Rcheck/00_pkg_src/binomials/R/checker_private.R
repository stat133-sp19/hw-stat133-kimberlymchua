#private auxiliary function to check if probability is a valid probability between 0 and 1

check_prob <- function(prob) {
  if (prob > 1) {
    stop("probability has to be a number between 0 and 1")
  }
  else if (class(prob) != "numeric") {
    stop("prob input class has to be a numeric")
  }
  else if (prob < 0) {
    stop("probability has to be a number between 0 and 1")
  }
  else (prob <= 1 & prob >= 0) {
    return(TRUE)
  }
}

#private auxilitary function to check if trials is a valid number of trials

check_trials <- function(trials){
  if (trials < 0) {
    stop("invalid trials value")
  }
  else if (class(trials) != "numeric") {
    stop("trials input class has to be numeric")
  }
  else (trials == as.integer(trials) & trials >= 0){
    return(TRUE)
  }
}

#private auxiliary function to check if success is valid number of successes

check_success <- function(success, trials){
  check_trials(trials)
  if (any(success != floor(success) | success < 0)){
    stop('invalid success value')
  }
  else if(any(trials < success)) {
    stop('success can not be greater than trials')
  }
  else {
    return(TRUE)
  }
}
