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

#' @name land_df
#' @title UK land use prices
#' @description Prices paid for land in the UK, open data.
#' See \url{https://data.gov.uk/dataset/land-registry-monthly-price-paid-data} for details
#' @docType data
#' @format A sixteen column data frame.
#' See \url{https://www.gov.uk/guidance/about-the-price-paid-data} for column descriptions
#' @examples
#' \dontrun{
#' url = paste0("http://prod.publicdata.landregistry.gov.uk",
#' ".s3-website-eu-west-1.amazonaws.com/pp-monthly-update.txt")
#' download.file(url = url, destfile = "pp-monthly-update.txt")
#' land_df = readr::read_csv("pp-monthly-update.txt", col_names = FALSE)
#' # Get column names
#' library(rvest)
#' land_html = read_html("https://www.gov.uk/guidance/about-the-price-paid-data")
#' land_colnames = html_nodes(land_html, "td:nth-child(1)", )
#' land_colnames = gsub(pattern = "<td>", replacement = "", land_colnames)
#' land_colnames = gsub(pattern = "</td>", replacement = "", land_colnames)
#' land_colnames = abbreviate(land_colnames, minlength = 10)
#' land_colnames = tolower(land_colnames)
#' names(land_df) = land_colnames
#' land_df = land_df[1:10000,]
#' devtools::use_data(land_df, overwrite = TRUE)
#' }
NULL

#' @name co2_ems
#' @title Worldwide emissions of CO2 by sector, country and year.
#' 
#' @description Emissions data from the World Resources Institute,
#' from their website:
#' \url{http://www.wri.org/resources/data-sets/cait-country-greenhouse-gas-emissions-data}.
#' @docType data
#' @format A seven column data frame.
#' See \url{https://www.gov.uk/guidance/about-the-price-paid-data} for column descriptions
#' @examples
#' \dontrun{
#' # After completing the form,
#' # and downloading the .zip file into the working directory:
#' unzip("CAIT_Country_GHG_Emissions_-_csv_0.zip")
#' f <- "CAIT_Country_GHG_Emissions_-_All_Data.xlsx"
#' ghg_ems <- readxl::read_excel(f, sheet = 4)
#' head(ghg_ems)
#' names(ghg_ems) = stringr::word(names(ghg_ems), sep = " |/")
#' devtools::use_data(ghg_ems, overwrite = TRUE)
#' }
NULL
