source("cats_and_dogs_small/scripts/1-build-the-network.R")
source("cats_and_dogs_small/scripts/2-data-preprocess.R")



### BE AWARE THAT THIS MODEL TAKES A LONG TIME TO RUN
# Fitting the model using a batch generator
history <- model %>% 
  fit_generator(
    generator = train_generator,
    steps_per_epoch = 100,
    epochs = 30,
    validation_data = validation_generator,
    validation_steps = 50
)
  
#  It’s good practice to always save your models after training.
model %>% save_model_hdf5("cats_and_dogs_small_1.h5")

