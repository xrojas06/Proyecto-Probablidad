require(dplyr)
library(dplyr)
library(plotly)

datos <- read.csv(file = 'database.csv', header = TRUE, sep = ";")
View(datos)

db <- aggregate(database[,3:10], list(datos$'Regional indicator'),mean)