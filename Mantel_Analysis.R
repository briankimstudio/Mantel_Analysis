#HOW CAN I PERFORM A MANTEL TEST IN R? | R FAQ

install.packages("ade4")
library(ade4)

# Load data
ozone <- read.table("https://stats.idre.ucla.edu/stat/r/faq/ozone.csv", sep=",", header=T)

# Print data
head(ozone, n=10)

# Calculate distance matrix for locations
station.dists <- dist(cbind(ozone$Lon, ozone$Lat)) 

# Calculate distance matrix for measurements
ozone.dists <- dist(ozone$Av8top)

# Print matrix
as.matrix(station.dists)[1:5, 1:5]
as.matrix(ozone.dists)[1:5, 1:5]

# Run Mantel test
results <- mantel.rtest(station.dists, ozone.dists, nrepet = 9999)
mantel(station.dists, ozone.dists, permutations = 9999)
plot()
show(results)

#Vegan package
library(vegan)

## Is vegetation related to environment?
data(varespec)
data(varechem)
veg.dist <- vegdist(varespec) # Bray-Curtis
env.dist <- vegdist(scale(varechem), "euclid")
mantel(veg.dist, env.dist)
mantel(veg.dist, env.dist, method="spear")

