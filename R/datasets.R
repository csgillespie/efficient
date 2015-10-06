#' @name clock_speed
#' @title CPU clock speeds
#' @description The year and clock speed of CPUs. The clock speed is measured in million of instructions
#' per second. This data set was collected from forums, wikipedia and blog posts. 
#' @docType data
#' @format A two column data frame
#' @source https://csgillespie.wordpress.com/2011/01/25/cpu-and-gpu-trends-over-time/
NULL

#' @name die
#' @title MIPS per die
#' @description The year, clock speed and brief description of CPUs. 
#' The clock speed is measured in million of instructions
#' per second per die. This data set was taken from
#' http://en.wikipedia.org/wiki/List_of_Intel_microprocessors
#' Each CPU is the best in it's class
#' @docType data
#' @format A three column data frame
#' @source https://csgillespie.wordpress.com/2011/01/25/cpu-and-gpu-trends-over-time/
NULL


#' @name ex_mat
#' @title An example data frame and matrix
#' @aliases ex_df
#' @description Example data frame and matrix. Each object has 1000 rows and 100 columns. The data
#' is 10^5 uniform random numbers.
#' @docType data
NULL

#' @name transistors
#' @title Transistor counts
#' @description The number of transistors per CPU. The data was scrapped from 
#' https://en.wikipedia.org/wiki/Transistor_count (see example below)
#' @docType data
#' @examples 
#' \dontrun{
#' library("rvest")
#' library("magrittr")
#' 
#' trans_count = read_html("https://en.wikipedia.org/wiki/Transistor_count")
#' trans_table = trans_count %>% 
#'   html_nodes("table") %>% 
#'   .[[1]] %>% html_table
#' trans_table[,2] = gsub("\\[[0-9]*\\]", "", trans_table[,2])
#' trans_table[,2] = as.numeric(gsub(",|~", "", trans_table[,2]))
#' trans_table[,3] = as.numeric(gsub("\\[[0-9]*\\]", "", trans_table[,3]))
#' colnames(trans_table)[2:3] = c("Count", "Year")
#' }
NULL


