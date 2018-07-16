setwd(here::here("mnist_mlp"))

# The usual way
source("mnist_mlp.R")

# Using the tfruns
library(tfruns)
tfruns::training_run("mnist_mlp.R")

ls_runs()
latest_run()

View(ls_runs())
clean_runs(ls_runs(is.na(eval_loss))$run_dir)

clean_runs("runs/2018-07-09T22-13-38Z")
clean_runs(ls_runs()[grep("07-16", ls_runs()$run_dir),])

# Compare runs


tfruns::compare_runs()



view_run()

tensorboard() 
tensorboard(latest_run())                    # view the latest run



tfruns::training_run("mnist_mlp_FLAGS.R")

for (dense_units1 in c(256, 128))
  tfruns::training_run('mnist_mlp_FLAGS.R', 
               flags = list(
                 dense_units1 = dense_units1
                 )
               )







FLAGS <- flags(
  flag_numeric("learning_rate", 0.001,  "Learning Rate"),
  flag_integer("epochs",        20,  "Number of epochs to train for")
)

training_run("mnist_mlp_FLAGS_small.R", flags = "flags.yml")


# ---------------------------
FLAGS <- flags(
  flag_integer("dense_units1", dense_units1,  "Dense units in first layer"),
  flag_integer("epochs", epochs,  "Number of epochs to train for")
)
training_run("mnist_mlp_FLAGS.R", flags = "flags.yml", config = "alt")
training_run("mnist_mlp_FLAGS.R", config = "alt1")
