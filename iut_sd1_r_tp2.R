#1
setwd("C:/Users/cmouquet/Downloads")
df = read.csv(file="fao.csv", header=TRUE, sep = ";", dec=",")
#2
nrow(df) #nombre de ligne
#3
summary(df) #résumé de donné

#exercice 2
#1
mean(df$Dispo_alim, na.rm = TRUE)
#2
sum(df$Population, na.rm = TRUE)
#3
sd(df$Export_viande, na.rm = TRUE)
sd(df$Import_viande, na.rm = TRUE)
#4
median(df$Prod_viande, na.rm = TRUE)
#5
quantile(df$Dispo_alim, na.rm = TRUE)
#6
quantile(df$Import_viande, seq(0,1,0.01))
#Exercice 3
#1
rang = order(df$Population) #order=tri par ordre décroissant par défaut
resultat = head(df[rang, ], n=5)
View(resultat)
#2
rang = order(df$Population, decreasing = TRUE) #decreasing = TRUE: tri croissant
resultat_croissant = head(df[rang, ], n=5)
View(resultat_croissant)
#3
rang = order(df$Prod_viande, decreasing = TRUE)
prod_viande_croissant = head(df[rang, ], n=5)
View(prod_viande_croissant)
#4
rang = order(df$Import_viande, decreasing = TRUE)
Import_viande_croissant = head(df[rang, ], n=5)
View(Import_viande_croissant)

#5
dispo_alim_2300 = subset(df, Dispo_alim>=2300)#subset=tri par condition
View(dispo_alim_2300)
nrow(dispo_alim_2300)
#6
dispo_alim_3500 = subset(df, Dispo_alim>3500 & Import_viande>= 1000 )
View(dispo_alim_3500)
nrow(dispo_alim_3500)
#7
France_Belgique = subset(df, Nom %in% c("France","Belgique"))# condition : Nom %in% c("France", "Belgique") = nom contient france et belgique 
View(France_Belgique)
nrow(France_Belgique)
#Exercice 4
#1
df$Part_export = df$Export_viande/df$Prod_viande
#2
df$Dispo_alim_pays = df$Dispo_alim*df$Population
#3
write.table(x = df, file = "ExportTp2.csv") #write.table permet de crée une fichier 
#4
dispo_alim_mondiale = sum(df$Dispo_alim_pays, na.rm=TRUE)
dispo_alim_mondiale
#5
dispo_alim_mondiale/2300
#Exercice5
#1
plot(x = df$Prod_viande,
     y = df$Export_viande,
     main = "Lien entre export_viande et prod_viande")
#2
cor(x = df$Prod_viande, y = df$Export_viande, use = "complete.obs") #use = "complete.obs" c'est pour enlever les NA
#3
matriceCor = cor(df[ , - 1] , use = "complete.obs")
matriceCor = round(matriceCor , 2)
View(matriceCor)
#5
#commande à executer qu'une seule fois
install.packages("corrplot")
#6
library(corrplot) #je charge mon package pour pouvoir utiliser ses fonctionalités
corrplot(matriceCor, method="circle")