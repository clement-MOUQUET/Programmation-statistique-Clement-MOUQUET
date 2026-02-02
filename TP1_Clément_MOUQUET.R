#1ere question
iris
class(iris)
#2eme question
View(iris)
#3eme question
nrow(iris)
#4eme question
ncol(iris)
#5eme question
colnames(iris)
#6eme question
summary(iris)
#7eme question
iris[ , c("Sepal.Length","Species")]
#8eme question
iris[ c(100,103,105) , ]
#9eme question
iris[50:100,]
#10eme question
mean(iris$Sepal.Length)
#11eme question
median(iris$Sepal.Length)
#12eme question
sd(iris$Sepal.Length)
#13eme question
quantile(iris$Petal.Width, probs = seq(from = 0.1, to = 0.9, by =0.1))
#exercice 2
#1er question
dfManga = read.csv("C:/users/cmouquet/Downloads/manga.csv", header = TRUE, dec = ".", sep = ",")
dfAnime = read.csv("C:/Users/cmouquet/Downloads/anime.csv", header = TRUE, dec = ".", sep = ",")
#2
View(dfManga)
View(dfAnime)
#3
dim(dfManga)
dim(dfAnime)
#4
mean(dfManga$Score)
mean(dfAnime$Score)
#la moyenne le plus haute est l'anime
#5
sum(dfManga$Vote)
sum(dfAnime$Vote)
#6
sd(dfManga$Score)
sd(dfAnime$Score)
# l'échantillon le plus homogènes au niveau des Score est les mangas
#7
quantile(dfManga$Score, probs = seq(0.1, 0.9, 0.1 ))
quantile(dfAnime$Score, probs = seq(0.1, 0.9, 0.1 )) #c'est l'anime qui a le decile 1 le plus petit 
#filtre mangas
#1
filtre_manga_note = subset(dfManga, Score >9)
nrow(filtre_manga_note) # réponse: 10 mangas
#2
filtre_manga_Vote = subset(dfManga, Vote>= 200000)
nrow(filtre_manga_Vote) #réponse : 12 mangas
#3
filtre_manga_Vote_note = subset(dfManga, Score >8 & Vote > 200000)
nrow(filtre_manga_Vote_note) #réponse : 11 mangas
#4
filtre_manga_note_7_8 = subset(dfManga, Score >=7 & Score <= 8)
nrow(filtre_manga_note_7_8) #réponse: 8038 mangas
#Filtre animes
#1
effectifRating = table(dfAnime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)
#2
filtre_anime_rating = subset(dfAnime, Rating == "R - 17+ (violence & profanity)")
nrow(filtre_anime_rating) #réponse: 1538 animes
#3 
filtre_anime_rating_note = subset(dfAnime, Rating == "R - 17+ (violence & profanity)" & Score > 8)
nrow(filtre_anime_rating_note) #réponse: 326 animes
#4
filtre_anime_notrating = subset(dfAnime, ! Rating == "R - 17+ (violence & profanity)")
nrow(filtre_anime_notrating) #réponse: 8462 animes
#5
filtre_anime_rating_PG = subset(dfAnime, Rating %in% c("PG - Children","G - All Ages"))
nrow(filtre_anime_rating_PG) #réponse: 1510 animes
#6
filtre_anime_notrating_PG = subset(dfAnime, ! Rating %in% c("PG - Children","G - All Ages"))
nrow(filtre_anime_notrating_PG) #réponse: 8490 animes
#7
filtre_anime_note_vote = subset(dfAnime, Score >9 | Vote> 400000)
nrow(filtre_anime_note_vote) #réponse:496 animes
#fonction rbind et write.table
#1
dfAnime = dfAnime[ , c("Title","Score","Vote","Ranked")]
dfManga = dfManga[ , c("Title","Score","Vote","Ranked")]
#2
dfAnime$Type = "Anime"
dfManga$Type = "Manga"
#3
dfConcat = rbind(dfManga,dfAnime)
View(dfConcat)
#4
write.table(x = dfConcat, file = "C:/users/cmouquet/Downloads/ExportTp1.csv",sep = ";",row.names = FALSE)