require(dplyr)
library(dplyr)
library(plotly)

#sacar el top 15 de paises mas felices, es decir mayor ladder score
top15 <- database[1:3] %>% 
  slice(1:15)
#View(top15)

#vector de la variable ladder score en el top 15 y un factor con los paises ordenados de mayor a menor
ld = c(top15$`Ladder score`)
country =  factor(top15$`Country name`, levels = unique(top15$`Country name`)[order(top15$`Ladder score`, decreasing = FALSE)])

#barras horizontales del top 15
barh <- plot_ly(top15,x = ld,y = country,type = 'bar', orientation = 'h',  color = I("dark green")) 
barh


#organizado por regiones el top 15 con la cantidad de cuantos paises por region hay en este top15
x = (top15 %>%  group_by(`Regional indicator`) %>% summarise(mean = mean(ld), n = n()))
View(x)

#sacar el top 15 de paises menos felices, es decir menos ladder score
last15 <- database[1:3] %>% 
  slice_tail(n = 15)
#View(last15)

#vector de la variable ladder score en el last15 y factor con los paises de mayor a menor
ld = c(last15$`Ladder score`)
country =  factor(last15$`Country name`, levels = unique(last15$`Country name`)[order(last15$`Ladder score`, decreasing = FALSE)])

#barras horizontales del last 15
barh <- plot_ly(last15,x = ld,y = country,type = 'bar', orientation = 'h',  color = I("dark red")) 
barh

#organizado por regiones last 15, con la cantidad de cuantos paises por region hay en este last15
y = (last15 %>%  group_by(`Regional indicator`) %>% summarise(mean = mean(ld), n = n()))
View(y)



