graphadj<-function(table_collabo){
g <-  graph.data.frame(table_collabo)
png(file = "donnees_BIO500/igraph_etudiants.png")
plot(g, vertex.label = NA, edge.arrow.mode = 0, vertex.frame.color = NA, layout = layout_components(g))  
}