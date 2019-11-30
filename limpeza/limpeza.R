
for(i in 1:length(precosMed)) {
  
  precosMed[[i]] <- gsub(",", ".", precosMed[[i]])
  
}

colnames(precosMed)[which(colnames(precosMed) == 'PF Sem Impostos')] <- 'PF'

precosMed$PF <- as.numeric(precosMed$PF)
precosMed$PF <- as.integer(precosMed$PF)

precosMed$`PMC 0%` <- as.numeric(precosMed$`PMC 0%`)
precosMed$`PMC 0%` <- as.integer(precosMed$`PMC 0%`)
