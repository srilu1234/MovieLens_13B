#####1
library(ggplot2)
rating = read.csv("ratings.csv", sep = ',', h = TRUE)
rating
count = table(rating$userId)
count
df = data.frame(count)
df
df1 = head(df, 10)
##png(file = "count_rating.png")
#qplot(Var1, Freq, data = df1, main = "plot fot no of ratings per user", xlab = "UserId", ylab = "No_of_Ratings")
barplot(df1$Freq, main ="Plot for number of ratings per User", xlab = "UserId", ylab = "Count of Rating", names.arg = df1$Var1, col = c(rainbow(length(df1$Var1))),las = 1)
dev.off()
library(ggplot2)
######2
m1 <- read.csv("movies.csv")
m2 <- head(m1, n=100)
m2
library(ggplot2)
genreCountPlot <- ggplot(m2, aes(x = reorder(genres, movieId, function(x) -length(x)),fill = genres)) + geom_bar() 
# fix axis
#genreCountPlot <- genreCountPlot + theme(axis.text.x = element_text(angle = 90, hjust = 1))
#genreCountPlot
genreCountPlot <- genreCountPlot + ylab(" count") + xlab("genre")
genreCountPlot <- genreCountPlot + coord_flip()
print(genreCountPlot)
############3,4
data1 <- read.csv('ratings.csv', sep = ',', h = TRUE)
data2 <- read.csv('movies.csv', sep = ',', h = TRUE)

d1 <- merge(data1, data2)

d2 = head(d1, n = 500)
names(d2)
#### TITLE VS UID OF MERGING 
#qplot(title, userId, data = d2, color = title, size = rating, alpha = I(0.7))
##### here have to chnge the tittle w.. year or time
d3 <- subset(d2, data2$genres == "Comedy")
d4 <- subset(d2, data2$genres == "Drama")

d33 = head( d3,1000)
d44 = head(d4,1000)
names(d3)

qplot( rating,title, data = d33, color = title, size = rating, geom = "line", alpha = I(0.7))
qplot( rating,title, data = d44, color = title, size = rating, geom = "line", alpha = I(0.7))

#########5

move_data = read.csv("movies.csv")
sp1 <- strsplit(as.character(move_data$genres),"|", fixed = TRUE)
sp1
MovieGenres = unlist(sp1, recursive = FALSE, use.names = TRUE)
MovieGenres
tb = table(MovieGenres)
tb
df = data.frame(tb)
df
library(ggplot2)
df1 = head(df, 10)
qplot(MovieGenres, Freq, data = df1, ylab ="count", goem = c("point"), size = Freq)
barplot(df$Freq, main ="Genre vs Frequency", names.arg = df$MovieGenres, col = c(rainbow(length(df$MovieGenres))),las = 2)
#####6

x2 = read.csv("ratings.csv")
x22 = head(x2, n= 1297)
t1 = read.csv("tags.csv")
s1 <- merge(x22, t1)
names(s1) 
table(s1$tag)
s1
x3 = head(x2,1000)
qplot(userId,movieId, data = x3, size = rating,geom ="line" ,color = ifelse(rating >= 0 & rating < 1, "red", ifelse(rating >= 1 & rating < 2, "green", ifelse(rating >= 2 & rating < 3, "violet", ifelse(rating >= 3 & rating < 4, "pink", "blue")))) ,alpha = I(0.7))
library(ggplot2)

####
