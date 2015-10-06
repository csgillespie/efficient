##For fast computers
#d_m = matrix(1:1000000, ncol=1000)
##Slower computers


#' Create 
#' @export
create_matrix = function(n = 4) {
  if(n < 3) stop("n must be greater than 2.")
  d_m = matrix(1:10^n, ncol=100)
  colnames(d_m) = paste0("c", 1:ncol(d_m))
  d_m
}

#' @rdname create_matrix
#' @export
create_data_frame = function(n = 4) {
  d = create_matrix(n)
  d = as.data.frame(d)
  colnames(d) = paste0("c", 1:ncol(d))
  d
}