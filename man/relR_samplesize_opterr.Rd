% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/relR_samplesize_solve.R
\name{relR_samplesize_opterr}
\alias{relR_samplesize_opterr}
\title{Function to calculate the error in estimated sample size for use in optimize function}
\usage{
relR_samplesize_opterr(
  m,
  R_a,
  R_b,
  p_a,
  N,
  alpha,
  alternative,
  power,
  sensitivity,
  specificity,
  overdispersion
)
}
\arguments{
\item{m}{the sample size.}

\item{R_a}{Numeric (Positive). The assumed R among the group in the
denominator of the ratio. Input value must be greater than 0.}

\item{R_b}{Numeric (Positive). The assumed R among the group in the
numerator of the ratio. Input value must be greater than 0.}

\item{p_a}{Numeric. The proportion of the population in group \code{a}. Must be
between 0 and 1.}

\item{N}{Numeric (Positive). The size of the infected pool. Only one of
\code{rho} or \code{N} should be specified.}

\item{alpha}{Numeric. The desired alpha level. Default: 0.05}

\item{alternative}{Character. Specifies the alternative hypothesis.
Must be: \code{two_sided} (Default), \code{less}, or \code{greater}}

\item{power}{Numeric. The desired power. Must be a value between 0 and 1.
Default: 0.8.}

\item{sensitivity}{Numeric. The sensitivity of the linkage criteria.
Must be between 0 and 1. Default: 1.}

\item{specificity}{Numeric. The specificity of the linkage criteria.
Must be between 0 and 1. Default: 1.}

\item{overdispersion}{Numeric (Positive). An overdispersion parameter, set
if the assumed distribution of the number of edges is negative binomial.
If \code{NULL} the assumed distribution is Poisson (equivalent to an
overdispersion parameter of infinity) Default: \code{NULL} Note that this is
equivalent to setting the overdispersion parameter to \code{Inf}.}
}
\value{
Squared error between the input sample size and estimated sample size
}
\description{
Function to calculate the error in estimated sample size for use in optimize function
}
