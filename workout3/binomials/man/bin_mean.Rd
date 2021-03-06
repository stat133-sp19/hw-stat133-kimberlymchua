% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_binomial.R
\name{bin_mean}
\alias{bin_mean}
\title{binomial mean}
\usage{
bin_mean(trials, prob)
}
\arguments{
\item{trials}{number of trials; is integer}

\item{prob}{probability of success; is a double}
}
\value{
the average of the binomial distribution
}
\description{
Calculates the mean of the binomal distribution
}
\examples{
# 10 trials with probability of success 0.7
bin_mean(10, 0.7)
}
