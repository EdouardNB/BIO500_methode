requete2<-function(){
con <- dbConnect(SQLite(), dbname="equipe.db")
sql_requete2 <-"
SELECT etudiant1, etudiant2 FROM collaborations
;"
  
reseau_collab<-dbGetQuery(con,sql_requete2)
write.csv(reseau_collab, "donnees_BIO500/requetecollaboration", row.names =  F)
return(reseau_collab)
}