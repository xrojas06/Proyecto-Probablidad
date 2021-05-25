require(dplyr)
library(dplyr)
library(plotly)

#sacar el top 20 de paises mas felices
top15 <- database[1:3] %>% 
  slice(1:15)
#View(top15)

ld = c(top15$`Ladder score`)
country =  factor(top15$`Country name`, levels = unique(top15$`Country name`)[order(top15$`Ladder score`, decreasing = FALSE)])
#barras horizontales del top 10
barh <- plot_ly(top15,x = ld,y = country,type = 'bar', orientation = 'h',  color = I("dark green")) 
barh


#organizado por regiones top 15
x = (top15 %>%  group_by(`Regional indicator`) %>% summarise(mean = mean(ld), n = n()))
View(x)

#sacar el top 10 de paises menos felices
last15 <- database[1:3] %>% 
  slice_tail(n = 15)
View(last15)

ld = c(last15$`Ladder score`)
country =  factor(last15$`Country name`, levels = unique(last15$`Country name`)[order(last15$`Ladder score`, decreasing = FALSE)])

#barras horizontales del last 15
barh <- plot_ly(last15,x = ld,y = country,type = 'bar', orientation = 'h',  color = I("dark red")) 
barh

#organizado por regiones last 15
y = (last15 %>%  group_by(`Regional indicator`) %>% summarise(mean = mean(ld), n = n()))
View(y)


#barras de diferencia


