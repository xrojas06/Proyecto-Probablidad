require(dplyr)
library(dplyr)
library(plotly)
library(readr)


#leer la base de datos csv y guardarla en la variable database
database <- read_delim("database.csv", ";", 
                       escape_double = FALSE, trim_ws = TRUE)
View(database)
