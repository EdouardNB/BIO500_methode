setwd("C:/Users/menui/Desktop/Universite/Methode_en_ecologie_computationnelle/.git/Travail_equipe/BIO500_methode")
library(targets)
library(visNetwork)
tar_option_set(packages = c("igraph","dplyr"))

list(
  tar_target(
    data,
    read.table("nombre_de_partenaire.txt", header = T)
  ),
  tar_target(
    histdn,
    hist(data$n_short, main="Liaison entre les étudiants de Bio500", xlab="Nombre de partenaire de travail", ylab="Fréquence"),
  ),
  tar_target(
    Barplot,
    barplot(data$n_short ~ data$etudiant_Bio500, main="Partenaire par étudiant du cours Bio500", xlab="",ylab="Quantité de partenaire",las=2,cex.names=0.54)
  )
)