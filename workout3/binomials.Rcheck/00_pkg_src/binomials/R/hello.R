#' @title binomial
#' @description create the binomial function
#' @param asdksjd
#' @param asdlkjdsf
#' @return aslkdjlfs
#'

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
