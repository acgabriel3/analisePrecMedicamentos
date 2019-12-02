
library(data.table)
library(dplyr)
library(ggplot2)

source("bib.R") #chama biblioteca

#Script central para realizar analise. 
precosMed <- fread("dados/TA_PRECO_MEDICAMENTO.csv")
  
glimpse(precosMed)

source("limpeza/limpeza.R")

source("analiseDistribuicao/distPF.R")

sum(is.na(valores_em_branco_para_NA(precosMed$`PMC 0%`)))/nrow(precosMed) #20% de dados em branco

#formacao de variavel para verificar maiores precos
superPrecos <- precosMed[precosMed$PF > decilPF[10],]

sum(is.na(valores_em_branco_para_NA(superPrecos$`PMC 0%`)))/nrow(superPrecos) #57% de dados em branco

source("associacoes/associacoes.R") 

#nao funcionando o source para nuvem de palavras
# source("analiseDistribuicao/nuvem_precos_maiores_tipos_medicamentos.R")
