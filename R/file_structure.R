#' @title Create and save a folder structure
#' @description This function saves a customized list of folder names to your
#' global R files for reuse

create_folder_structure <- function(list, allow_spaces = F, allow_special_char = F) {

}

#' @title Add folders to a project
#' @description This function adds a list or saved list of folders to your
#' current project
#' @examples
#' folder_list <- c("scripts", "data", "docs", "reports", "output")
#' add_folders(folder_list, dir = "./")

add_folders <- function(list, path = getwd(), save_list = F){
  if(!dir.exists(path)) {
    dir.create(path, recursive = T)
  }

  .path <- file.path(normalizePath(path, winslash = "/"))
  .pathlist <- lapply(list, FUN = function(x) file.path(.path, x))
  lapply(.pathlist, FUN = function(x) dir.create(x))

  # How do I save a user's list somewhere persistent for reuse?
  # If provided a string, name list that string
  # If save_list = T, prompt user for save location?
}

remove_folders <- function(list, path = getwd(), keep_files = F) {
  # keep_files will move files to path and delete all folders if no list provided
  if(keep_files) {
    .filelist <- list.files(path, recursive = T, full.names = T)
    lapply(.filelist, file.copy, to = path)
  }

  if(missing(list)) {

  } else {
    # check if folders exist, warn for bad names, continue with good names
  }

  .path <- file.path(normalizePath(path, winslash = "/"))
  .pathlist <- lapply(list, FUN = function(x) file.path(.path, x))
  fs::dir_delete(.pathlist)
}

folder_list <- c("scripts", "data", "docs", "reports", "output")
path <- file.path(normalizePath("./test/add_folders", winslash = "/"))
path_list <- lapply(folder_list, FUN = function(x) file.path(path, x))
lapply(path_list, FUN = function(x) dir.create(x))

#' @title Get folder structure and save it for reuse
#' @description This function saves a customized list of folder names to your
#' global R files for reuse
