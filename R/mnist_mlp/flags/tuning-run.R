setwd(here::here("mnist_mlp/flags/"))

runs <- tfruns::tuning_run("mnist_mlp_FLAGS_TUNING.R", flags = list(
  dense_units1 = c(256, 128),
  epochs = c(20, 30)
))  

ls_runs()


runs[order(runs$eval_acc, decreasing = TRUE), ]
ls_runs()
runs
