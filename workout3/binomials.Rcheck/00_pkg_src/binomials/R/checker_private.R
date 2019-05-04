##**Private Auxiliary Checker Functions**

#private auxiliary function to check if probability is a valid probability between 0 and 1

check_prob <- function(prob){
  if (prob >= 0 & prob <= 1){
    return(TRUE)
  }
  else {
    stop("probability value is invalid")
  }
}

#private auxilitary function to check if trials is a valid number of trials

check_trials <- function(trials){
  if (trials == floor(trials) & trials >= 0){
    return(TRUE)
  }
  else {
    stop("invalid value for trials")
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
