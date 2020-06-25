# load the library
library(dplyr)
# use packman as a package manager
install.packages("pacman")

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)

# fiter norms
norms_f <- select(norms, Word, Conc.M, Conc.SD, Percent_known, Dom_Pos)
norms_f <- subset(norms_f, Dom_Pos == "Noun", select = c(Word, Conc.M, Conc.SD, Percent_known))

?select

# get summary of dataframe
summary(norms_f)

# plot
plot(sort(norms_f$Conc.M), main="Mean")
plot(sort(norms_f$Conc.SD), main="STD")
plot(sort(norms_f$Percent_known), main="Percent Known")

