graphadj<-function(requetecollaboration){
  pdf(file = "donnees_BIO500/igraphtry.pdf")
g <-  graph.data.frame(requetecollaboration)
plot(g)  
}
