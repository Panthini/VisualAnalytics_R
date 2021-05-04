#TASK 2.1

library(ggplot2)
library(ggthemes)

install.packages("RColorBrewer")
library("RColorBrewer")

install.packages("dplyr")
library(dplyr)

#load the data set
bigstocks <- read.csv(file = "F:/Panthini PC/Study MS/Subjects/Sem 2/Visual Analytics/Assignments/Assignment 2/bigstocks.csv",
                      header = TRUE, sep = ",")

#changing the date format
bigstocks$date <- as.Date(bigstocks$date, "%d/%m/%Y")

#subsetting the top 4 companies
big4comp <- subset(bigstocks, company == 'Apple' |
                     company == 'Amazon' | 
                     company == 'Google' | 
                     company == 'Facebook')

#plotting the line graph
ggplot(big4comp, aes(x = date, y = close_price,
                     fill = factor(company),
                     color = factor(company))) +
  ggtitle('Shares performance of big 4 company over time') +
  xlab('Time') +
  ylab('Share Price') +
  geom_line() +
  scale_color_manual(values = c("Apple" = "orange", "Amazon" = "purple",
                                "Google" = "red", "Facebook" = "blue")) +
  theme_bw() 


#TASK 2.2

library(plyr)

#changing the date format
bigstocks$date <- as.Date(bigstocks$date, "%d/%m/%Y")

#create seperate column for Year to get data of year 2013 to 2015
big4comp$year = as.numeric(format(big4comp$date, "%Y"))

#subsetting the top 4 companies based on year 2013 to 2015
big4comp_2 <- subset(big4comp, year == '2013' |
                       year == '2014' | 
                       year == '2015' ) 

#specify the median value
meds <- ddply(big4comp_2, .(company), summarise, med = median(volume))

#plotting the graph
ggplot(big4comp_2, aes(x = company, y = volume),
       color = factor(company)) +
  ggtitle('Distribution of Share Volume of big 4 companies',
          subtitle = 'Traded between 2013 and 2015') +
  geom_boxplot(col=c('orange', 'black', 'orange', 'orange')) +
  scale_color_manual(values = c("Apple" = "orange", "Google" = "NA", 
                                "Facebook" = "NA", "Amazon" = "NA")) +
  geom_text(data = meds, aes(x = company, y = med, label = med), 
            size = 3, vjust = -0.5) +
  theme_classic()