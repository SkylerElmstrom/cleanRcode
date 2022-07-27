#' @title Sort Package Lists, library() or require() Calls Alphabetically
#' @description This function will accept a character vector of package names,
#' sort them alphabetically, and print new code with the alphabetized list to
#' your console. Optionally, this script can generate alphabetized code for
#' `library()` or `require()` calls using `toLib = TRUE` or `toReq = TRUE`, 
#' respectively. Lastly, this function can print code that can be added to the 
#' beginning of scripts for checking if the list of packages are installed 
#' using `toCheck = TRUE`
#' @param pkg_list a character vector of unquoted package name strings
#' @param toLib T/F. When TRUE, converts package list into library(pkg) calls
#' @param toReq T/F. When TRUE, converts package list into require(pkg) calls
#' @param toCheck T/F. When TRUE, creates script package check code
#' @param clipr T/F. When TRUE and if clipr is installed, copies to clipboard
#' @examples 
#' # Example Package List
#' pkgs <- c("dplyr", "xfun", "jsonlite", "keyring", "leaflet", "sf", "knitr")
#' 
#' # Example Alphabetized Packages in c() Code Output
#' sort_packages(pkgs)
#'  
#' # Example Alphabetized Library() Code Output
#' sort_packages(pkgs, toLib = T)
#' 
#' # Example Alphabetized Require() Code Output
#' sort_packages(pkgs, toReq = T)
#' 
#' # Example Package Check Code Output
#' sort_packages(pkgs, toCheck = T)
#'  
#' @export

sort_packages = function(pkg_list, toLib = F, toReq = F, toCheck = F, clipr = T) {
  
  # Check for clipr package installed
  clipr_check <- all(requireNamespace("clipr", quietly = T, clipr = T), clipr == T)
  
  pkgs <- sort(pkg_list)
  pkgs_quote <- gsub("(\\w+)", '"\\1"', pkgs)
  
  # Create alphabetized package list in vector using c()
  if (toLib == F) {
    writeLines(paste0("c(", paste(pkgs_quote, collapse = ", "), ")"))
    
    # Copy output to clipboard if clipr installed
    if (clipr_check == T) {
      out <- capture.output(
        writeLines(paste0("c(", paste(pkgs_quote, collapse = ", "), ")"))
      )
      clipr::write_clip(out)
      message("Copied alphabetized packages to clipboard!\nUse clipr = F to disable.")
    }
  }

  # Create alphabetized list of Library() calls
  if (toLib == T) {
    writeLines(sprintf("library(%s)", pkgs), sep = "\n")
    
    # Copy output to clipboard if clipr installed
    if (clipr_check == T) {
      out <- capture.output(
        writeLines(sprintf("library(%s)", pkgs), sep = "\n")
      )
      clipr::write_clip(out)
      message("Copied alphabetized library() calls to clipboard!\nUse clipr = F to disable.")
    }
  }
  
  # Create alphabetized list of Require() calls
  if (toReq == T) {
    writeLines(sprintf("require(%s)", pkgs), sep = "\n")
    
    # Copy output to clipboard if clipr installed
    if (clipr_check==T) {
      out <- capture.output(
        writeLines(sprintf("require(%s)", pkgs), sep = "\n")
      )
      clipr::write_clip(out)
      message("Copied alphabetized require() calls to clipboard!\nUse clipr = F to disable.")
    }
  }
  
  if (toCheck == T) {
    # Slow base R method
    writeLines(paste0(
      "for(p in pkg_list){
        if(!require(p, character.only = TRUE)) install.packages(p)
      }"
    ))
    
    # Copy output to clipboard if clipr installed
    if (clipr_check==T) {
      out <- capture.output(
        writeLines(sprintf("Require(%s)", pkgs), sep = "\n")
      )
      clipr::write_clip(out)
      message("Copied package check code to clipboard!\nUse clipr = F to disable.")
    }
    
    # Faster Pacman or Pak package alternative?
  }
}

#' @title List Packages Used in a Script
#' @description This function attempts to find packages that are called in a
#' script using `Library()`, `Require()`,  or namespace i.e. `package::function`. Package names are added to a character vector.
#' @param file
#' @param library T/F. When FALSE, ignores `Library()`
#' @param require T/F. When FALSE, ignores `Require()`
#' @param namespace T/F. When FALSE, ignores namespace i.e. `package::function`
#' @param requireNamespace T/F. When FALSE, ignores `requireNamespace()`

# list_packages = function(file, library = T, require = T, namespace = T, requireNamespace = T) {
#   ls <- list()
# }
