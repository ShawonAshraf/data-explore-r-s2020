stuttgart <- c(2,10,8,12,15,10,8,11,22,10)
rome <- c(8,15,17,15,18,30,5,12,16,18)

max_stuttgart <- max(stuttgart)
min_stuttgart <- min(stuttgart)

max_rome <- max(rome)
min_rome <- min(rome)


# central tendencies
# stuttgart 
mean.stuttgart <- mean(stuttgart)
median.stuttgart <- median(stuttgart)
variance.stuttgart <- var(stuttgart)
std.stuttgart <- sd(stuttgart)

# rome
mean.rome <- mean(rome)
median.rome <- median(rome)
variance.rome <- var(rome)
std.rome <- sd(rome)

# trimmed mean
trimmed.stuttgart.10 <- mean(stuttgart, trim = .1)
cat("10% difference for Stuttgart = ", mean.stuttgart - trimmed.stuttgart.10)

trimmed.stuttgart.20 <- mean(stuttgart, trim = .2)
cat("20% difference for Stuttgart = ", mean.stuttgart - trimmed.stuttgart.20)

trimmed.rome.10 <- mean(rome, trim = .1)
cat("10% difference for Rome = ", mean.rome - trimmed.rome.10)

trimmed.rome.20 <- mean(rome, trim = .2)
cat("20% difference for Rome = ", mean.rome - trimmed.rome.20)

# range
range.stuttgart <- range(stuttgart)
range.rome <- range(rome)

IQR(stuttgart)                                                                                                                                 
IQR(rome)


quantile(stuttgart, probs=c(.25,.75))                                                                                                          
quantile(rome, probs=c(.25,.75))                                                                                                               

quantile(stuttgart, probs=c(.1,.9))                                                                                                            
quantile(rome, probs=c(.1,.9))

# skewness
library(psych)

skew.stuttgart <- skew(stuttgart)
skew.rom <- skew(rome)

# outliers
sort(stuttgart)                                                                                                                                
sort(rome)   

quantile(stuttgart, probs = c(.1, .9))
quantile(rome, probs = c(.1, .9))

quantile(stuttgart, probs=c(.25,.75))                                                                                                          
quantile(rome, probs=c(.25,.75))   

# data from ex02
load("../ex02/booksales.Rdata")
load("../ex02/booksalesUpdate.Rdata")

# use packman as a package manager
install.packages("pacman")

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)


table(stock.levels)

modeOf(stock.levels)
maxFreq(stock.levels)


summary(stuttgart)
summary(rome)
summary(df$sales.by.month)
