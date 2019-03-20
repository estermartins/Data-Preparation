################
# Data Preparation
# Ester Martins
# 19/03/2019
################

install.packages("titanic")
install.packages("dplyr")
install.packages("ggplot2")

library(titanic)
library(dplyr)
library(ggplot2)

####################
data("titanic_train")
titanic_train = as_tibble(titanic_train)
titanic_train
help(titanic_train)

###################
# select, filter, mutate, summarise, group_by

# Desafio 1
# Usando dplyr, plote um gráfico mostrando a proporção de 
# passageiros para cada classe a bordo utilizando os nomes: 
# 1 classe, 2 classe, 3 classe
# O gráfico deve conter, além da informação visual, o número do pecentual 
# de cada classe acompanhado do símbolo %.

# plot(x=titanic_train$Pclass)

titanic_train %>% 
  mutate(classe = case_when(
      Pclass == 1 ~ "1 classe",
      Pclass == 2 ~ "2 classe",
      Pclass == 3 ~ "3 classe"
  )) %>% 
  group_by(classe) %>% 
  summarise(n = n()) %>% 
  mutate(total = sum(n)) %>% 
  mutate(perc = (n/total)*100) %>% 
  geom_col(fill="purple")
  ggplot(aes(x = classe, y = perc)) + geom_col()
  geom_text(aes(label = paste0(round(perc, 2), "%")),
            vjust = - 0.5)
  ylim(0, 60) +
  labs(x = "Classe", y = "Percentual", title = "Proporções de passageiros")  

  
#######################
# Desafio 2
# Exiba em um gráfico a média de preço de ticket pago para cada classe
# dentro do navio com até duas casas decimais. 
  
titanic_train %>%  
    mutate(classe = case_when(
      Pclass == 1 ~ "1 classe",
      Pclass == 2 ~ "2 classe",
      Pclass == 3 ~ "3 classe"
    )) %>% 
    group_by(classe) %>% 
  summarise(medticket = mean(Fare)) %>% 
  ggplot(aes(x = classe, y = medticket)) + 
  geom_point(size = 3) +
  geom_text(aes(label = paste0(round(medticket, 2))),
            vjust = - 0.7)
  ylim(10.90) +
    labs(x = "Classe", y = "Preço", title = "Média de preço do Ticket") + 
    theme_bw() + 
    ggsave("point_media.png", height = 4, width = 6, dpi = 100)
  
#################
# Desafio 3
# Exiba num gráfico a média da idade dos passageiros de cada classe 
# por sexo.
  
  titanic_train %>%  
    mutate(classe = case_when(
      Pclass == 1 ~ "1 classe",
      Pclass == 2 ~ "2 classe",
      Pclass == 3 ~ "3 classe"
    )) %>%
    group_by(classe, sex) %>% 
    summarise(medidade = mean(Age, na.rm = T)) %>% 
    ggplot(aes(x = classe, y = medidade, color = sex)) + 
    geom_point(size = 4) +
    geom_text(aes(label = (round(medidade, 2))),
              vjust = - 0.7) + 
  ylim(20, 45) +
    labs(x = "Classe", y = "Idade", title = "Média de idade por sexo e classe") + 
    theme_bw()
