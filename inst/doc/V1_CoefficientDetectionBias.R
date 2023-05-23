## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)

## ----calc_cod_ratio-----------------------------------------------------------

vartrack_cod_ratio(phi_v1=0.975, phi_v2=0.95, gamma_v1=0.8, gamma_v2=0.6)


## ----calc_observed_freq-------------------------------------------------------

varfreq_obs_freq(p_v1=0.2, c_ratio=1.368)


## ----calc_expected_mbias------------------------------------------------------

varfreq_expected_mbias(p_v1=0.2, c_ratio=1.367)


