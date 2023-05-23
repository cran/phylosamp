## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----calc_prob_detect---------------------------------------------------------

c1_c2 <- vartrack_cod_ratio(phi_v1=0.975, phi_v2=0.95, gamma_v1=0.8, gamma_v2=0.6)
vartrack_prob_detect(p_v1=0.02, n=100, omega=0.8, c_ratio=c1_c2, sampling_freq="xsect")


## ----calc_prob_prev-----------------------------------------------------------

c1_c2 <- vartrack_cod_ratio(psi_v1=0.25, psi_v2=0.4, tau_a=0.05, tau_s=0.3)
vartrack_prob_prev(p_v1=0.1, n=200, omega=0.8, precision=0.25, 
                   c_ratio=c1_c2, sampling_freq="xsect")


