% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/obs_pairs_stsl.R
\name{obs_pairs_stsl}
\alias{obs_pairs_stsl}
\title{Expected number of observed pairs assuming single-transmission and single-linkage}
\usage{
obs_pairs_stsl(eta, chi, rho, M)
}
\arguments{
\item{eta}{scalar or vector giving the sensitivity of the linkage criteria}

\item{chi}{scalar or vector giving the specificity of the linkage criteria}

\item{rho}{scalar or vector giving the proportion of the final outbreak size that is sampled}

\item{M}{scalar or vector giving the number of cases sampled}
}
\value{
scalar or vector giving the expected number of linked pairs observed in the sample
}
\description{
\ifelse{html}{\href{https://lifecycle.r-lib.org/articles/stages.html#deprecated}{\figure{lifecycle-deprecated.svg}{options: alt='[Deprecated]'}}}{\strong{[Deprecated]}}
This function calculates the expected number of link pairs observed in a sample of size \code{M}.
The single-transmission and single-linkage method assumes the following:
\enumerate{
\item Each case \eqn{i} is linked by transmission to only one other case \eqn{j} in the population (\eqn{N}).
\item Each case \eqn{i} is linked by the linkage criteria to only one other case \eqn{j} in the sampled population (\eqn{M}).
}
}
\examples{
# perfect sensitivity and specificity
obs_pairs_stsl(eta=1, chi=1, rho=0.5, M=100)

obs_pairs_stsl(eta=0.99, chi=0.9, rho=1, M=50)

obs_pairs_stsl(eta=0.99, chi=0.9, rho=0.5, M=100)

}
\seealso{
Other obs_pairs: 
\code{\link{exp_links}()},
\code{\link{obs_pairs_mtml}()},
\code{\link{obs_pairs_mtsl}()}
}
\author{
John Giles, Shirlee Wohl, and Justin Lessler
}
\concept{obs_pairs}
