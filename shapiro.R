teststat<-function(table_nbrecollab){
  shapiro.test(table_nbrecollab$nb_collab)
}