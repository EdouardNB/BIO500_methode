requete1<-function(){
sql_requete<-"
SELECT etudiant1 count(DISTINCT etudiant2) AS nb_collab
FROM collaboration
GROUP BY etudiant1;"

nb_collab<-dbGetQuery(,sql_requete)
return(nb_collab)
}