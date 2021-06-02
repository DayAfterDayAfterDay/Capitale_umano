#statistica descrittiva analisi pil procapite 
library(ggplot2)
plot(gdp_capita$2015)
??boxplot
names(gdp_capita)
colnames(gdp_capita)[60] <- c("anno_duemilaquindici")
gdp_capita[1,60]
rownames(gdp_capita)
colnames(gdp_capita)
gdp_capita[60]
plot(gdp_capita$anno_duemilaquindici)

boxplot(gdp_capita$anno_duemilaquindici,
        main="reddito_procapite", col="light blue", border="blue",
        horizontal = TRUE,
        notch = TRUE)

boxplot(log(gdp_capita$anno_duemilaquindici),
        main="reddito_procapite_logaritmi", col="light pink", border="blue", 
        horizontal = TRUE,
        notch = TRUE)
par(mfrow=c(2,1))



