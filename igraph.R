graphadj<-function(table_collabo){
g <-  graph.data.frame(table_collabo)
png(file = "donnees_BIO500/igraph_etudiants.png")
plot(g, vertex.label = NA, edge.arrow.mode = 0, vertex.frame.color = NA, layout = layout_components(g))  
}

graphadj_BIO500<-function(table_collabo,etudiant_BIO500,etudiant){
  L=table(table_collabo$etudiant1,table_collabo$etudiant2)
  C=order(etudiant$etudiant1)
  BIO500=matrix(nrow = 47,ncol = 47)
  for (k in 1:47) {
    for (i in 1:222) {
      if(C[i]==etudiant_BIO500[k]){
        for (l in 1:47) {
          for (j in 1:222) {
            if(C[j]==etudiant_BIO500[l]){
              BIO500[l,k]=L[j,i]
            }
          }
        }
      }
    }
  }
  row.names(BIO500)=etudiant_BIO500
  colnames(BIO500)=etudiant_BIO500
  g_BIO500=graph.adjacency(BIO500)
  png(file = "donnees_BIO500/igraph_BIO500.png")
  plot(g_BIO500, vertex.label = NA, edge.arrow.mode = 0, vertex.frame.color = NA, layout = layout_components(g_BIO500))  
}