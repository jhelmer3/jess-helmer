
library(targets)
library(tarchetypes)
library(stantargets)

tar_option_set(
  packages = c("tidyverse", "cmdstanr"),
  controller = crew::crew_controller_local(workers = 2),
  format = "qs",
  error = "trim"
)

tar_source()

list(
  tar_stan_mcmc(fit, "models/bw_ex3.1.stan", 
                data = list(N_total = 171,
                            N_claimed_prize = 111,
                            p_win = 0.5),
                parallel_chains = 4),
  tar_quarto(bayesian_workflow_exercises, "posts/bayesian_workflow_exercises.qmd", quiet = F)
)
