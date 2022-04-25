create_SQL<-function(noeuds,cours,coll){
con <- dbConnect(SQLite(), dbname="equipe.db")
dbSendQuery(con, "DROP TABLE noeud;")
#creation de la table de noeud
noeuds_sql<- '
CREATE TABLE noeud (
nom_prenom VARCHAR(50),
annee_debut DATE(4),
session_debut CHAR(1),
programme VARCHAR(20),
coop BOOLEAN(1),
PRIMARY KEY (nom_prenom)
);'
dbSendQuery(con, noeuds_sql)

#Création table cours
dbSendQuery(con, "DROP TABLE cours;")
cours_sql<-'
CREATE TABLE cours (
sigle CHAR(6),
credits INTEGER(1),
obligatoire BOOLEAN(1),
laboratoire BOOLEAN(1),
libre BOOLEAN(1),
PRIMARY KEY (sigle)
);'

dbSendQuery(con,cours_sql)

#Création taable de collaboration
dbSendQuery(con, "DROP TABLE collaborations;")
collaboration_sql<-'
CREATE TABLE collaborations (
etudiant1 VARCHAN(50),
etudiant2 VARCHAN(50),
sigle CHAR(6),
date DATE(3),
PRIMARY KEY (etudiant1, etudiant2, sigle),
FOREIGN KEY (etudiant1) REFERENCES noeud(nom_prenom),
FOREIGN KEY (etudiant2) REFERENCES noeud(nom_prenom),
FOREIGN KEY (sigle) REFERENCES cours(sigle)
);'
dbSendQuery(con,collaboration_sql)

dbWriteTable(con, overwrite = TRUE, name = "noeud", value = noeuds, row.names = FALSE)
dbWriteTable(con, overwrite = TRUE, name = "cours", value = cours, row.names = FALSE)
dbWriteTable(con, overwrite = TRUE, name = "collaborations", value = coll, row.names = FALSE)
return(con)
}