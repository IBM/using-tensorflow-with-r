setwd(here::here("mnist_mlp"))

# The usual way
source("mnist_mlp.R")

# Using the tfruns
library(tfruns)
tfruns::training_run("mnist_mlp.R")

ls_runs()
latest_run()

View(ls_runs())


# Clean runs
clean_runs(ls_runs(is.na(eval_loss))$run_dir)
clean_runs("runs/2018-07-09T22-13-38Z")
clean_runs(ls_runs()[grep("07-16", ls_runs()$run_dir),])

# Compare runs
tfruns::compare_runs()



# view_run()
# 
tensorboard() 
tensorboard(latest_run())                    # view the latest run



