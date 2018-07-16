# ------------------------------------------------
# Run Model 
# ------------------------------------------------

# The usual way
# source("mnist_mlp.R")

# Using the tfruns
library(tfruns)
tfruns::training_run("mnist_mlp.R")
