% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main_binomial.R
\name{bin_mode}
\alias{bin_mode}
\title{binomial mode}
\usage{
bin_mode(trials, prob)
}
\arguments{
\item{trials}{number of trials; is an integer}

\item{prob}{probability of success; is a probability}
}
\value{
the mode of the binomial
}
\description{
Calculates the mode of the binomal distribution
}
\examples{
# 10 trials with probability of success 0.5
bin_mode(10, 0.5)

}
