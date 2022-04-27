histo<-function(nbrecollaboration){
  nbrecollaboration <- as.numeric(nbrecollaboration) 
  hist(nbrecollaboration$nb_collab)
}