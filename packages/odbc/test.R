pattern_found <- function(pattern, text) {
  as.logical(
    lapply(pattern, function(single_pattern,search_in){
      any(grepl(single_pattern,search_in))
    }, search_in=text)
  )
}


install.packages('odbc', repos="https://cran.rstudio.com")
library(odbc)


expected_drivers <- c(
  "libamazonredshiftodbc_sb64\\.so"
  , "libhiveodbc_sb64\\.so"
  , "libimpalaodbc_sb64\\.so"
  , "liboracleodbc_sb64\\.so"
  , "libpostgresqlodbc_sb64\\.so"
  , "libsalesforceodbc_sb64\\.so"
  , "libsqlserverodbc_sb64\\.so"
  , "tdataodbc_sb64\\.so"
)

expected_driver_names <- c(
  "AmazonRedshift"
  , "Hive"
  , "Impala"
  , "Oracle"
  , "PostgreSQL"
  , "Salesforce"
  , "SQLServer"
  , "Teradata"
)

available_drivers <- odbc::odbcListDrivers()
available_dsns <- odbc::odbcListDataSources()

print(available_drivers)
print(available_dsns)

stopifnot(
  all(expected_driver_names %in% available_drivers$name)
  , all(pattern_found(expected_drivers, available_drivers$value))
)

