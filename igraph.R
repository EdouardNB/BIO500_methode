graphadj<-function(requetecollaboration){
matrix<- table(requetecollaboration)
g <-  graph.adjacency(matrix)
plot(g, vertex.label = NA, edge.arrow.mode = 0, vertex.frame.color = NA, layout = layout_components(g))  
}
