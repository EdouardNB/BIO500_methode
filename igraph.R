graphadj<-function(requetecollaboration){
g <-  graph.adjacency(requetecollaboration)
plot(g, vertex.label = NA, edge.arrow.mode = 0, vertex.frame.color = NA, layout = layout_components(g))  
}