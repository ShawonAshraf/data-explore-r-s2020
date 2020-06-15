
### 3. Navarro's book sales


# (a) Load the file booksales.Rdata provided in ILIAS.

load("Data/R/booksales.Rdata")

# Note that the path is relative to the path you defined in your R global options.


# (b) Load the library lsr “Learning Statistics with R”.

# If the library is not installed yet you need to install it first:
install.packages("lsr")

# When the library is installed you can load it:
library("lsr")

# Alternatively to installing and loading the library on the console
# you can use the "Packages" window in RStudio.


# (c) Use who() to check out the available data structures in booksales.

who()


# (d) Find out in which months Navarro sold books.

# The information is available in any.sales.this.month and in sales.by.months.

months[any.sales.this.month]

months[sales.by.month > 0]                                                                                                                      


# (e) How much did Navarro earn in these months? (One book earns him $7.)

sales.by.month * 7                                                                                                                                 

sales.by.month[sales.by.month > 0] * 7

sales.by.month[c(2,3,4)] * 7


# (f) In the months March, April, August and November it rained a lot more than in the other months of the year that Navarro kept track of. Create a binary vector that keeps track of this information.

rain.month <- c(0,0,1,1,0,0,0,1,0,0,1,0)  


# (g) Determine the class variable of rain.month.

class(rain.month)


# (h) We want R to interpret the dimensions of rain.month as binary information on a nominal scale, and not as a numeric vector. Use as.factor to implement this interpretation.

rain.month.factor <- as.factor(rain.month)

class(rain.month.factor)

rain.month.factor


# (i) Make sure that the vectors rain.month, any.sales.this.month, sales.by.month, stock.levels and months are of equal length.

# -> Check the global environment or use who() or use length().


# (i) Create a data frame containing these vectors, with months providing the row names.

navarro.sales <- data.frame(rain.month.factor, any.sales.this.month, sales.by.month, stock.levels, row.names=months)


# (j) Use who(expand = TRUE) to check out the details of the data frame.

who(expand = TRUE)


# (k) Use names to pull out the column names of the data frame.

names(navarro.sales)


# (l) It turns out that there is a mistake in the sales information. Navarro sold 80 books in August. Change the information any.sales.this.month and sales.by.month accordingly, both in the vectors and in the data frame.

any.sales.this.month
any.sales.this.month[8] <- TRUE 
any.sales.this.month

sales.by.month[8] <- 80

navarro.sales$any.sales.this.month[8] <- TRUE
navarro.sales$sales.by.month[8] <- 80


# (m) Save the data frame in your working directory as booksalesNavarro.Rdata, and save the whole global environment as booksalesUpdate.Rdata.

save(navarro.sales, file="Data/R/booksalesNavarro.Rdata")  

save.image(file="Data/R/booksalesUpdate.Rdata")  



### 4. Large-scale file handling


# (a) Counting and preprocessing (examples):

# zcat Data/decow16-freqs.txt.gz | wc
# 24363677 73091031 534290663

# zcat Data/decow16-freqs.txt.gz | awk '$2~/^V/ && $3>10' | wc
#   103202   309606   2147839

# zcat Data/decow16-freqs.txt.gz | awk '$1~/^[a-zäöü]/ && $2~/^V/ {print $1"\t"$3}' | perl sum-over-1-tuples.perl | awk '$2>10' > Data/decow16-freqs_V_10.txt

# wc Data/decow16-freqs_V_10.txt
#    45116    90232    723970


# (a) Load reduced verb frequency file.

decow16.freqs_V_10 <- read.delim("Data/decow16-freqs_V_10.txt", header=FALSE)

# alternative: "Import Dataset From Text" in RStudio Environment window

colnames(decow16.freqs_V_10) <- c("lemma", "freq")


# (b) Load the (original or normalised) particle and base verb vectors that you created in Exercise 1.

load("Exercises/sol_01.RData")


# (c) Create a data frame containing all eight verb vectors, with verbs as rows and nouns/prepositions as columns.

verb.frame <- data.frame(abschminken.all.norm,anfressen.all.norm,aufschaukeln.all.norm,nachkochen.all.norm,schminken.all.norm,fressen.all.norm,schaukeln.all.norm,kochen.all.norm)

verb.frame.t <- as.data.frame(t(verb.frame))


# (c) Provide column names accordingly.

colnames(verb.frame.t) <- c("Kind","Futter","Gesicht","Idee","Suppe","Traum","an","auf","für","in","von")

rownames(verb.frame.t) <- c("abschminken","anfressen","aufschaukeln","nachkochen","schminken","fressen","schaukeln","kochen")


# (d) Merge the frequency and the verb data frames.
# Note that we first need to have a column in both frames with identical column names.

verb.frame.t$lemma <- rownames(verb.frame.t)

verb.frame.t.freq <- merge(verb.frame.t, decow16.freqs_V_10, by="lemma")

  
# Save the new verb frame files:

save(verb.frame, file="verb-frame.Rdata")  
save(verb.frame.t, file="verb-frame-t.Rdata")  
save(verb.frame.t, file="verb-frame-t-freq.Rdata")  

