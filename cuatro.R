require(dplyr)
library(dplyr)
library(plotly)
library(corrplot)

#-----------------------------------------------------------
#vectores los datos con las variables de la base de datos original 
Rregions = c(database$`Regional indicator`)
Rcountry = c(database$`Country name`)
Rhealthy = c(database$`Healthy life expectancy`)
Rladder = c(database$`Ladder score`)
RGDP = c(database$`Logged GDP per capita`)
Rsocial = c(database$`Social support`)
Rfree = c(database$`Freedom to make life choices`)
Rgen = c(database$`Generosity`)
Rcorruption = c(database$`Perceptions of corruption`)
#-----------------------------------------------------------

#variable dependiente ladder score con la que se haran los siguientes modelos lineales
y = Rladder

#modelo lineal LOGGED GDP per capita y diagrama
x = RGDP
mod = lm(y~x)
summary(mod)
fv <- mod %>% fitted.values()
f <- plot_ly(database, x = ~RGDP) %>% 
  add_trace(y = ~Rladder,
    mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)


#modelo lineal social support y diagrama
x1 = Rsocial
mod1 = lm(y~x1)
summary(mod1)
fv1 <- mod1 %>% fitted.values()
f2 <- plot_ly(database, x = ~x1) %>% 
  add_trace(y = ~y,
            mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv1, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)


#modelo lineal de healthy life expectancy y diagrama
x2 = Rhealthy
mod2 = lm(y~x2)
summary(mod2)
fv2 <- mod2 %>% fitted.values()
f3 <- plot_ly(database, x = ~x2) %>% 
  add_trace(y = ~y,
            mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv2, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)

#modelo lineal de freedom to make life choices y diagrama
x3 = Rfree
mod3 = lm(y~x3)
summary(mod3)
fv3 <- mod3 %>% fitted.values()
f4 <- plot_ly(database, x = ~x3) %>% 
  add_trace(y = ~y,
            mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv3, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)

#modelo lineal de generosity y diagrama
x4 = Rgen
mod4 = lm(y~x4)
summary(mod4)
fv4 <- mod4 %>% fitted.values()
f5 <- plot_ly(database, x = ~x4) %>% 
  add_trace(y = ~y,
            mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv4, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)

#modelo lineal de perception of corruption y diagrama
x5 = Rcorruption
mod5 = lm(y~x5)
summary(mod5)
fv5 <- mod5 %>% fitted.values()
f6 <- plot_ly(database, x = ~x5) %>% 
  add_trace(y = ~y,
            mode = 'markers', marker = list(color='red')) %>%
  add_trace(y = fv5, mode = 'lines',
            line=list(color='rgb(0,0,255)')) %>%
  layout(showlegend = FALSE)


#matriz de correlacion pearson
head(database)
matrixcor<-cor(database[3:9], use = "everything")
head(round(matrixcor,2))
col <- colorRampPalette(c("#BB4444", "#EE9988", "#FFFFFF", "#77AADD", "#4477AA"))

corrplot(matrixcor, method = "shade", shade.col = NA, tl.col = "black",
         addCoef.col = "black")

