

#regulacao liberada esta associada a falta de informacao do preco para o consumidor?

print(
  
  paste("porcentagem pmcs vazios em precos liberados: ",
    100*sum(is.na(precosMed$`PMC 0%`[which(precosMed$`REGIME DE PREÇO` == "Liberado")]))
            / length(precosMed$`PMC 0%`[which(precosMed$`REGIME DE PREÇO` == "Liberado")])
  )

)

print(
  paste("porcentagem pmcs vazios em confaz Sim: ",
        100*sum(is.na(precosMed$`PMC 0%`[which(precosMed$`CONFAZ 87` == "Sim")]))
                /length(precosMed$`PMC 0%`[which(precosMed$`CONFAZ 87` == "Sim")])
  )
)

print( 
  paste(
    "qtd de laboratorios: ", length(levels(precosMed$`LABORATÓRIO`)),
    " R2 para PF e Laboratorio: ", R2(precosMed$`LABORATÓRIO`, precosMed$PF)
  )
)
