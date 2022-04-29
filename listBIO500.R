requete3<-function(){
  con <- dbConnect(SQLite(), dbname="equipe.db")
  sql_requete3 <-"
SELECT etudiant1, etudiant2 
  FROM collaborations WHERE sigle LIKE 'BIO500'
;"
  
  etudiant<-dbGetQuery(con,sql_requete3)
  write.csv(etudiant, "donnees_BIO500/liste_BIO500", row.names =  F)
}

liste_etudiant<-function(){
  table=read.csv("donnees_BIO500/liste_BIO500", header=T)
  liste_etudiant=c(table$etudiant1,table$etudiant2)
  liste_etudiant=unique(liste_etudiant)
  return(liste_etudiant)
}