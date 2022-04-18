setwd("C:/Users/menui/Desktop/Université/Méthode en écologie computationnelle/donnees_BIO500")
# installation des packages
install.packages("RSQLite")
install.packages("dplyr")
install.packages("rmarkdown")
install.packages("tinytex")
install.packages("targets")

library(RSQLite)
con <- dbConnect(SQLite(), dbname="equipe.db")
#creation de la table de noeud
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

#Création table cours
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

#Création taable de collaboration
collaboration_sql<-'
CREATE TABLE collaborations (
etudiant1 VARCHAN(50),
etudiant2 VARCHAN(50),
sigle CHAR(6),
date DATE(3),
PRIMARY KEY (etudiant1, etudiant2, sigle),
FOREIGN KEY (etudiant1) REFERENCES noeuds(nom_prenom),
FOREIGN KEY (etudiant2) REFERENCES noeuds(nom_prenom),
FOREIGN KEY (sigle) REFERENCES cours(sigle)
);'
dbSendQuery(con,collaboration_sql)
dbListTables(con)

#Données
library("dplyr")
#manipulation table collaboration
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

#manipulation table cours
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

#manipulation table noeuds
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

install.packages("igraph")
library(igraph)
gn <- graph.adjacency(noeuds)
plot(gn)
gc <- graph.adjacency(cours)
head(noeuds)
 

coll_BIO500=subset(coll,sigle=="BIO500")
etudiant_Bio500=c(coll_BIO500$etudiant1,coll_BIO500$etudiant2)
etudiant_Bio500=unique(etudiant_Bio500)
etudiant_Bio500=sort(etudiant_Bio500)
etudiant_Bio500[33]="plewenski_david"
e=nrow(coll)
d=length(etudiant_Bio500)
n_noeuds=vector(length = d)
n_noeuds[is.na(n_noeuds)] <- 0
for (i in 1:d) {
  for (j in 1:e) {
    if(etudiant_Bio500[i]==coll[j,1]){
      n_noeuds[i]=n_noeuds[i]+1
    }
  }
}
n_coll=cbind(etudiant_Bio500,n_noeuds)
n_coll=data.frame(n_coll)

dbWriteTable(con, append = TRUE, name = "noeuds", value = noeuds, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "cours", value = cours, row.names = FALSE)
dbWriteTable(con, append = TRUE, name = "collaborations", value = coll, row.names = FALSE)

L=  table(coll$etudiant1, coll$etudiant2)
head(L)
g = graph.adjacency(L) 
V(g)$size = 1.5
plot(g,vertex.label=NA, edge.arrow.mode = 0, vertex.frame.color =2, layout=layout.kamada.kawai(g) )

#Distance entre chancun des noeuds
D=distances(g)
print(D)
D2=data.frame(D)
N=ncol(D2)
R=row.names(D2)
C=names(D2)
Distances_BIO500=matrix(nrow=d,ncol=d)
for (k in 1:47) {
  for (i in 1:N) {
    if(C[i]==etudiant_Bio500[k]){
      for (l in 1:47) {
        for (j in 1:N) {
          if(R[j]==etudiant_Bio500[l]){
            Distances_BIO500[l,k]=D2[j,i]
          }
        }
      }
    }
  }
}
row.names(Distances_BIO500)=etudiant_Bio500
colnames(Distances_BIO500)=etudiant_Bio500

#Analyse des distances
n_distance<- function(n) {
  n_short=vector(length = d)
  for (i in 1:d) {
    n_short[i]=0 
    for (j in 1:N) {
      if(C[j]==etudiant_Bio500[i]){
        for (k in 1:N) {
          if(D2[k,j]==n){
            n_short[i]=n_short[i]+1
          }
        }
      }
    }
  }
  m_distance=cbind(etudiant_Bio500,n_short)
  m_distance=data.frame(m_distance)
  return(m_distance)
}
d1=n_distance(1)
d1$n_short=as.numeric(d1$n_short)
d2=n_distance(2)
d2$n_short=as.numeric(d2$n_short)
d3=n_distance(3)
d3$n_short=as.numeric(d3$n_short)
d4=n_distance(4)
d4$n_short=as.numeric(d4$n_short)
d5=n_distance(5)
d5$n_short=as.numeric(d5$n_short)

#Graph de BIO500
BIO500=matrix(nrow = d,ncol = d)
for (k in 1:47) {
  for (i in 1:N) {
    if(C[i]==etudiant_Bio500[k]){
      for (l in 1:47) {
        for (j in 1:N) {
          if(R[j]==etudiant_Bio500[l]){
            BIO500[l,k]=L[j,i]
          }
        }
      }
    }
  }
}
row.names(BIO500)=etudiant_Bio500
colnames(BIO500)=etudiant_Bio500
g_BIO500=graph.adjacency(BIO500)
V(g_BIO500)$size = 10
plot(g_BIO500,vertex.label=NA, edge.arrow.mode = 0, vertex.frame.color =2, layout=layout.kamada.kawai(g_BIO500) )

#script analyse 

#Analyse graphique
hist(n500, prob=T)
curve(dnorm(nrow(n500),mean(n500),sd(n500)), add=T, col="red")


#Analyse statistique    
#Test de Shapiro-Wilk
#H0: les données sont normales
#H1: les données ne sont pas normales
#Donc si p > 0.05, on ne rejete pas H0:Nos données sont donc normales

shapiro.test(n500)
