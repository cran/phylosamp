## ----setup, message=FALSE-----------------------------------------------------
library(phylosamp)
library(ggplot2)
library(reshape2)
library(RColorBrewer)
library(cowplot)

## ----gen_dist_compare_ebov, fig.width=6, fig.height=4, warning=FALSE----------

# ebola-like pathogen
R <- 1.5
mut_rate <- 1

# use simulated generation distributions
data("gen_dist_sim")
mean_gens_pdf <- as.numeric(gen_dist_sim[gen_dist_sim$R == R, -(1:2)])

# get theoretical genetic distance dist based on mutation rate and generation parameters
dists <- as.data.frame(gen_dists(mut_rate = mut_rate, 
                                 mean_gens_pdf = mean_gens_pdf, 
                                 max_link_gens = 1))

# reshape dataframe for plotting
dists <- reshape2::melt(dists, 
                        id.vars = "dist", 
                        variable.name = "status", 
                        value.name = "prob")

# get sensitivity and specificity using the same paramters
roc_calc <- sens_spec_roc(cutoff = 1:(max(dists$dist)-1), 
                          mut_rate = mut_rate,
                          mean_gens_pdf = mean_gens_pdf)
  
# get the optimal value for the ROC plot
roc_optim <- get_optim_roc(roc_calc)
threshold <- roc_optim$cutoff
optim_point <- c(roc_optim$specificity, roc_optim$sensitivity)

# plot the distributions of genetic distance
pal <- RColorBrewer::brewer.pal(5, "PuOr")
  
p1 <- ggplot(dists, aes(x=dist, y=prob, fill=status)) +
    geom_bar(alpha=0.5, stat="identity", position="identity") +
    scale_fill_manual(name="", values=c(pal[5], pal[2])) +
    scale_x_continuous(limits = c(-1,35), expand = c(0,0)) +
    scale_y_continuous(limits = c(0,0.4), expand = c(0,0)) +
    xlab('Genetic distance') + ylab('Density') +
    theme_classic() + theme(legend.position='none') +
    geom_vline(xintercept=threshold, linetype=2, size=0.5, color = "black")
  
# add ROC curve on top
r1 <- ggplot(data=roc_calc, aes(x=specificity, y=sensitivity)) +
    geom_line(size=1.5) + xlim(0,1) + ylim(0,1) +
    geom_point(x=optim_point[1], y=optim_point[2],
               size = 3, stroke=1, shape=21, fill = "chartreuse") +
    geom_abline(slope=1, intercept = 0, linetype=2, alpha=0.5) +
    xlab("1-specificity") +
    theme_bw()
  
cowplot::ggdraw(p1) + cowplot::draw_plot(r1, hjust=-0.16, vjust=-0.16, scale=0.6)


## ----optim_value--------------------------------------------------------------
threshold

## ----sens_spec_values---------------------------------------------------------
roc_optim$sensitivity ## sensitivity
1 - roc_optim$specificity ## specificity

## ----gen_dist_compare_mev-----------------------------------------------------

# faster-spreading pathogen
R <- 3
mut_rate <- 0.2

mean_gens_pdf <- gen_dist_sim[gen_dist_sim["R"]==R][3:dim(gen_dist_sim)[2]]


## ----gen_dist_mev_plot, fig.width=6, fig.height=4, echo=FALSE, warning=FALSE----

# get theoretical genetic distance dist based on mutation rate and generation parameters
dists <- as.data.frame(gen_dists(mut_rate = mut_rate, mean_gens_pdf = mean_gens_pdf, max_link_gens = 1))
# reshape dataframe for plotting
dists <- reshape2::melt(dists, id.vars = "dist", variable.name = "status", value.name = "prob")

# get sensitivity and specificity using the same paramters
roc_calc <- sens_spec_roc(cutoff = 1:(max(dists$dist)-1), mut_rate = mut_rate,
                          mean_gens_pdf = mean_gens_pdf)
  
# get the optimal value for the ROC plot using closest-to-corner metric
roc_optim <- roc_calc
roc_optim$dist <- sqrt((1-roc_optim$sensitivity)^2 + (roc_optim$specificity)^2)
roc_optim <- roc_optim[2:(dim(roc_optim)[1]),] # remove first row with zero threshold
optim_value <- min(roc_optim$dist)
threshold <- roc_optim[roc_optim$dist==optim_value,]$cutoff
optim_point <- c(roc_optim[roc_optim$cutoff==threshold,]$specificity,
                 roc_optim[roc_optim$cutoff==threshold,]$sensitivity)
  
# plot the distributions of genetic distance
pal <- RColorBrewer::brewer.pal(5, "PuOr")
  
p1 <- ggplot(dists, aes(x=dist, y=prob, fill=status)) +
    geom_bar(alpha=0.5, stat="identity", position="identity") +
    scale_fill_manual(name="", values=c(pal[5], pal[2])) +
    scale_x_continuous(limits = c(-1,35), expand = c(0,0)) +
    scale_y_continuous(limits = c(0,0.4), expand = c(0,0)) +
    xlab('Genetic distance') + ylab('Density') +
    theme_classic() + theme(legend.position='none') +
    geom_vline(xintercept=threshold, linetype=2, size=0.5, color = "black")
  
# add ROC curve on top
r1 <- ggplot(data=roc_calc, aes(x=specificity, y=sensitivity)) +
    geom_line(size=1.5) + xlim(0,1) + ylim(0,1) +
    geom_point(x=optim_point[1], y=optim_point[2],
               size = 3, stroke=1, shape=21, fill = "chartreuse") +
    geom_abline(slope=1, intercept = 0, linetype=2, alpha=0.5) +
    xlab("1-specificity") +
    theme_bw()
  
cowplot::ggdraw(p1) + cowplot::draw_plot(r1, hjust=-0.16, vjust=-0.16, scale=0.6)


## ----optim_value_slow---------------------------------------------------------
threshold

## ----sens_spec_values_slow----------------------------------------------------
roc_optim[roc_optim$cutoff==threshold,]$sensitivity ## sensitivity
1 - roc_optim[roc_optim$cutoff==threshold,]$specificity ## specificity

## ----fdr_final----------------------------------------------------------------
truediscoveryrate(eta=0.9963402, chi=0.9801562, rho=0.20, M=200, R=1) # ebola-like pathogen
truediscoveryrate(eta=0.8187308, chi=0.8539157, rho=0.20, M=200, R=1) # slower-mutating pathogen

