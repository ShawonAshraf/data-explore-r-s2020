# load the library
library(dplyr)

windows <- select(freq_lmi, target, pos, context, context_pos, freq, lmi)


# use packman as a package manager
install.packages("pacman")

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)

# get summary of dataframe
summary(windows)

# interquartile range for freq
IQR(windows$freq)

# for lmi
IQR(windows$lmi)

# skew
library(psych)
skew.freq <- skew(windows$freq)
skew.freq


skew.lmi <- skew(windows$lmi)
skew.lmi

# plot
plot(sort(windows$context_pos), main="Context POS")
plot(sort(windows$freq), main="Frequency")
plot(sort(windows$lmi), main="LMI")

