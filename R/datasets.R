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

#' @name ghg_ems
#' @title Worldwide emissions of greenhouse gases (ghg) by sector, country and year.
#' 
#' @description Emissions data from the World Resources Institute,
#' from their website:
#' \url{http://www.wri.org/resources/data-sets/cait-country-greenhouse-gas-emissions-data}.
#' @docType data
#' @format A seven column data frame.
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

#' @name miniaa
#' @title Dataset from National Provider Indentifier (NPI) dataset.
#' @description
#' Sample health care providers in the USA. Health plans were
#' required to obtain and use an NPI by May 23, 2008. See 
#' \url{http://www.nber.org/data/npi.html} for more information
#' 
#' @examples
#' \dontrun{ 
#' url <- "http://download.cms.gov/nppes/NPPES_Data_Dissemination_Aug_2015.zip"
#' # download a large dataset - don't run
#' download.file(url, "data/largefile.zip")
#' ## 550600K .......... ...... 100% 1.26M=6m53s
#' # unzip the compressed file, measure time
#' system.time( 
#'   unzip("data/largefile.zip", exdir = "data")
#' )
#' ##    user  system elapsed 
#' ##  34.380  22.428 193.145
#' 
#' bigfile <- "data/npidata_20050523-20150809.csv"
#' file.info(bigfile) # file info (not all shown)
#' ##       size: 5647444347
#' 
#' # bash scripts to generate the file:
#' cd data # change directory
#' split -b100m npidata_20050523-20150809.csv
#' system.time(df3 <- read.csv("data/xaa"))
#' system.time(df4 <- read_csv("data/xaa"))
#' split -l 10 aa mini # further split chunk 'aa' into 10 lines
#' cp miniaa ../data # copy the first into 'sample-data'
#' }
#' @docType data
NULL

#' @name wb_ineq
#' @title Global inequality by, country and year.
#' 
#' @description Estimates of the level of income inequality, using the Gini index,
#' from World Bank data. See
#' \url{http://data.worldbank.org/indicator/SI.POV.GINI?locations=AT}
#' for further information.
#' @docType data
#' @format A nine column data frame.
NULL