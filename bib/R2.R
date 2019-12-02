


R2 <- function(quali, quanti) {
  
  # Remove todas as entradas que possuem NA na coluna quanti ou quali
  nas <- is.na(quali)
  quali <- quali[which(!nas)]
  quanti <- quanti[which(!nas)]
  nas <- is.na(quanti)
  quali <- quali[which(!nas)]
  quanti <- quanti[which(!nas)]
  
  fatores <- levels(quali)
  fatores <- fatores[!is.na(fatores)]
  
  somaVar <- 0
  
  for (i in 1:length(fatores)) {
    
    # se o registro possuir fator = na, ent quanti e quali sao filtrados dnv para apenas os registros
    # que nao tenham o fator
    if(is.na(var(quanti[which(quali == fatores[i])], na.rm = TRUE))) {
      quanti <- quanti[which(quali != fatores[i])]
      quali <- quali[which(quali != fatores[i])]
      next 
    }
    
    somaVar <- somaVar + var(quanti[which(quali == fatores[i])], na.rm = TRUE)
    
  }
  
  varMedio <- somaVar/length(quali)
  
  # formula do R ao quadrado
  return(
    1 - varMedio/var(quanti, na.rm = TRUE)
  )
  
}