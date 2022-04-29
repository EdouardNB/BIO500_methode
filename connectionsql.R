conSQL<-function(){
  dbConnect(SQLite(), dbname="equipe.db")
}