histogrammeBIO500<-function(table_nbrecollab,list_BIO500){
  nbcollabBIO500=matrix(ncol=2, nrow=47)
  for (i in 1:47) {
    for (j in 1:222) {
      if(list_BIO500[i]==table_nbrecollab[j,1]){
        nbcollabBIO500[i,1]=table_nbrecollab[j,1]
        nbcollabBIO500[i,2]=table_nbrecollab[j,2]
      }
    }
  }
  nbcollabBIO500=data.frame(nbcollabBIO500)
  nbcollabBIO500[,2]=as.numeric(nbcollabBIO500[,2])
  pdf(file = "donnees_BIO500/histoBIO500.pdf")
  hist(nbcollabBIO500[,2],main="Frequence du nombre de collaborations des etudiants",ylab = "Frequence",xlab="Nombre de collaborations",ylim=c(0,25))
}