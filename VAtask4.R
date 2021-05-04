#Task 4.1

library(ggplot2)
install.packages("ggmap")
library(ggmap)
library(ggthemes)

#load the data set
crime <- read.csv(file = "F:/Panthini PC/Study MS/Subjects/Sem 2/Visual Analytics/Assignments/Assignment 2/crimedata.csv",
                      header = TRUE, sep = ",")

graph <- c(left = -95.8, bottom = 29.4, right = -95.0, top = 30.0)
map <- get_stamenmap(graph, zoom = 9, source = "stamen")


#Creating spatial density for rape
ggmap(map) +
  stat_density2d(data = subset(crime, offense == 'rape'),
                 aes(x = lon, y = lat, 
                 fill = ..level.., 
                 alpha = ..level..),
                 geom = 'polygon') +
  scale_fill_gradient(low = "yellow", high = "red") +
  scale_alpha_continuous(range = c(0, 0.5)) +
  geom_point(data = subset(crime, offense == 'rape'),
             aes(x = lon, y= lat), size = 0.8) +
  ggtitle('Crime Density of rape in Houston area')


#TASK 4.2

graph1 <- c(left = -95.8, bottom = 29.4, right = -95.0, top = 30.0)
map1 <- get_stamenmap(graph, zoom = 9, source = "stamen")

install.packages("chron")
library(chron)

crime$date <- as.Date(crime$date, "%Y/%m/%d")

Date1 <- as.Date(crime$date, "01/03/2010")
Date2 <- as.Date(crime$date, "30/04/2010")

date1 <- seq.dates(01/03/2010, 30/04/2010, by = "days")
