globalVariables("add_c")
#' Rcpp test function
#' 
#' A simple function to test whether Rcpp is installed and working.
#' @return Returns \code{TRUE} if everything is OK.
#' @importFrom Rcpp cppFunction
#' @export
test_rcpp = function() {
  cppFunction('
  int add_c(int x, int y){
    return x + y;
  }
')
  if(add_c(1, 1) == 2) {
    message("Everything seems fine")
    return(TRUE)
  }
  return(FALSE)
}