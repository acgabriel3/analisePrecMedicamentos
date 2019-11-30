

#Nuvem de palavras

library(tm)
library(readxl)
library(tm)
library(qdap)
library(wordcloud)
library(RColorBrewer)
library(stringr)

vetor <- VectorSource(superPrecos$`CLASSE TERAPÊUTICA`)

vcorpusAtividades <- VCorpus(vetor)

vcorpusAtividades <- tm_map(vcorpusAtividades, tolower)
vcorpusAtividades <- tm_map(vcorpusAtividades, removePunctuation)
vcorpusAtividades <- tm_map(vcorpusAtividades, removeNumbers)
vcorpusAtividades <- tm_map(vcorpusAtividades, stripWhitespace)
vcorpusAtividades <- tm_map(vcorpusAtividades, removeWords, c("com", "que", "o","a","ou", "de", "da", "e", "etc", "frutas", "fruto",
                                                              "para", "n?o", "preta", "terra", "na", "em", "com", "do",
                                                              "chinesa", "italiana", "folha", "integral", "Na", "nA", "NA",
                                                              "n?", "japon?s", "especificadas", "doce", "s?o", "?", 
                                                              "um", "no", "uma", "por", "pode", "sbrt", "ser", "deve",
                                                              "podem", "mais", "pela", "at?", "das", "como", "os",
                                                              "as", "dos", "tamb?m", "quando", "muito", "m", "g", "?")) 

frequence <- wfm(vcorpusAtividades)

dtm <- TermDocumentMatrix(vcorpusAtividades)

data <- data.frame(produtos = rownames(frequence)[order(frequence)], frequencia = frequence[order(frequence)])

set.seed(1234)
wordcloud(words = data$produtos, freq = data$frequencia, min.freq = 1,
          max.words=200, random.order=FALSE, rot.per=0.35, 
          colors=brewer.pal(8, "Dark2"))


