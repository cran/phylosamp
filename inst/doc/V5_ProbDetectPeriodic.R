## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----calc_samplesize_detect_cont----------------------------------------------

c1_c2 <- vartrack_cod_ratio(phi_v1=0.975, phi_v2=0.95, gamma_v1=0.8, gamma_v2=0.6)
vartrack_prob_detect(n=20, p_v1=0.01, omega=0.8, p0_v1=3/10000, 
                          r_v1=0.1, c_ratio=c1_c2, sampling_freq="cont")


## ----calc_samplesize_detect_cont2---------------------------------------------

c1_c2 <- vartrack_cod_ratio(phi_v1=0.975, phi_v2=0.95, gamma_v1=0.8, gamma_v2=0.6)
vartrack_prob_detect(n=20, t=30, omega=0.8, p0_v1=3/10000, r_v1=0.1,
                     c_ratio=c1_c2, sampling_freq="cont")


