nbcollab2<-function(table_nbrecollab,list_BIO500){
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
return(nbcollabBIO500)
}

Shapiro2<-function(nbcollabBIO500){
  shapiro.test(nbcollabBIO500[,2])
}