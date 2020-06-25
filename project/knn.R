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
# k = 13

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
features.knn <- windows.knn.norm[,c(3,4,5,6)]
target.knn <- windows.knn.norm[c(1)]

# convert cat to numeric
features.knn[1] <- as.numeric(features.knn[,1])
features.knn[2] <- as.numeric(features.knn[,2])

target.knn[1] <- as.numeric(target.knn[,1])

# knn init
neighbors <- knn.cv(
  train = features.knn[,1:ncol(features.knn)], 
  cl = target.knn[,1:ncol(target.knn)], 
  k=13)

# norm ratings -> neighbors cosine score correlate
# numeric
norm_f.ratings.numeric <- norms_f.ratings
norm_f.ratings.numeric[1] <- as.numeric(as.factor(unlist(norm_f.ratings.numeric[1])))

# average cosine score for neigbors
words <- norm_f.ratings.numeric$Word
avg.cosine <- c()

for (i in 1:length(words)) {
  t <- words[i]
  sum <- 0.0
  
  for (n in neighbors[i]) {
    n <- as.numeric(n)
    score <- (n * t) / sqrt(t) * sqrt(n)
    sum <- sum + score
  }
  
  avg.cosine <- append(avg.cosine, sum / length(neighbors[i]))
}


# create a dataframe
target.to.avgcos <- as.data.frame(cbind(words, avg.cosine[1:7992]))

# correlation
correlate(norm_f.ratings.numeric$Conc.M, target.to.avgcos$V2)
correlate(norm_f.ratings.numeric$Conc.SD, target.to.avgcos$V2)
correlate(norm_f.ratings.numeric$Percent_known, target.to.avgcos$V2)
