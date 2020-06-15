
# Create vectors for Stuttgart and Rome, describing the average temperatures in the two cities for April across 10 years.

stuttgart.temp <- c(2, 10, 8, 12, 15, 10, 8, 11, 22, 10)
rome.temp <- c(8, 15, 17, 15, 18, 30, 5, 12, 16, 18)


# Determine the minimum and maximum values for the two vectors.

max(stuttgart.temp)
max(rome.temp)

min(stuttgart.temp)
min(rome.temp)


# Calculate the following central tendencies and variability measures for the two vectors:

mean(stuttgart.temp)                                                                                                                                
mean(rome.temp)

median(stuttgart.temp)                                                                                                                              
median(rome.temp)

var(stuttgart.temp)                                                                                                                                 
var(rome.temp)

sd(stuttgart.temp)                                                                                                                                  
sd(rome.temp)


# How do the mean values change if you discard (a) 10% or (b) 20% of the largest and smallest observations?

mean(stuttgart.temp, trim=.1)                                                                                                                       
mean(stuttgart.temp, trim=.2)                                                                                                                       

mean(rome.temp, trim=.1)
mean(rome.temp, trim=.2)


# Determine (a) the ranges of the temperature vector values, (b) the interquartile ranges and (c) the ranges disregarding the most extreme 10% values in the two vectors.

range(stuttgart.temp)                                                                                                                               
range(rome.temp)                                                                                                                                    

IQR(stuttgart.temp)                                                                                                                                 
IQR(rome.temp)                                                                                                                                      
# which equals differences between 25th and 75th percentiles:
quantile(stuttgart.temp, probs=c(.25,.75))                                                                                                          
quantile(rome.temp, probs=c(.25,.75))                                                                                                               

quantile(stuttgart.temp, probs=c(.1,.9))                                                                                                            
quantile(rome.temp, probs=c(.1,.9))


# Determine the skewness of the two vectors.

library(psych)                                                                                                                                      

skew(stuttgart.temp)                                                                                                                                
skew(rome.temp)

# Both datasets are positively skewed (i.e., they contain more extremely large than extremely small values).


# How many and which of the values in the vectors are considered as outliers if ...

# ... we assume that the 10% of the lowest and highest values are outliers?

sort(stuttgart.temp)                                                                                                                                
sort(rome.temp)                                                                                                                                     

quantile(stuttgart.temp, probs=c(.1,.9))                                                                                                            
quantile(rome.temp, probs=c(.1,.9))

# -> Stuttgart: 2, 22
# -> Rome: 5, 30

# ... we assume that the values in the first and forth quantile are outliers?

quantile(stuttgart.temp, probs=c(.25,.75))                                                                                                          
quantile(rome.temp, probs=c(.25,.75))                                                                                                               

# -> Stuttgart: 2, 8, 8, 12, 15, 22
# -> Rome: 5, 8, 12, 18, 18, 30


# Load the file booksales.Rdata from Exercise 2.

load("Data/R/booksales.Rdata")


# Use the function 'table' to determine how often the stock.levels were high, low or out.

# 'table' uses the cross-classifying factors to build a contingency table of the counts at each combination of factor levels.
# (not necessary: stock.levels <- as.factor(stock.levels))                                                                                              

stock.levels

table(stock.levels)


# Use R functions to determine the most frequent factor in stock.levels and its frequency.

modeOf(stock.levels)

maxFreq(stock.levels)


# Create or load the data frame navarro.sales from Exercise 2.

load("Data/R/booksalesUpdate.Rdata")


# Summarise the two temperature vectors from above, and the data frame.

summary(stuttgart.temp)

summary(rome.temp)

summary(navarro.sales)


# Provide descriptive summaries for the data frame separately for the months when it rained vs. when it did not rain.

by(navarro.sales, navarro.sales$rain.month.factor, FUN=summary)

