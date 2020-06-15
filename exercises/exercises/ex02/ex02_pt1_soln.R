# use packman as a package manager
install.packages("pacman")

# load paccman
require(pacman)
library(pacman)

# load lsr
pacman::p_load(lsr)

# use who
?who
who()

# months in which navarro sold books
months.with.book.sales <- months[any.sales.this.month == TRUE]
print(months.with.book.sales)

# earning in these months
earning.from.months.with.sales <- sum(sales.by.month[any.sales.this.month == TRUE])
print(earning.from.months.with.sales)

# rain.month

rain.month <- months == c("March", "April", "August", "November")
print(rain.month)

# class of rain.month
class(rain.month)

# dimensions on a nominal scale
?as.factor

as.factor(rain.month)

# create dataframe
?as.data.frame
df = as.data.frame(cbind(rain.month, any.sales.this.month, sales.by.month, stock.levels), row.names = months)
print(df)

# expand df
who(expand = TRUE)

# column names of df
?names
names(df)

# update info
df$any.sales.this.month[8] <- TRUE
df$sales.by.month[8] <- 80

# save data
save.image(file="booksalesUpdate.Rdata")


# clear env
remove(list = ls())
