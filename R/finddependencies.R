#' @title Create a package list from packages used in a script or folder of scripts
#' @description This function find dependencies for a script or set of scripts 
#' and creates a package list for use in documenting requirements. The function 
#' will look for library(), require(), requireNamespace() and 
#' package::function() calls

