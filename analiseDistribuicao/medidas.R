### Medidas de tendencia central
medias <- c(mean(precosMed$PF, na.rm = T), mean(precosMed$`PMC 0%`, na.rm = T))
medianas <- c(median(precosMed$PF, na.rm = T), median(precosMed$`PMC 0%`, na.rm = T))
moda <- mode(precosMed$`CLASSE TERAPÊUTICA`)

### Medidas de variabilidade
amplitudes <- c(max(precosMed$PF, na.rm = T) - min(precosMed$PF, na.rm = T),
               max(precosMed$`PMC 0%`, na.rm = T) - min(precosMed$`PMC 0%`, na.rm = T))
desvios_padrao <- c(sd(precosMed$PF, na.rm = T), sd(precosMed$`PMC 0%`, na.rm = T))
variancias <- c(var(precosMed$PF, na.rm = T), var(precosMed$`PMC 0%`, na.rm = T))
COVs <- c(desvios_padrao[1]/medias[1], desvios_padrao[2]/medias[2])

decis <- list(quantile(as.numeric(precosMed$PF),
                    probs = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1),
                    na.rm = TRUE), 
           quantile(as.numeric(precosMed$`PMC 0%`),
                    probs = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1),
                    na.rm = TRUE))
quartis <- list(quantile(as.numeric(precosMed$PF), probs = c(0, 0.25, 0.5, 0.75, 1),
                      na.rm = TRUE),
             quantile(as.numeric(precosMed$`PMC 0%`), probs = c(0, 0.25, 0.5, 0.75, 1),
                      na.rm = TRUE))

iqrs <- c(IQR(precosMed$PF, na.rm = T), IQR(precosMed$`PMC 0%`, na.rm = T))
### Medidas de assimetria
pearson <- c(3*(medias[1] - medianas[1])/ desvios_padrao[1],
             3*(medias[2] - medianas[2]) / desvios_padrao[2])

a_quartis <- c(((quartis[[1]][4] - medianas[1]) - (medianas[1] - quartis[[1]][2])) / (quartis[[1]][4] - quartis[[1]][2]),
               ((quartis[[2]][4] - medianas[2]) - (medianas[2] - quartis[[2]][2])) / (quartis[[2]][4] - quartis[[2]][2]))

curtose <- c((quartis[[1]][4] - quartis[[1]][2])/(2*(decis[[1]][10] - decis[[1]][2])),
             (quartis[[2]][4] - quartis[[2]][2])/(2*(decis[[2]][10] - decis[[2]][2])))

