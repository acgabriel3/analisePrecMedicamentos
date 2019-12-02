# PF 0%, PF 12%, PF 17%, PF 17% ALC, PF 17,5%, PF 17,5% ALC, PF 18%, PF 18% ALC, PF 20%
# PMC 0%, PMC 12%, PMC 17%, PMC 17% ALC, PMC 17,5%, PMC 17,5% ALC, PMC 18%, PMC 18% ALC, PMC 20%

porcentagem_aliquota_str <-  c("0%", "12%","17%","17% ALC","17,5%", "17,5% ALC", "18%", "18% ALC", "20%")

for (i in 1:length(porcentagem_aliquota_str)) {
    valPF <- valores_em_branco_para_NA(precosMed[[paste("PF ", porcentagem_aliquota_str[i], sep = "")]])
    valPMC <- valores_em_branco_para_NA(precosMed[[paste("PMC ", porcentagem_aliquota_str[i], sep = "")]])
    #ele n ta acessando a variavel pro 17.5 q zuado

    valPF <- as.numeric(valPF)
    valPMC <- as.numeric(valPMC)
    
    diff <- valPMC - valPF
    print(head(diff))

    print(paste("Para aliquota de", porcentagem_aliquota_str[i],
                "tem-se a diferença média de", mean(diff, na.rm = TRUE)))
} #essa ta toda certa
