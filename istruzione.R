library(data.table)
library(zoo)
library(tidyverse)

exp_tot_exp <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/expenditure_education_of_expenditure.csv")
exp_gdp <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/expenditure_education_gdp.csv")
exp_gdp_capita <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/expenditure_gdp_percapita.csv")
literacy_rate <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/literacy_rate.csv")
exp_student_gdp_capita <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/exp_student_gdp_capita.csv")
trained_techers_primary <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/trained_techers_primary.csv")
pupil_teacher <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/pupil_teacher.csv")
literacy_over_15 <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/literacy_over_15.csv")
literacy_15_24 <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/literacy_15_24.csv")
gdp_capita <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/gdp_capita.csv")
articles <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/articles.csv")
tax_revenue <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/tax_revenue.csv")
gdp <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/gdp.csv")
enroll_sec_priv <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/enroll_sec_private.csv")
enroll_upsec_priv <- read.csv("C:/Users/andre/Documents/Tesina/Istruzione/enroll_upsec_private.csv")

# il nostro obiettivo è quello di trovare l'anno con il minor numero di nas

min_nas <- list()
1:length(ls())
for(i in 1:length(ls())){
  k <- ls()[[i]]
  # con ls() ottengo tutti i nomi delle variabili nel global env
  # estraggo i dati con get, e con le successive righe determino quale colonna
  # (quindi quale anno) contenga il minor numero di NAs
  if(k!="i"| k!="min_nas"){
  data <- get(k)
  data <- data[ , purrr::map_lgl(data, is.numeric)]
  min_nas[[paste0(k, i)]] <- which.min(unlist(map(data, ~sum(is.na(.)))))
  rm(data)}

}
min_nas

table(min_nas)

# dopo aver trovato l'anno in cui in media abbiamo meno NAs
# iniziamo la parte descrittiva


plot(exp_gdp, tax_revenue)
