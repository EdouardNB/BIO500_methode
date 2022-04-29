data_cours<-function(){
cours1=read.table("donnees_BIO500/Cours_Alexis_Nadya_Edouard_Penelope.txt",header=TRUE)
colnames(cours1)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours2=read.csv2("donnees_BIO500/cours_amelie.csv")
cours2=cours2[,c(-6,-7)]
colnames(cours2)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours3=read.table("donnees_BIO500/cours_anthonystp.txt",header=TRUE,sep=";")
cours3=cours3[,-5]
colnames(cours3)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours4=read.csv2("donnees_BIO500/cours_DP-GL-LB-ML-VQ_txt.csv")
colnames(cours4)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours5=read.table("donnees_BIO500/cours_FXC_MF_TC_LRT_WP..txt",header=TRUE)
colnames(cours5)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours6=read.table("donnees_BIO500/cours_IL_MDH_ASP_MB_OL.txt",header=TRUE,sep =";")
colnames(cours6)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours7=read.table("donnees_BIO500/cours_jbcaldlvjlgr.txt",header = TRUE,sep = ";")
colnames(cours7)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours8=read.table("donnees_BIO500/cours_martineau.txt",header=TRUE,sep=";")
colnames(cours8)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours9=read.csv2("donnees_BIO500/cours_cvl_jl_jl_mp_xs.csv")
colnames(cours9)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours_r=rbind(cours1,cours2,cours3,cours4,cours5,cours6,cours7,cours8,cours9)
}

clean_cours<-function(cours_r){
cours_e=distinct(cours_r)
a=nrow(cours_e)
b=nrow(cours_r)
n=vector(length = a)
t=vector(length = a)
for(i in 1:a){
  n[i]=0
  for (j in 1:b) {
    if(cours_e[i,1]==cours_r[j,1] & cours_e[i,2]==cours_r[j,2] & cours_e[i,3]==cours_r[j,3] & cours_e[i,4]==cours_r[j,4] & cours_e[i,5]==cours_r[j,5]){
      n[i]= n[i]+1
    }
  }
}
cours_e=cbind(cours_e,n)
cours_s=cours_e[order(cours_e$sigle), ]
c=a
cours=matrix(nrow = 1,ncol=6)
cours=data.frame(cours)
cours[1,1]=cours_s[1,1]
cours[1,2]=cours_s[1,2]
cours[1,3]=cours_s[1,3]
cours[1,4]=cours_s[1,4]
cours[1,5]=cours_s[1,5]
cours[1,6]=cours_s[1,6]
colnames(cours)<-c("sigle","credits","obligatoire","laboratoire","libre")
h=1
m=2
boite=vector(length = 6)
for(i in 2:a){
  if(cours_s[i,6]==1 & cours_s[i,1]!=cours[(m-1),1]|cours_s[i,6]>1 & cours_s[i,1]!=cours[(m-1),1]){
    for (j in 1:6) {
      boite[j]=cours_s[i,j]
    }
    cours=rbind(cours,boite)
    h=cours_s[i,6]
    m=m+1
  }else if(cours_s[i,6]>h & cours_s[i,1]==cours[(m-1),1]){
    m=m-1
    for (j in 1:6) {
      cours[m,j]=cours_s[i,j]
    }
    m=m+1
    h=cours_s[i,6]
  }
}
cours=cours[,-6]
return(cours)
}