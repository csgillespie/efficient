.onAttach = function(...) {
  if (!interactive()) return()
  
  msg = 'To install the package with vignettes, please use: 
        devtools::install_github("csgillespie/efficient", build_vignettes = TRUE)' # nocov
  packageStartupMessage(paste(strwrap(msg), collapse = "\n")) # nocov
}