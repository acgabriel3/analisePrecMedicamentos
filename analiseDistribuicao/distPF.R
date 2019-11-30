
decilPF <- quantile(as.numeric(precosMed$PF), probs = c(0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1), na.rm = TRUE)

quartilPF <- quantile(as.numeric(precosMed$PF), probs = c(0, 0.25, 0.5, 0.75, 1), na.rm = TRUE)

print(
  
  ggplot(precosMed, aes(y = PF)) +
  geom_boxplot(outlier.colour="black", outlier.shape=16,
               outlier.size=2, notch=FALSE) +
  ylim(c(0, 1000))
  
  )
