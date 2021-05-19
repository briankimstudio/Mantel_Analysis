#HOW CAN I PERFORM A MANTEL TEST IN R? | R FAQ

library(ade4)
library(vegan)

# Load data from Web
ozone <- read.table("https://stats.idre.ucla.edu/stat/r/faq/ozone.csv", sep=",", header=T)
# or Load data from local file
#ozone <- read.table("ozone.csv", sep=",", header=T)

# Print data
str(ozone)
head(ozone, n=10)

# Calculate distance matrix for locations
#station.dists <- dist(cbind(ozone$Lon, ozone$Lat)) 
station.dists <- dist(ozone[,c('Lon','Lat')]) # All rows from Lon, Lat columns

# Calculate distance matrix for measurements
ozone.dists <- dist(ozone$Av8top)

# Control matrix
# Create a matrix arbitrarily for demonstration purpose only
c.dists <-  dist(ozone$Av8top * runif(length(ozone$Av8top)))

# Print matrix
as.matrix(station.dists)[1:5, 1:5]
as.matrix(ozone.dists)[1:5, 1:5]
as.matrix(c.dists)[1:5, 1:5]

# Using ade4 package
# Run simple Mantel test
results <- mantel.rtest(station.dists, ozone.dists, nrepet = 9999)
show(results)

# Using vegan package
# Run simple Mantel test
results <- mantel(station.dists, ozone.dists, permutations = 9999)
show(results)

# Run partial Mantel test
results_partial <- mantel.partial(station.dists, ozone.dists, c.dists, permutations = 9999)
show(results_partial)
