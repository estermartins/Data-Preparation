##########################
# Data Preparation
# Aula 01
# Prof. Neylson Crepalde 
# Ester Pereira Martins
##########################

#Instalar os pacotes
install.packages("dplyr")

# Carregar o pacote dplyr no ambiente
library(dplyr)
# Carrega o banco de dados iris já embutido na memória
data("iris")
# Verificar primeiros casos
head(iris)
# Verificar os nomes das variáveis
names(iris)
# Verificar a estrutura do objeto
str(iris)
# Verificar o tamanho dos dados(linhas e colunas) 
dim(iris)
nrow(iris) # linhas
ncol(iris) # colunas

# Acessando a documentação do banco iris
help(iris) # ou ?iris

################################
# Manipular os dados com dplyr
# O dplyr posue alguns verbos, que executam ações expecíficas no banco de dados

# select - seleciona colunas
select(iris, species)
