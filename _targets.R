setwd("C:/Users/menui/Desktop/Universite/Methode_en_ecologie_computationnelle/.git/Travail_equipe/BIO500_methode")
library(targets)
library(visNetwork)
library(igraph)
source("scripts travail.R")
list(
  tar_target(
    data_1,
    n_distance(1)
  ),
  tar_target(
    etudiant,
    data_1$etudiant_Bio500
  ),
  tar_target(
    n_d1,
    as.numeric(data_1$n_short)
  ),
  tar_target(
    g_BIO500,
    graph_du_groupe(L)
  ),  
  tar_target(
      resultat_test,
      shapiro.test(n_d1)
    ),
  tar_target(
    histdn,
    hist(n_d1, main="Liaison entre les étudiants de Bio500", xlab="Nombre de partenaire de travail", ylab="Fréquence"),
  ),
  tar_target(
    Barplot,
    barplot(n_d1, main="Partenaire par étudiant du cours Bio500", names.arg=etudiant, xlab="",ylab="Quantité de partenaire",las=2,cex.names=0.54)
  )
)