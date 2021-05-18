#HOW CAN I PERFORM A MANTEL TEST IN R? | R FAQ

library(ade4)

# Load data
ozone <- read.table("https://stats.idre.ucla.edu/stat/r/faq/ozone.csv", sep=",", header=T)

# Print data
str(ozone)
head(ozone, n=10)

# Calculate distance matrix for locations
station.dists <- dist(cbind(ozone$Lon, ozone$Lat)) 

# Calculate distance matrix for measurements
ozone.dists <- dist(ozone$Av8top)

library(ggplot2)
library(reshape2)
melted_cormat <- melt(as.matrix(station.dists))
head(melted_cormat)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()

melted_cormat <- melt(as.matrix(ozone.dists))
head(melted_cormat)
ggplot(data = melted_cormat, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()

# Print matrix
as.matrix(station.dists)[1:5, 1:5]
as.matrix(ozone.dists)[1:5, 1:5]

# Run Mantel test
results <- mantel.rtest(station.dists, ozone.dists, nrepet = 9999)
show(results)