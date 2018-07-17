# ------------------------------------------------------------------------------------
# For this example you can skip this script and 
# go straight to the 1-build-the-network.R
# You can download the original dataset from www.kaggle.com/c/dogs-vs-cats/data
# ------------------------------------------------------------------------------------
original_dataset_dir <- "~/Downloads/all"

base_dir <- "cats_and_dogs_small/data"

# train directory
train_dir <- file.path(base_dir, "train")
dir.create(train_dir)
train_cats_dir <- file.path(train_dir, "cats")
dir.create(train_cats_dir)
train_dogs_dir <- file.path(train_dir, "dogs")
dir.create(train_dogs_dir)

# validation directory
validation_dir <- file.path(base_dir, "validation")
dir.create(validation_dir)
validation_cats_dir <- file.path(validation_dir, "cats")
dir.create(validation_cats_dir)
validation_dogs_dir <- file.path(validation_dir, "dogs")
dir.create(validation_dogs_dir)

# test directory
test_dir <- file.path(base_dir, "test")
dir.create(test_dir)
test_cats_dir <- file.path(test_dir, "cats")
dir.create(test_cats_dir)
test_dogs_dir <- file.path(test_dir, "dogs")
dir.create(test_dogs_dir)



# Copy files 
# for this example, we'll only use a dataset containing three subsets: 
# - a training set with 1,000 samples of each class 
# - a validation set with 500 samples of each class
# and a test set with 500 samples of each class

fnames <- paste0("cat.", 1:1000, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(train_cats_dir))
fnames <- paste0("cat.", 1001:1500, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(validation_cats_dir))
fnames <- paste0("cat.", 1501:2000, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(test_cats_dir))
fnames <- paste0("dog.", 1:1000, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(train_dogs_dir))
fnames <- paste0("dog.", 1001:1500, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(validation_dogs_dir))
fnames <- paste0("dog.", 1501:2000, ".jpg")
file.copy(file.path(original_dataset_dir, "train", fnames),
          file.path(test_dogs_dir))


# As a sanity check, let’s count how many pictures are in each training split 
# (train/validation/test):

cat("total training cat images:", length(list.files(train_cats_dir)), "\n")
cat("total training dog images:", length(list.files(train_dogs_dir)), "\n")
cat("total validation cat images:", length(list.files(validation_cats_dir)), "\n")
cat("total validation dog images:", length(list.files(validation_dogs_dir)), "\n")
cat("total test cat images:", length(list.files(test_cats_dir)), "\n")
cat("total test dog images:", length(list.files(test_dogs_dir)), "\n")



