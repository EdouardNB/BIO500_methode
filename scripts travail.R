setwd("C:/Users/menui/Desktop/Universit?/M?thode en ?cologie computationnelle")
library(RSQLite)
con <- dbConnect(SQLite(), dbname="equipe.db")
noeuds_sql<- '
CREATE TABLE noeuds (
nom_prenom VARCHAR(50),
annee_debut DATE(4),
session_debut CHAR(1),
programme VARCHAR(20),
coop BOOLEAN(1),
PRIMARY KEY (nom_prenom)
);'
dbSendQuery(con, noeuds_sql)
dbListTables(con)

cours_sql<-'
CREATE TABLE cours (
sigle CHAR(6),
credits INTEGER(1),
obligatoire BOOLEAN(1),
laboratoire BOOLEAN(1),
libre BOOLEAN(1),
PRIMARY KEY (sigle)
);'

dbSendQuery(con,cours_sql)
dbListTables(con)

collaboration_sql<-'
CREATE TABLE collaborations (
etudiant1 VARCHAN(50),
etudiant2 VARCHAN(50),
cours CHAR(6),
date DATE(3),
PRIMARY KEY (etudiant1, etudiant2, cours),
FOREIGN KEY (etudiant1) REFERENCES noeuds(nom_prenom),
FOREIGN KEY (etudiant2) REFERENCES noeuds(nom_prenom),
FOREIGN KEY (cours) REFERENCES cours(sigle)
);'
dbSendQuery(con,collaboration_sql)
dbListTables(con)

#Donn?es
setwd("C:/Users/menui/Desktop/Universit?/M?thode en ?cologie computationnelle/donnees_BIO500")
library("dplyr")
coll1_r=read.table("collaboration_Alexis_Nadya_Edouard_Penelope.txt",header=TRUE)
coll1=distinct(coll1_r)
colnames(coll1)<-c("etudiant1","etudiant2","sigle","date")
coll2_r=read.csv2("collaborations_amelie.csv")
coll2=distinct(coll2_r)
colnames(coll2)<-c("etudiant1","etudiant2","sigle","date")
coll3_r=read.table("collaborations_anthonystp.txt",header=TRUE,sep=";")
coll3=distinct(coll3_r)
colnames(coll3)<-c("etudiant1","etudiant2","sigle","date")
coll4_r=read.csv2("collaborations_DP-GL-LB-ML-VQ_txt.csv")
coll4_r=coll4_r[,-5]
coll4=distinct(coll4_r)
colnames(coll4)<-c("etudiant1","etudiant2","sigle","date")
coll5_r=read.table("collaborations_FXC_MF_TC_LRT_WP..txt",header=TRUE)
coll5=distinct(coll5_r)
colnames(coll5)<-c("etudiant1","etudiant2","sigle","date")
coll6_r=read.table("collaborations_IL_MDH_ASP_MB_OL.txt",header=TRUE,sep =";")
coll6_r=coll6_r[,-5]
coll6=distinct(coll6_r)
colnames(coll6)<-c("etudiant1","etudiant2","sigle","date")
coll7_r=read.table("collaborations_jbcaldlvjlgr.txt",header = TRUE,sep = ";")
coll7=distinct(coll7_r)
colnames(coll7)<-c("etudiant1","etudiant2","sigle","date")
coll8_r=read.table("collaborations_martineau.txt",header=TRUE,sep=";")
coll8=distinct(coll8_r)
colnames(coll8)<-c("etudiant1","etudiant2","sigle","date")
coll9_r=read.csv2("collaborations_cvl_jl_jl_mp_xs.csv")
coll9=distinct(coll9_r)
colnames(coll9)<-c("etudiant1","etudiant2","sigle","date")
coll=rbind(coll1,coll2,coll3,coll4,coll5,coll6,coll7,coll8,coll9)

cours1=read.table("Cours_Alexis_Nadya_Edouard_Penelope.txt",header=TRUE)
colnames(cours1)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours2=read.csv2("cours_amelie.csv")
cours2=cours2[,c(-6,-7)]
colnames(cours2)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours3=read.table("cours_anthonystp.txt",header=TRUE,sep=";")
cours3=cours3[,-5]
colnames(cours3)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours4=read.csv2("cours_DP-GL-LB-ML-VQ_txt.csv")
colnames(cours4)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours5=read.table("cours_FXC_MF_TC_LRT_WP..txt",header=TRUE)
colnames(cours5)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours6=read.table("cours_IL_MDH_ASP_MB_OL.txt",header=TRUE,sep =";")
colnames(cours6)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours7=read.table("cours_jbcaldlvjlgr.txt",header = TRUE,sep = ";")
colnames(cours7)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours8=read.table("cours_martineau.txt",header=TRUE,sep=";")
colnames(cours8)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours9=read.csv2("cours_cvl_jl_jl_mp_xs.csv")
colnames(cours9)<-c("sigle","credits","obligatoire","laboratoire","libre")
cours_r=rbind(cours1,cours2,cours3,cours4,cours5,cours6,cours7,cours8,cours9)
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
cours=matrix(nrow = c,ncol=6)
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
for(i in 2:a){
  if(cours_s[i,6]==1 & cours_s[i,1]!=cours[(m-1),1]|cours_s[i,6]>1 & cours_s[i,1]!=cours[(m-1),1]){
    cours[m,1]=cours_s[i,1]
    cours[m,2]=cours_s[i,2]
    cours[m,3]=cours_s[i,3]
    cours[m,4]=cours_s[i,4]
    cours[m,5]=cours_s[i,5]
    cours[m,6]=cours_s[i,6]
    h=cours_s[i,6]
    m=m+1
  }else if(cours_s[i,6]>h & cours_s[i,1]==cours[(m-1),1]){
    m=m-1
    cours[m,1]=cours_s[i,1]
    cours[m,2]=cours_s[i,2]
    cours[m,3]=cours_s[i,3]
    cours[m,4]=cours_s[i,4]
    cours[m,5]=cours_s[i,5]
    cours[m,6]=cours_s[i,6]
    m=m+1
    h=cours_s[i,6]
  }else{
    cours=cours[-c,]
    c=c-1
  }
}
cours=cours[-66,]
cours=cours[-65,]
cours=cours[-64,]
cours=cours[-63,]
cours=cours[-62,]
cours=cours[-61,]
cours=cours[,-6]

noeuds1=read.table("etudiant_Alexis_Nadya_Edouard_Penelope.txt",header=TRUE)
colnames(noeuds1)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds2=read.csv2("noeuds_amelie.csv")
colnames(noeuds2)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds3=read.table("noeuds_anthonystp.txt",header=TRUE,sep=";")
colnames(noeuds3)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds4=read.csv2("noeuds_DP-GL-LB-ML-VQ_txt.csv")
colnames(noeuds4)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds5=read.table("noeuds_FXC_MF_TC_LRT_WP.txt",header=TRUE)
colnames(noeuds5)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds6=read.table("etudiant_IL_MDH_ASP_MB_OL.txt",header=TRUE,sep =";")
colnames(noeuds6)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds7=read.table("noeuds_jbcaldlvjlgr.txt",header = TRUE,sep = ";")
colnames(noeuds7)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds8=read.table("noeuds_martineau.txt",header=TRUE,sep=";")
colnames(noeuds8)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds9=read.csv2("noeuds_cvl_jl_jl_mp_xs.csv")
noeuds9=noeuds9[,-1]
colnames(noeuds9)<-c("nom_prenom","annee_debut","session_debut","programme","coop")
noeuds_r=rbind(noeuds1,noeuds2,noeuds3,noeuds4,noeuds5,noeuds6,noeuds7,noeuds8,noeuds9)
noeuds_r[is.na(noeuds_r)] = "NA"
noeuds_e=distinct(noeuds_r)
a2=nrow(noeuds_e)
b2=nrow(noeuds_r)
n2=vector(length = a2)
for(i in 1:a2){
  n2[i]=0
  for (j in 1:b2) {
    if(noeuds_e[i,1]==noeuds_r[j,1] & noeuds_e[i,2]==noeuds_r[j,2] & noeuds_e[i,3]==noeuds_r[j,3] & noeuds_e[i,4]==noeuds_r[j,4] & noeuds_e[i,5]==noeuds_r[j,5]){
      n2[i]= n2[i]+1
    }
  }
}
noeuds_e=cbind(noeuds_e,n2)
noeuds_s=noeuds_e[order(noeuds_e$nom_prenom), ]
