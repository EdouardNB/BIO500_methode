#setwd("C:/Users/menui/Desktop/Universite/Methode_en_ecologie_computationnelle/.git/Travail_equipe/BIO500_methode")

library(targets)
library(visNetwork)
library(igraph)
library(dplyr)
library(RSQLite)
source("Data collab.R")
source("Data cours.R")
source("Data noeuds.R")
source("Table SQL.R")
source("Requete SQL.R")
source("Requete SQL2.R")
list(
  tar_target(
    coll,
    datacoll()
  ),
  tar_target(
    cours_raw,
    data_cours()
  ),
  tar_target(
    cours,
    clean_cours(cours_raw)
  ),
  tar_target(
    noeuds_raw,
    data_noeuds()
  ),
  tar_target(
    noeuds,
   clean_noeuds(noeuds_raw) 
  ),
  tar_target(
    SQL,
    create_SQL(noeuds,cours,coll)
  ),
  tar_target(
    nb_collab,
    requete1()
  ),
  tar_target(
    reseau_collab,
    requete2()
  )
)  