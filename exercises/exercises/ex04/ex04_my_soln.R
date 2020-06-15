# 3. Merge the files while making sure that the column names are identical. 
# Keep only those particle verbs in the merged data file whose frequencies are ≥10.


# add column names to the dataframes
colnames(pv) <- c("pv","bv","part")
colnames(freqs) <- c("pv","pv_freq","bv_freq")
colnames(ratings) <- c("pv","rating")

pv_and_freqs = merge(pv, freqs, by=c("pv"))
pv_all = merge(pv_and_freqs, ratings, by=c("pv"))

# freq >= 10
pv_all_10 = subset(pv_all, pv_all$pv_freq >= 10)
save.image(file="pv.Rdata")

### 4. Plot the data frame variables:

plot(sort(pv_all_10$rating), 
     main="pv compositionality ratings", 
     xlab="particle verbs", ylab="mean ratings", 
     ylim=c(1,7), lwd=1.5, col="blue", pch=21, cex=1.2)

hist(sort(pv_all_10$rating), 
     main="pv compositionality ratings", 
     ylab="particle verbs", 
     xlab="mean ratings", 
     xlim=c(1,7), ylim=c(0,25), breaks=20, 
     col="darkgreen", density=30, labels=TRUE)

boxplot(pv_all_10$rating, 
        main="pv compositionality ratings", 
        ylab="mean ratings", ylim=c(1,7), 
        col="orange", whiskcol="brown", 
        staplecol="brown", whisklwd=1.5, staplelwd=3)

plot(pv_all_10$pv_freq, pv_all_10$bv_freq, main = "pv_freq v bv_freq",
     xlab = "pv_freq", ylab = "bv_freq", col="darkgreen")

plot(pv_all_10$pv_freq, pv_all_10$rating, main = "pv_freq v rating",
     xlab = "pv_freq", ylab = "rating", col="darkgreen")

# 5. correlation
cor.pv_freq.rating <- cor(pv_all_10$pv_freq, pv_all_10$rating)
cor.bv_freq.rating <- cor(pv_all_10$bv_freq, pv_all_10$rating)

#6. lin reg models
regression_rating_pvfreq <- lm(formula = rating ~ pv_freq, data = pv_all_10)
regression_rating_bvfreq <- lm(formula = rating ~ bv_freq, data = pv_all_10)
regression_rating_pvbvfreq     <- lm(formula = rating ~ bv_freq + pv_freq, data=pv_all_10)
regression_rating_pvbvfreqpart <- lm(formula = rating ~ bv_freq + pv_freq + part, data=pv_all_10)

summary(regression_rating_pvfreq)
summary(regression_rating_bvfreq)
summary(regression_rating_pvbvfreq)
summary(regression_rating_pvbvfreqpart)
