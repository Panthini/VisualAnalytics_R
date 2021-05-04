library(ggplot2)
library(ggthemes)

install.packages("RColorBrewer")
library("RColorBrewer")

install.packages("dplyr")
library(dplyr)

#TASK 1

#load the data set
aushealth <- read.csv(file = "F:/Panthini PC/Study MS/Subjects/Sem 2/Visual Analytics/Assignments/Assignment 2/aushealth.csv",
                      header = TRUE, sep = ",")

#finding the most increase and decrease value from 2001 to 2018
year_18 <- c(15.0,11.2,16.4,1.8,4.9,10.6,1.0,20.1,3.8)
year_01 <- c(14.0,11.6,21.0,1.4,3.3,10.0,0.2,9.6,1.6)
difference <- c(year_18 - year_01)
max_diff = max(difference)
min_diff = min(difference)

#plot the bar graph
ggplot(aushealth, aes(x = health_cond, y = prop_population, 
                      fill = factor(year),
                      color = factor(health_cond))) +
        ggtitle('Prop_polutation Vs. health condition') +
        xlab('Health Condition') + 
        ylab('Prop Population') +
        geom_bar(stat = "identity", position = "dodge") +
        scale_fill_manual("legend", values = c("2001" = "pink", "2018" = "grey")) +
        scale_color_manual(values = c("Arthritis" = "NA", "Asthma" = "NA", 
            "Back problems" = "black", "Cancer" = "NA", "Diabetes mellitus" = "NA",
            "Hypertension"= "NA", "Kidney disease" = "NA", "Mental and behavioural problems" = "black", 
            "Osteoporosis" = "NA")) +     
        geom_text(aes(label = prop_population)) +
        annotate(geom = 'text', x = 'Mental and behavioural problems', y = 21,
                 label = 'Most increased Health_cond over time', color = 'red', size = 5) +
        annotate(geom = 'text', x = 'Back problems', y = 22,
           label = 'Most decreased Health_cond over time', color = 'red', size = 5) +
        annotate(geom = 'text', x = 'Arthritis', y = 14, label = '14') +
        annotate(geom = 'text', x = 'Arthritis', y = 15, label = '15') +
        annotate(geom = 'text', x = 'Asthma', y = 11.2, label = '11.2') +
        annotate(geom = 'text', x = 'Asthma', y = 11.6, label = '11.6') +
  annotate(geom = 'text', x = 'Cancer', y = 1.4, label = '1.4') +
  annotate(geom = 'text', x = 'Cancer', y = 1.8, label = '1.8') +
  annotate(geom = 'text', x = 'Diabetes mellitus', y = 4.9, label = '4.9') +
  annotate(geom = 'text', x = 'Diabetes mellitus', y = 3.3, label = '3.3') +
  annotate(geom = 'text', x = 'Hypertension', y = 10, label = '10') +
  annotate(geom = 'text', x = 'Hypertension', y = 10.6, label = '10.6') +
  annotate(geom = 'text', x = 'Kidney disease', y = 1, label = '1') +
  annotate(geom = 'text', x = 'Kidney disease', y = 0.2, label = '0.2') +
  annotate(geom = 'text', x = 'Osteoporosis', y = 1.6, label = '1.6') +
  annotate(geom = 'text', x = 'Osteoporosis', y = 3.8, label = '3.8') +
        theme_base() +
        theme(axis.text.x=element_text(angle = -45, hjust = 0))


