library(gridExtra)                        # Load gridExtra package
library(ggplot2)
# Get lower triangle of the correlation matrix
get_lower_tri<-function(cormat){
  cormat[upper.tri(cormat)] <- NA
  return(cormat)
}
# Get upper triangle of the correlation matrix
get_upper_tri <- function(cormat){
  cormat[lower.tri(cormat)]<- NA
  return(cormat)
}

custom_heatmap <- function(data,c_title) {
  cormat <- round(cor(as.matrix(data)),2)
  upper_tri <- get_upper_tri(cormat)
  upper_tri
  
  # Melt the correlation matrix
  library(reshape2)
  melted_cormat <- melt(upper_tri, na.rm = TRUE)
  # Heatmap
  library(ggplot2)
  c_heatmap <- ggplot(data = melted_cormat, aes(Var2, Var1, fill = value))+
    geom_tile(color = "white")+
    scale_fill_gradient2(low = "blue", high = "red", mid = "white", 
                         midpoint = 0, limit = c(-1,1), space = "Lab", 
                         name="Pearson\nCorrelation") +
    theme(plot.title = element_text(hjust = 0.5))+ 
    labs(title=c_title, x="Data", y="Data") +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, 
                                     size = 12, hjust = 1))+
    coord_fixed()
  c_heatmap
}

#install.packages("gridExtra")               # Install gridExtra package

  

# p1<-custom_heatmap(as.matrix(station.dists),"Station")
# p2<-custom_heatmap(as.matrix(ozone.dists),"Ozone")
# grid.arrange(p1, p2, ncol = 2)   
