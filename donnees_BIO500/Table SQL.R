library(RSQLite)
con <- dbConnect(SQLite(), dbname="equipe.db")
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
dbListTables(con)

#Création table cours
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
dbListTables(con)

#Création taable de collaboration
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
dbListTables(con)

dbWriteTable(con, append = TRUE, name = "noeud", value = noeuds, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "cours", value = cours, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "collaborations", value = coll, row.names = FALSE)