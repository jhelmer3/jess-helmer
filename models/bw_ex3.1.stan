
data {
  int<lower=0> N_total;
  int<lower=0> N_claimed_prize;
  real<lower=0, upper=1> p_win;
}

parameters {
  real <lower=0, upper=1> p_liar;
}

model {
  N_claimed_prize ~ binomial(N_total, p_win + (1 - p_win) * p_liar);
}

generated quantities {
  int<lower=0, upper=N_total> N_truthers = binomial_rng(N_total, (1 - p_liar));
  real<lower=0, upper=1> p_truthers = N_truthers / N_total;
}

