##' Calculate cumulative observed variant prevalence at time t given logistic growth
##'
##' This function calculates the cumulative observed variant prevalence after t time steps (e.g., days)
##' given a logistic growth rate and initial variant prevalence.
##'
##' @param t time step number (e.g., days) at which to calculate prevalence
##' @param p0_v1 initial variant prevalence (# introductions / infected population size)
##' @param r_v1 logistic growth rate
##' @param c_ratio coefficient of detection ratio, calculated as the ratio of the coefficients of variant 1 to variant 2. Default = 1 (no bias)
##' @return scalar giving the cdf of variant prevalence at time t
##'
##' @author Shirlee Wohl, Elizabeth C. Lee, Bethany L. DiPrete, and Justin Lessler
##'
##' @examples
##' varfreq_cdf_logistic(t = 30, p0_v1 = 1/10000, r_v1 = 0.1, c_ratio = 1)
##'
##' @family logistic growth functions
##' @family variant frequency functions
##'
##' @export


varfreq_cdf_logistic <- function(t, p0_v1, r_v1, c_ratio = 1) {
  if (!is.numeric(t)) stop("Time step must be numeric.")
  if (!all(is.numeric(p0_v1), p0_v1 > 0 & p0_v1 < 1)) stop("Initial variant prevalence must be numeric and between 0 and 1.")
  if (!all(is.numeric(r_v1), r_v1 != 0)) stop("Growth rate must be numeric and non-zero.")
  if (!all(is.numeric(c_ratio), c_ratio != 0)) stop("Coefficient of detection ratio must be numeric and non-zero")

  a <- (1 / p0_v1) - 1
  b <- a * (1 / c_ratio)
  G <- (1 / r_v1) * log(b + exp(r_v1 * t))

  return(G)
}
