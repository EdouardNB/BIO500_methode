requete1<-function(){
con <- dbConnect(SQLite(), dbname="equipe.db")
sql_requete <-"
SELECT etudiant1,
  count(DISTINCT etudiant2) AS nb_collab
FROM collaborations
GROUP BY etudiant1
;"

nb_collab<-dbGetQuery(con,sql_requete)
write.csv(nb_collab, "donnees_BIO500/nbrecollaboration", row.names =  F)
return(nb_collab)
}