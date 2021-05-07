require(dplyr)
library(dplyr)
library(plotly)
library(ggplot2)


summary(database)

db <- aggregate(database[,3:9], list(database$`Regional indicator`),mean)
View(db)

regions = c(db$Group.1)
healthy = c(db$`Healthy life expectancy`)
ladder = c(db$`Ladder score`)
GDP = c(db$`Logged GDP per capita`)
social = c(db$`Social support`)
free = c(db$`Freedom to make life choices`)
gen = c(db$`Generosity`)
corruption = c(db$`Perceptions of corruption`)
colores = list(color = c('rgba(3,169,244,0.5)', 'rgba(244,67,54,0.5)',
                                'rgba(233,30,99,0.5)', 'rgba(156, 39, 176,0.5)',
                                'rgba(63, 81, 181, 0.5)', 'rgba(0, 188, 212, 0.5)',
                                'rgba(0, 150, 136, 0.5)', 'rgba(76, 175, 80, 0.5)',
                                'rgba(205, 220, 57, 0.5)', 'rgba(255, 152, 0, 0.5)'))


#healthy
datah = data.frame(regions,healthy)
grafico <- plot_ly(datah, x =regions, y =healthy, marker = colores)
grafico <- grafico %>% layout(title = "Healthy",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
grafico

#logged GDP
datag = data.frame(regions,GDP)
graficog = plot_ly(datag, x = regions, y = GDP, marker = colores)
graficog <- graficog %>% layout(title = "Logged GDP",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficog

#social support
datas = data.frame(regions,social)
graficos = plot_ly(datas, x = regions, y = social, marker = colores)
graficos <- graficos %>% layout(title = "Social Support",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficos

#freedom choices
dataf = data.frame(regions,free)
graficof = plot_ly(dataf, x = regions, y = free, marker = colores)
graficof <- graficof %>% layout(title = "Freedom Choices",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficof

#generosity
datage = data.frame(regions,gen)
graficoge = plot_ly(datage, x = regions, y=gen, marker = colores)
graficoge <- graficoge %>% layout(title = "Generosity",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficoge

#Corruption
dataco = data.frame(regions,corruption)
graficoco = plot_ly(dataco,x = regions, y=corruption, marker = colores)
graficoco <- graficoco %>% layout(title = "Corruption",
                                xaxis = list(title = ""),
                                yaxis = list(title = ""))
graficoco

#ladder score
datal = data.frame(regions,ladder)
graficol = plot_ly(datal, x = regions, y = ladder, marker = colores)
graficol <- graficol %>% layout(title = "Ladder Score",
                      xaxis = list(title = ""),
                      yaxis = list(title = ""))
graficol

#***********************************************************************************************************