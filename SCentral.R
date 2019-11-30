
library(data.table)
library(dplyr)
library(ggplot2)

source("bib.R")

#Script central para realizar analise. 


precosMed <- fread("dados/TA_PRECO_MEDICAMENTO.csv")
  
glimpse(precosMed)


for(i in 1:length(precosMed)) {
  
  precosMed[[i]] <- gsub(",", ".", precosMed[[i]])
  
}

colnames(precosMed)[which(colnames(precosMed) == 'PF Sem Impostos')] <- 'PF'

precosMed$PF <- as.numeric(precosMed$PF)
precosMed$PF <- as.integer(precosMed$PF)

source("analiseDistribuicao/distPF.R")

sum(is.na(valores_em_branco_para_NA(precosMed$`PMC 0%`)))/nrow(precosMed) #20% de dados em branco
