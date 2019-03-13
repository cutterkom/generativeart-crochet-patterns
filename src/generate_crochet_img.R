#' Generate multiple generative images
#'
#' This is the main function of the package generativeimgR. It calls all the other function neccessary to produce multiple generative images at once.
#' @param nr_of_img the number of images that should be created
#' @return as many png files as you net in "nr_of_img"
#' @seealso \code{\link{generate_seeds}} generate the seeds for the randomness
#' @seealso \code{\link{generate_filename}} generate the file names
#' @seealso \code{\link{check_logfile_existence}} create a log file, if there is none
#' @seealso \code{\link{generate_logfile_entry}} generate the specific entry for the log file
#' @seealso \code{\link{create_crochet}} generate and plot the data, save a png file
#' @export
#' @examples
#' generate_img(nr_of_img = 3)
#' @importFrom purrr map

generate_crochet_img <- function(nr_of_img) {
  
  # setting the seed(0104)
  seeds <- generate_seeds(nr_of_img)
  message(paste0("seed: ", seeds))
  
  # I use walk() instead map(), in order to return just the image file
  purrr::walk(seeds, function(seed){
    
    # create an image file name
    file_name <- generate_filename(seed)
    message(paste0("file_name: ", file_name))
    
    # doing the logging
    logfile <- check_logfile_existence_crochet()
    message(logfile) # probably not neccessary in the input, ugly formatted, therefore useless
    logfile <- generate_logfile_entry_crochet(logfile, seed, file_name)
    
    # calculate the actual plotting
    create_crochet(file_name)
    
  })
}



