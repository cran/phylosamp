## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----calc_samplesize_detect---------------------------------------------------

vartrack_samplesize_detect(p_v1=0.02, prob=0.95, omega=0.8, 
                           c_ratio=1.368, sampling_freq="xsect")


## ----calc_samplesize_prev-----------------------------------------------------

c1_c2 <- vartrack_cod_ratio(psi_v1=0.25, psi_v2=0.4, tau_a=0.05, tau_s=0.3)
vartrack_samplesize_prev(p_v1=0.1,prob=0.95,precision=0.25, 
                         omega=0.8, c_ratio=c1_c2, sampling_freq="xsect")


