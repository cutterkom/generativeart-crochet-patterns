# In order to create a nice setup for automating the workflow I propose to use the library generativeart
# github.com/cutterkom/generativeart
# There is a detailed documentation, but you can just run the script, too: Enter


# install and/or load generativeart
is_installed <- function(package){
  is.element(package, installed.packages()[,1])
} 

if (!is_installed("generativeart")){
  devtools::install_github("cutterkom/generativeart")
}

library(generativeart)

# set the paths
IMG_DIR <- "img/"
IMG_SUBDIR <- "everything/"
IMG_SUBDIR2 <- "handpicked/"
IMG_PATH <- paste0(IMG_DIR, IMG_SUBDIR)

LOGFILE_DIR <- "logfile/"
LOGFILE <- "logfile.csv"
LOGFILE_PATH <- paste0(LOGFILE_DIR, LOGFILE)

# create the directory structure
generativeart::setup_directories(IMG_DIR, IMG_SUBDIR, IMG_SUBDIR2, LOGFILE_DIR)

# Here starts aschinchon's code for creating the crochet structures
source("src/crochet.R")
source("src/generate_crochet_img.R")
source("src/generate_logfile_entry_crochet.R")
source("src/check_for_logfile_existence_crochet.R")

# call the main function to create five images
generate_crochet_img(nr_of_img = 5)
