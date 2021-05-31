require(dplyr)
library(dplyr)
library(plotly)
library(ggplot2)

#agrupar los paises por region y hacer un promedio de cada variable
db <- aggregate(database[,3:9], list(database$`Regional indicator`),mean)
View(db)

#guardar cada variable en un vector
regions = c(db$Group.1)
healthy = c(db$`Healthy life expectancy`)
ladder = c(db$`Ladder score`)
GDP = c(db$`Logged GDP per capita`)
social = c(db$`Social support`)
free = c(db$`Freedom to make life choices`)
gen = c(db$`Generosity`)
corruption = c(db$`Perceptions of corruption`)

#colores que se usaran para las graficas
colores = list(color = c('rgba(3,169,244,0.5)', 'rgba(244,67,54,0.5)',
                                'rgba(233,30,99,0.5)', 'rgba(156, 39, 176,0.5)',
                                'rgba(63, 81, 181, 0.5)', 'rgba(0, 188, 212, 0.5)',
                                'rgba(0, 150, 136, 0.5)', 'rgba(76, 175, 80, 0.5)',
                                'rgba(205, 220, 57, 0.5)', 'rgba(255, 152, 0, 0.5)'))


#grafica de barras por region de la variable healthy life expectancy
datah = data.frame(regions,healthy)
grafico <- plot_ly(datah, x =regions, y =healthy, marker = colores)
grafico <- grafico %>% layout(title = "Healthy",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
grafico

#grafica de barras por region de la variable logged GDP per capita
datag = data.frame(regions,GDP)
graficog = plot_ly(datag, x = regions, y = GDP, marker = colores)
graficog <- graficog %>% layout(title = "Logged GDP",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficog

#grafica de barras por region de la variable social support
datas = data.frame(regions,social)
graficos = plot_ly(datas, x = regions, y = social, marker = colores)
graficos <- graficos %>% layout(title = "Social Support",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficos

#grafica de barras por region de la variable freedom to make life choices
dataf = data.frame(regions,free)
graficof = plot_ly(dataf, x = regions, y = free, marker = colores)
graficof <- graficof %>% layout(title = "Freedom Choices",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficof

#grafica de barras por region de la variable generosity
datage = data.frame(regions,gen)
graficoge = plot_ly(datage, x = regions, y=gen, marker = colores)
graficoge <- graficoge %>% layout(title = "Generosity",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficoge

#grafica de barras por region de la variable Perception of Corruption
dataco = data.frame(regions,corruption)
graficoco = plot_ly(dataco,x = regions, y=corruption, marker = colores)
graficoco <- graficoco %>% layout(title = "Corruption",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficoco

#grafica de barras por region de la variable ladder score
datal = data.frame(regions,ladder)
graficol = plot_ly(datal, x = regions, y = ladder, marker = colores)
graficol <- graficol %>% layout(title = "Ladder Score",
                      xaxis = list(title = ""),
                      yaxis = list(title = ""))
graficol

#***********************************************************************************************************