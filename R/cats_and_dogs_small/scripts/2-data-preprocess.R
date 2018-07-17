# ----------------------
# STEPS
# ----------------------
# 1 Read the picture files.
# 2 Decode the JPEG content to RGB grids of pixels.
# 3 Convert these into floating-point tensors.
# 4 Rescale the pixel values (between 0 and 255) to the [0, 1] interval
#   (as you know, neural networks prefer to deal with small input values).

# Keras take care of these steps automatically. We will use the image_data_generator() function
# which can automatically turn the images files on disk into batches of preprocessed tensors.

base_dir <- "cats_and_dogs_small/data"
train_dir <- file.path(base_dir, "train")
validation_dir <- file.path(base_dir, "validation")


# Rescale the pixel value for the 2 splits
train_datagen <- image_data_generator(rescale = 1 / 255)
validation_datagen <- image_data_generator(rescale = 1 / 255)


train_generator <- flow_images_from_directory(
  train_dir,
  train_datagen,
  target_size = c(150, 150), # resizes all images to 150x150
  batch_size = 20,
  class_mode = "binary"
)
validation_generator <- flow_images_from_directory(
  validation_dir,
  validation_datagen,
  target_size = c(150, 150),
  batch_size = 20,
  class_mode = "binary" # because you used `loss = "binary_crossentropy"`, you need binary labels
)

batch <- generator_next(train_generator)
str(batch)
length(batch) # list of 2
length(batch[[1]]) # 1,350,000 (20*150*150*3) => 150 x 150 RGB images (shape(20, 150, 150, 3))
length(batch[[2]])
