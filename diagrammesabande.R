bplot<-function(nbrecollaboration){
  pdf(file = "donnees_BIO500/diagram_collab.pdf")
  barplot(nbrecollaboration[,2],xlab='Etudiants',ylab='Nombre de collaborations',ylim=c(0,35))
  title(main='Nombre de collaborations des etudiants')
}

bplot2<-function(nbrecollaboration){
  pdf(file = "donnees_BIO500/diagram_collab2.pdf")
  barplot(nbrecollaboration[,2],xlab='Etudiants',ylab='Nombre de collaborations',ylim=c(0,35))
  title(main='Nombre de collaborations des etudiants')
}
