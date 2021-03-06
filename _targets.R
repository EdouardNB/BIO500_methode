#setwd("C:/Users/menui/Desktop/Universite/Methode_en_ecologie_computationnelle/.git/Travail_equipe/BIO500_methode")
library(targets)
library(visNetwork)
library(igraph)
library(dplyr)
library(RSQLite)
library(tarchetypes)
source("Data collab.R")
source("Data cours.R")
source("Data noeuds.R")
source("Table SQL.R")
source("Requete SQL.R")
source("Requete SQL2.R")
source("shapiro.R")
source("diagrammesabande.R")
source("connectionsql.R")
source("histogramme.R")
source("igraph.R")
source("listBIO500.R")
source("histogrammeBIO500.R")
source("shapiro2.R")
source("nombre_cohorte.R")
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
    connectionSQL,
    conSQL()
  ),
  tar_target(
    SQL,
    create_SQL(noeuds,cours,coll,connectionSQL)
  ),
  tar_target(
    nb_collab,
    requete1()
  ),
  tar_target(
    reseau_collab,
    requete2()
  ),
  tar_target(
    table_nbrecollab,
    read.csv("donnees_BIO500/nbrecollaboration", header=T)
  ),
  tar_target(
    table_collabo,
    read.csv("donnees_BIO500/requetecollaboration", header=T)
  ),
  tar_target(
    Shapiro,
    teststat(table_nbrecollab)
  ),
  tar_target(
    Barplot,
    bplot(table_nbrecollab)
  ),
  tar_target(
    Histogramme,
    histo(table_nbrecollab)
  ),
  tar_target(
    igraph,
    graphadj(table_collabo)
  ),
  tar_target(
    collab_BIO500,
    requete3()
  ),
  tar_target(
    list_BIO500,
    liste_etudiant()
  ),
  tar_target(
    igraph2,
    graphadj_BIO500(table_collabo,list_BIO500,table_nbrecollab)
  ),
  tar_target(
    Histogramme2,
    histogrammeBIO500(table_nbrecollab,list_BIO500)
  ),
  tar_target(
    table_nbrecollab_BIO500,
    nbcollab2(table_nbrecollab,list_BIO500)
  ),
  tar_target(
    Shapiro_BIO500,
    Shapiro2(table_nbrecollab_BIO500)
  ),
  tar_target(
    Barplot2,
    bplot2(table_nbrecollab_BIO500,list_BIO500)
  ),
  tar_target(
    nbcohorte59,
    nbr_cohorte(noeuds,list_BIO500)
  )
) 