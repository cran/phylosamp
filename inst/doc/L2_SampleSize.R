## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----samplesize---------------------------------------------------------------

translink_samplesize(sensitivity=0.99, specificity=0.995, 
                     N=100, R=1, tdr=0.75)


## ----samplesize_explinks------------------------------------------------------

translink_samplesize(sensitivity=0.99, specificity=0.995, 
                     N=100, R=1, tdr=0.75, min_pairs=30)


## ----samplesize_fail, error=TRUE----------------------------------------------

translink_samplesize(sensitivity=0.99, specificity=0.995, 
                     N=100, R=1, tdr=0.95)


## ----truediscoveryrate_explain------------------------------------------------

translink_tdr(sensitivity=0.99, specificity=0.995, rho=1, M=100, R=1)


