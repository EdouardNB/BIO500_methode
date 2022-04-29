bplot<-function(nbrecollaboration){
  pdf(file = "donnees_BIO500/diagram_collab.pdf")
  barplot(nbrecollaboration[,2],xlab='Etudiants',ylab='Nombre de collaborations',ylim=c(0,35))
  title(main='Nombre de collaborations des etudiants')
}

bplot2<-function(nbrecollaboration,list_BIO500){
  pdf(file = "donnees_BIO500/diagram_collab2.pdf")
  barplot(nbrecollaboration[,2],ylab='Nombre de collaborations',ylim=c(0,35), names.arg=list_BIO500, las=2, cex.names=0.4)
  title(main='Nombre de collaborations des etudiants')
}
