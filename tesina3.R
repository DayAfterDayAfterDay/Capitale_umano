#studiamo articoli per 100000 abitanti 
FL <- read_csv("FL.csv")
outliers <- c(7,36, 61:65, 74, 95, 98, 102:105,107,110, 128, 134,135, 136, 139, 140, 142, 153, 156, 161, 170, 181,
              183, 191,198,204,  215, 217, 218,  230,231,236,238,240,241, 249, 259, 263)
FL<-FL[-outliers]
colnames(FL)[60] <- c("duemilaquindici")
FL<-FL$duemilaquindici
articles <- read_csv("articles.csv")
articles<-articles[-outliers]
colnames(articles)[60] <- c("duemilaquindici")
articles<-articles$duemilaquindici/(FL/100000)
hist(articles, main="Articoli scientifici ogni 100000 abitanti", xlab="articoli",
     ylab="frequenze", col="blue")
#istogramma pupil teacher
pupil_teacher <- read_csv("pupil_teacher.csv")
pupil_teacher<-pupil_teacher[-outliers]
colnames(pupil_teacher)[60]<-c("duemilaquindici")
pupil_teacher<-pupil_teacher$duemilaquindici
hist(pupil_teacher, main="Numero di alunni per ciascun insegnante", xlab="insegnati",
     ylab="frequenze", col="yellow")
