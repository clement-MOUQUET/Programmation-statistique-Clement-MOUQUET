#2
getwd()
#3
setwd("C:/Users/cmouquet/Downloads/dataset")
getwd()
#4
bodies_karts = read.csv("bodies_karts.csv", header = TRUE, sep = ";", dec = "," )
tires = read.csv("tires.csv", header = TRUE , sep = "\t", dec = ",")
gliders = read.csv("gliders.csv", header = TRUE , sep = "|", dec = ".")
drivers = read.csv("drivers.csv", header = TRUE , sep = ";", dec = ",")
#5
dim(bodies_karts)
dim(tires)
dim(gliders)
dim(drivers)

#exercice fonction
#1
summary(drivers)
summary(tires)
summary(bodies_karts)
summary(gliders)
#2
plot(drivers$Weight, drivers$Acceleration, main = "drivers: Weight/Acceleration")
#3
cor(x = drivers$Weight, y =drivers$Acceleration) #réponse: -0,9527271
#4
covarianceXY = cov(x = drivers$Weight, y = drivers$Acceleration)
écartypeX = sd(drivers$Weight)
écartypeY = sd(drivers$Acceleration)
print(covarianceXY/(écartypeX*écartypeY))
#5
correlation_determination=cor(x = drivers$Weight, y =drivers$Acceleration)^2
print(correlation_determination) #réponse: 0.907689 donc très lié
#6
matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)
#Toutes les variables semblent fortement corrélées entre elles.
#7
install.packages("corrplot")
#8
library(corrplot)
corrplot(matriceCor, method="circle")
#9
matriceCorTires = cor(tires[ , - 1])
matriceCorTires = round(matriceCorTires , 2)
View(matriceCorTires)
corrplot(matriceCorTires, method="circle")

matriceCorGliders = cor(gliders[, - 1])
matriceCorGliders = round(matriceCorGliders, 2)
View(matriceCorGliders)
corrplot(matriceCorGliders, method = "circle")

matriceCorBodiesKarts = cor(bodies_karts[, -1])
matriceCorBodiesKarts= round(matriceCorBodiesKarts, 2)
View(matriceCorBodiesKarts)
corrplot(matriceCorBodiesKarts, method = "circle")

#Exercice 3
#1
resultat = drivers[ , c("Driver" , "Weight")]
View(resultat)
#2
resultat = drivers[1:10 , c("Driver" , "Acceleration")]
View(resultat)
#3
resultat = drivers[ , -5 & -7 & -9]
View(resultat)
#4
resultat = drivers[ , -c(2,3)]
View(resultat)
#5
resultat = drivers[ , c("Driver" , "Acceleration", "Weight")]
View(resultat)
#6
resultat = drivers[ c(3,12,32) , ]
View(resultat)
#7
resultat = drivers[ c(32,3,12) , ]
View(resultat)
#8
ordre = order(drivers$Weight)
resultat = drivers[ ordre  , c("Driver", "Weight") ]
View(resultat)
#9
ordrerapide = order(drivers$Acceleration)
resultat = drivers[ ordrerapide  , c("Driver", "Acceleration") ]
View(resultat)
#10
ordrerapidelourd = order(drivers$Acceleration, drivers$Weight, decreasing = c(TRUE,FALSE))
resultat = drivers[ ordrerapidelourd  , c("Driver","Acceleration", "Weight")]
View(resultat)
