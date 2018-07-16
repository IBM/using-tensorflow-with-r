FLAGS <- flags(
  flag_integer("dense_units1", 128),
  flag_numeric("dropout1", 0.4),
  flag_integer("dense_units2", 128),
  flag_numeric("dropout2", 0.3),
  flag_integer("epochs", 30)
)

# train with flags

tfruns::training_run("mnist_mlp_FLAGS.R")
