cuisines <- read.csv("data/chefmozcuisine.csv", 
                     fileEncoding = 'UTF-8-BOM'
            )

places <- read.csv("data/geoplaces2.csv")
ratings <- read.csv("data/rating_final.csv")

data.cuisines <- merge(cuisines, places, 
                       by.x = "placeID", 
                       by.y = "placeID")

# 1
data1 <- table(data.cuisines$Rcuisine)
data1 <- data1[data1 > 5]
data1

pie(
  data1, main = "Cuisines Distribution"
)

# 2
data2 <- table(data.cuisines$placeID)

hist(
  data2,
  main = "Cuisines Count Frequency based on Restaurant",
  xlab = "Cuisines Count",
  col = "lightblue"
)

# 3
data3 <- merge(places, ratings, by = "placeID")
data3["average_rating"] <- (data3$rating + data3$food_rating + data3$service_rating) / 3
data3 <- data3[data3$average_rating > 1.2, ]

data3$state = tolower(data3$state)
data3$state <- ifelse(data3$state == "san luis potos" | data3$state == "s.l.p." | data3$state == "san luis potosi", "slp", data3$state)

data <- table(data3$state, data3$average_rating)
data <- t(data)
data

barplot(data, 
        beside = TRUE, 
        col = rainbow(nrow(data)),
        main  = "Average Rating",
        xlab = "State"
)

data

legend("top", rownames(data), fill = rainbow(nrow(data)), cex = 0.5)

#####################################

data.cuisines <- data.cuisines[data.cuisines$franchise == "f",]
data.cuisines <- data.cuisines[data.cuisines$other_services  == "none", ]
data.cuisines <- data.cuisines[data.cuisines$country  != "?", ]
data.cuisines$Rcuisine  <- gsub("_",  " ", data.cuisines$Rcuisine)

# Apriori
trans <-split(data.cuisines$Rcuisine, data.cuisines$placeID)
trans

library(arules)

freq <- apriori(trans,
                parameter = list(supp = 0.008,  
                                target = "frequent itemsets"))
inspect(freq)

rules <- ruleInduction(freq, confidence = 0.8)
inspect(rules)
