histo<-function(table_nbrecollab){
  h<-hist(table_nbrecollab$nb_collab,main='Fréquence du nombre de collaborations des étudiants',ylab = 'Fréquence',xlab='Nombre de collaborations',ylim=c(0,200))
  text(h$mids,h$counts,labels=h$counts,pos=3,col=c('black',rep('black',3)))
}
