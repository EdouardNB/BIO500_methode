data_noeuds<-function(){
noeuds1=read.table("donnees_BIO500/etudiant_Alexis_Nadya_Edouard_Penelope.txt",header=TRUE)
colnames(noeuds1)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds2=read.csv2("donnees_BIO500/noeuds_amelie.csv")
colnames(noeuds2)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds3=read.table("donnees_BIO500/noeuds_anthonystp.txt",header=TRUE,sep=";")
colnames(noeuds3)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds4=read.csv2("donnees_BIO500/noeuds_DP-GL-LB-ML-VQ_txt.csv")
colnames(noeuds4)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds5=read.table("donnees_BIO500/noeuds_FXC_MF_TC_LRT_WP.txt",header=TRUE)
colnames(noeuds5)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds6=read.table("donnees_BIO500/etudiant_IL_MDH_ASP_MB_OL.txt",header=TRUE,sep =";")
colnames(noeuds6)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds7=read.table("donnees_BIO500/noeuds_jbcaldlvjlgr.txt",header = TRUE,sep = ";")
colnames(noeuds7)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds8=read.table("donnees_BIO500/noeuds_martineau.txt",header=TRUE,sep=";")
colnames(noeuds8)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds9=read.csv2("donnees_BIO500/noeuds_cvl_jl_jl_mp_xs.csv")
noeuds9=noeuds9[,-1]
colnames(noeuds9)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds_r=rbind(noeuds1,noeuds2,noeuds3,noeuds4,noeuds5,noeuds6,noeuds7,noeuds8,noeuds9)
return(noeuds_r)
}

clean_noeuds<-function(noeuds_r){
noeuds_NA=noeuds_r
noeuds_NA[is.na(noeuds_NA)] = "NA"
noeuds_e=distinct(noeuds_NA)
a2=nrow(noeuds_e)
noeuds_s=noeuds_e[order(noeuds_e$nom_prenom), ]
noeuds=matrix(ncol=5,nrow=1)
c=2
boite2=vector(length = 5)
noeuds[1,1]=noeuds_s[1,1]
noeuds[1,2]=noeuds_s[1,2]
noeuds[1,3]=noeuds_s[1,3]
noeuds[1,4]=noeuds_s[1,4]
noeuds[1,5]=noeuds_s[1,5]
for (i in 2:a2) {
  if(noeuds[(c-1),1]!=noeuds_s[i,1]){
    for (j in 1:5) {
      boite2[j]=noeuds_s[i,j]
    }
    noeuds=rbind(noeuds,boite2)
    c=c+1
  }
  else if(noeuds[(c-1),2]=="NA"|noeuds[(c-1),3]=="NA"|noeuds[(c-1),4]=="NA"|noeuds[(c-1),5]=="NA"){
    c=c-1
    for (j in 1:5) {
      noeuds[c,j]=noeuds_s[i,j]
    }
    c=c+1
  }
}
colnames(noeuds)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds=data.frame(noeuds)
noeuds[noeuds=="NA"]<- NA
return(noeuds)
}