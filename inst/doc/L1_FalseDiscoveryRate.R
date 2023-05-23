## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----truediscoveryrate--------------------------------------------------------

translink_tdr(sensitivity=0.99, specificity=0.95, rho=0.75, M=100, R=1)


## ----truediscoveryrate2-------------------------------------------------------

translink_tdr(sensitivity=0.99, specificity=0.995, rho=0.75, M=100, R=1)


## ----expected_pairs-----------------------------------------------------------

translink_expected_links_true(sensitivity=0.99, rho=0.75, M=100, R=1)
translink_expected_links_obs(sensitivity=0.99, specificity=0.95, 
                             rho=0.75, M=100, R=1)


