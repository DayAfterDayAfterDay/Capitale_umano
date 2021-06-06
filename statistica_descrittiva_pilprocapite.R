#Statistica descrittiva sul PIL pro capite

#prima importo il dataset
gdp_capita <- read.csv("C:/Users/chign/OneDrive/Desktop/Capitale_umano-main/gdp_capita.csv",
                       header=FALSE, stringsAsFactors=TRUE)
View(gdp_capita)

#la mia riga è v60
gdp_capita<-gdp_capita[-1,]
as.numeric(gdp_capita$V60)
summary(gdp_capita$V60)
summary(log(gdp_capita$V60))
par(mfrow=c(1,2))
boxplot(log(gdp_capita$V60), main="Boxplot PIL pro capite logaritmi", col="pink",border="blue")
boxplot(gdp_capita$V60, main="Boxplot PIL pro capite", col="pink",border="blue")

#NAZIONI CON PIL PRO CAPITE MINIMO E MASSIMO
rownames(gdp_capita)<-c(1:262)

which.min(gdp_capita$V60)   #il minimo è il Burundi
which.max(gdp_capita$V60)   #il massimo è il Liechtenstein 


#statistiche varie
gdpcapita<-gdp_capita$V60
uffi_sorted<-sort(gdpcapita,decreasing=TRUE)
best5<-uffi_sorted[1:5]
best5

max(best5)
which.max(gdpcapita)
gdpcapita1<-gdpcapita[-134]
which.max(gdpcapita1)                           #secondo migliore è Monaco 
gdpcapita2<-gdpcapita1[-145]
which.max(gdpcapita2)                           #terzo migliore sono le Bermuda
gdpcapita3<-gdpcapita2[-24]
which.max(gdpcapita3)                           #quarto migliore è il Lussemburgo
gdpcapita4<-gdpcapita3[-139]
which.max(gdpcapita4)                           #quinto è l'Isola di Man

rm(gdpcapita1,gdpcapita2,gdpcapita3,gdpcapita4)

#lista 5 migliori: LICHTENSTEIN, MONACO, BERMUDA, LUSSEMBURGO e ISOLA DI MAN

worst5<-uffi_sorted[246:250]
worst5

summary(gdpcapita)
which.min(gdpcapita)                           #primo Burundi
gdpcapita1<-gdpcapita[-13]
which.min(gdpcapita1)                          #secondo Rep Centrale Africana
gdpcapita2<-gdpcapita1[-30]
which.min(gdpcapita2)                          #terzo Malawi
gdpcapita3<-gdpcapita2[-163]
which.min(gdpcapita3)                          #quarto è Madagascar
gdpcapita4<-gdpcapita3[-146]
which.min(gdpcapita4)                          #quinto è il Niger

#lista 5 peggiori: BURUNDI, REP. CENTRALE AFRICANA, MALAWI, MADAGARSCAR e NIGER

#istogramma (questo ragazzi non è per nulla affidabile)
hist(gdp_capita$V60,breaks=c(seq(0,70000,5000),70001, 168290.9),
     xlim=c(0,80000),col="pink",main="Istogramma PIL pro capite",
     xlab="PIL pro capite",ylab="Densità")

hist(gdp_capita$V60,breaks=c(seq(0,70000,5000),70001, 168290.9),
     col="pink",main="Istogramma PIL pro capite",
     xlab="PIL pro capite",ylab="Densità")

#istogramma metodo 2
uffi<-na.omit(gdp_capita$V60)
n<-round(sqrt(length(uffi)))
classi<-seq(min(uffi),max(uffi),length=n+1)
hist(uffi,breaks=classi,border="blue",
     col="pink",xlab="PIL pro capite",ylab="Frequenza",
     main="Istogramma PIL pro capite",las=1,axes=F)
axis(1, seq(0,175000, by = 25000))
axis(2, seq(0,180, by=10))

#istogramma metodo 3
larghezza<-2*IQR(uffi)/(length(uffi)^(1/3))
n1<-ceiling((max(uffi)-min(uffi))/larghezza)
classi1<-seq(min(uffi),max(uffi),length=n1+1)
hist(uffi,breaks=classi1,border="blue",
     col="pink",xlab="PIL pro capite",ylab="Frequenza",
     main="Istogramma PIL pro capite",las=1,axes=F)
axis(1, seq(0,175000, by = 25000))
axis(2, seq(0,120, by=10))

#frequenze dell'istogramma 2
classes1<-cut(uffi,breaks=classi,right=FALSE)
fr.ass1<-table(classes1)
fr.ass1
freq.rel1<-table(classes1) / (sum(table(classes1)))
freq.rel1
freq.perc1<-table(classes1) / (sum(table(classes1)))*100
freq.perc1

#frequenze dell'istogramma 3
classes<-cut(uffi,breaks=classi1,right=FALSE)
fr.ass<-table(classes)
fr.ass
freq.rel<-table(classes) / (sum(table(classes)))
freq.rel
freq.perc<-table(classes) / (sum(table(classes)))*100
freq.perc

#pensavo di usare l'istogramma 3 e la relativa tabella di frequenza, fatemi sapere!
