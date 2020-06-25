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

