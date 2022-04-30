requete4<-function(){
  con <- dbConnect(SQLite(), dbname="equipe.db")
  sql_requete4 <-"
SELECT nom_prenom 
  FROM noeuds WHERE annee_debut LIKE 2019
;"
  
  cohorte<-dbGetQuery(con,sql_requete4)
  write.csv(cohorte, "donnees_BIO500/cohorte59", row.names =  F)
}
 
nbr_cohorte<-function(noeuds,list_BIO500){
  n=0
  noeuds[is.na(noeuds)] <- "NA"
  for (j in 1:47) {
    for (i in 1:197) {
      if(noeuds[i,2]==2019 & noeuds[i,1]==list_BIO500[j]){
      n=n+1
      }
    }
  }
  return(n)
}
