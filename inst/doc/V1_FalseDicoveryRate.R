## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----truediscoveryrate--------------------------------------------------------

truediscoveryrate(eta=0.99, chi=0.95, rho=0.75, M=100, R=1)


## ----truediscoveryrate2-------------------------------------------------------

truediscoveryrate(eta=0.99, chi=0.995, rho=0.75, M=100, R=1)


## ----expected_pairs-----------------------------------------------------------

true_pairs(eta=0.99, rho=0.75, M=100, R=1)
exp_links(eta=0.99, chi=0.95, rho=0.75, M=100, R=1)


