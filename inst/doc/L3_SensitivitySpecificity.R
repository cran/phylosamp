## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)


## ----sens_spec_calc-----------------------------------------------------------

gendist_sensspec_cutoff(cutoff=2, 
                        mut_rate=1, 
                        mean_gens_pdf=c(0.02,0.08,0.15,0.75), 
                        max_link_gens=1)

gendist_sensspec_cutoff(cutoff=1:10, 
                        mut_rate=1, 
                        mean_gens_pdf=c(0.02,0.08,0.15,0.75), 
                        max_link_gens=1)


## ----sens_spec_calc_ebov------------------------------------------------------
R <- 1.5

data("genDistSim")
mgd <- as.numeric(genDistSim[genDistSim$R == R, -(1:2)])

gendist_sensspec_cutoff(cutoff=1:10, 
                        mut_rate=1, 
                        mean_gens_pdf=mgd, 
                        max_link_gens=1)

