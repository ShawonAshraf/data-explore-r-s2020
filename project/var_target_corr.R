# hypothesis 2 
## Norms to freq correlation

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)
pacman::p_load(dplyr)

norms_f.ratings <- subset(norms_f, Word %in% freqs$word, select = c(Word, Conc.M, Conc.SD, Percent_known))

# load target ratings from freqs
target.ratings <- subset(freqs, word %in% norms_f.ratings$Word, select = c(word, pos, freq))

# correlate
?correlate

concm <- correlate(norms_f.ratings$Conc.M, target.ratings$freq)
sd <- correlate(norms_f.ratings$Conc.SD, target.ratings$freq)
pk <- correlate(norms_f.ratings$Percent_known, target.ratings$freq)

# Hypothesis 1

# sum up 
pacman::p_load(plyr)

? ddply

win.mean <- ddply(windows, "target", numcolwise(mean))
norm.sub <- subset(norms_f.ratings, Word %in% win.mean$target)
win.mean <- subset(win.mean, target %in% norm.sub$Word)

correlate(win.mean$freq, norm.sub$Conc.M)
correlate(win.mean$lmi, norm.sub$Conc.M)

correlate(win.mean$freq, norm.sub$Conc.SD)
correlate(win.mean$lmi, norm.sub$Conc.SD)

correlate(win.mean$freq, norm.sub$Percent_known)
correlate(win.mean$lmi, norm.sub$Percent_known)
