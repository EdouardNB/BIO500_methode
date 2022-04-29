bplot<-function(nbrecollaboration){
  pdf(file = "donnees_BIO500/diagram_collab.pdf")
  barplot(nbrecollaboration$nb_collab,xlab='Étudiants',ylab='Nombre de collaborations',ylim=c(0,35))
}
