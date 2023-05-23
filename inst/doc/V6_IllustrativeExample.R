## ----cod_calculation----------------------------------------------------------

library(phylosamp)

# Least conservative scenario assuming higher testing rate:
vartrack_cod_ratio(psi_v1=0.25, psi_v2=0.3, tau_a=0.1, tau_s=0.5)

# Least conservative scenario assuming lower testing rate:
vartrack_cod_ratio(psi_v1=0.25, psi_v2=0.3, tau_a=0.05, tau_s=0.4)

# Most conservative scenario assuming higher testing rate:
vartrack_cod_ratio(psi_v1=0.45, psi_v2=0.3, phi_v1=0.9, phi_v2=0.95,
                   tau_a=0.1, tau_s=0.5)

# Most conservative scenario assuming lower testing rate:
vartrack_cod_ratio(psi_v1=0.45, psi_v2=0.3, phi_v1=0.9, phi_v2=0.95,
                   tau_a=0.05, tau_s=0.4)


## ----samplesize_calculations--------------------------------------------------

library(phylosamp)

# Least conservative scenario with low initial prevalence:
vartrack_samplesize_detect(prob=0.75, p_v1=0.01, p0_v1=1/10000, r_v1=0.1,
                           omega=0.8, c_ratio=1.059, sampling_freq="cont")

# Least conservative scenario with high initial prevalence:
vartrack_samplesize_detect(prob=0.75, p_v1=0.01, p0_v1=1/1000, r_v1=0.1,
                           omega=0.8, c_ratio=1.059, sampling_freq="cont")

# Most conservative scenario with low initial prevalence:
vartrack_samplesize_detect(prob=0.95, p_v1=0.01, p0_v1=1/10000, r_v1=0.2,
                           omega=0.8, c_ratio=0.779, sampling_freq="cont")

# Most conservative scenario with high initial prevalence:
vartrack_samplesize_detect(prob=0.95, p_v1=0.01, p0_v1=1/1000, r_v1=0.2,
                           omega=0.8, c_ratio=0.779, sampling_freq="cont")


## ----probability_calculation--------------------------------------------------

library(phylosamp)

# Most conservative scenario with low initial prevalence
vartrack_prob_detect(n=28, p_v1=0.01, p0_v1=1/10000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")

# Most conservative scenario with high initial prevalence
vartrack_prob_detect(n=28, p_v1=0.01, p0_v1=1/1000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")


## ----probability_calculation_2------------------------------------------------

library(phylosamp)

## DETECTION BEFORE REACHING 2% PREVALENCE

# Most conservative scenario with low initial prevalence
vartrack_prob_detect(n=28, p_v1=0.02, p0_v1=1/10000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")

# Most conservative scenario with high initial prevalence
vartrack_prob_detect(n=28, p_v1=0.02, p0_v1=1/1000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")

## DETECTION BEFORE REACHING 5% PREVALENCE

# Most conservative scenario with low initial prevalence
vartrack_prob_detect(n=28, p_v1=0.05, p0_v1=1/10000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")

# Most conservative scenario with high initial prevalence
vartrack_prob_detect(n=28, p_v1=0.05, p0_v1=1/1000, r_v1=0.2,
                     omega=0.8, c_ratio=0.779, sampling_freq="cont")


