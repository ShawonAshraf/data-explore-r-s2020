# hypothesis 3
# knn

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)
pacman::p_load(dplyr)
pacman::p_load(plyr)
pacman::p_load(class)

# filter words present in both collections
windows.knn <- subset(windows, target %in% norms_f$Word)

# knn on windows.knn
# k = 12

# normalize
# from https://towardsdatascience.com/k-nearest-neighbors-algorithm-with-examples-in-r-simply-explained-knn-1f2c88da405c
nor <-function(x) { 
  (x -min(x))/(max(x)-min(x))   
}

windows.knn.norm.56 <- as.data.frame(lapply(windows.knn[,c(5,6)], nor))
summary(windows.knn.norm)

windows.knn.norm <- windows.knn
windows.knn.norm[5] <- windows.knn.norm.56[1]
windows.knn.norm[6] <- windows.knn.norm.56[2]

# features for knn
features.knn <- windows.knn.norm[c(2,3,4,5,6)]
target.knn <- windows.knn.norm[1]

# knn init
