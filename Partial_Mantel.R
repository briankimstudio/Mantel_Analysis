## Is vegetation related to environment?
library(vegan)
data(varespec)
data(varechem)
veg.dist <- vegdist(varespec) # Bray-Curtis
env.dist <- vegdist(scale(varechem), "euclid")
mantel(veg.dist, env.dist)
mantel(veg.dist, env.dist, method="spear")
x <- rnorm(10)
y <- rnorm(10)
z <- rnorm(10)
M1 <- sqrt(outer(x, x, "-")^2)
M2 <- sqrt(outer(y, y, "-")^2)
M3 <- sqrt(outer(z, z, "-")^2)

res <- mantel.partial(M1, M2, M3, method="pearson", permutations=999)
