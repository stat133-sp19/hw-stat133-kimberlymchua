% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_binomial.R
\name{bin_skewness}
\alias{bin_skewness}
\title{binomial skewness}
\usage{
bin_skewness(trials, prob)
}
\arguments{
\item{trials}{number of trials; is an integer}

\item{prob}{probability of success; is a probability}
}
\value{
the skewness of the binomial
}
\description{
Calculates the skewness of the binomal distribution
}
\examples{
# 10 trials with probability of success 0.5
bin_skewness(10, 0.5)

}
