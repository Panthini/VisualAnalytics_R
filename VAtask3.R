
#TASK 3.1

install.packages("tidyverse")
library(forcats)
library(plyr)

#load the dataset
grandslam <- read.csv(file = "F:/Panthini PC/Study MS/Subjects/Sem 2/Visual Analytics/Assignments/Assignment 2/grandslamdata.csv",
                      header = TRUE, sep = ",") 

#create columns called freqency based on winners of all tournaments
frequency = count(grandslam, "winner")
top_ten <- frequency[1:10, ]

#ordering the frequency in descending order
f=factor(frequency$winner)
levels(f) = rev(levels(f))
newFreq <- head(frequency[order(frequency$freq, as.character(f), 
                                decreasing = TRUE), ], 10)


#plotting the bar graph
ggplot(newFreq, aes(x = reorder(winner, -freq), y = freq, fill = factor(winner))) + 
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle('Top 10 Tennnis Players',
          subtitle = 'across all the tournaments') +
  xlab('Top 10 winners') + 
  ylab('Frequency') +
  theme_bw() +
  geom_text(aes(label = freq)) + 
  theme(axis.text.x=element_text(angle = -45, hjust = 0))


#TASK 3.2
#creating data frame for U.S.Open
USOpen <- subset(grandslam, tournament == 'U.S. Open')

#creating data frame for AU Open
AUOpenGen <- subset(grandslam, tournament == 'Australian Open')
AUOpenDec <- subset(grandslam, tournament == 'Australian Open (Dec)')
AUOpenJan <- subset(grandslam, tournament == 'Australian Open (Jan)')
AUOpen1 <- rbind(AUOpenGen, AUOpenDec)
AUOpen <- rbind(AUOpen1, AUOpenJan)

#creating data frame for French_Open
French_Open <- subset(grandslam, tournament == 'French Open')

#creating data frame for Wimbledon
Wimbledon <- subset(grandslam, tournament == 'Wimbledon')

###################################################################################

#U.S. OPEN
#creating top 10 winners based on frequency 
freq_US = count(USOpen, "winner")
top_ten_US <- freq_US[1:10, ]

#ordering the frequency in descending order
f_US=factor(freq_US$winner)
levels(f_US) = rev(levels(f_US))
newFreq_US <- head(freq_US[order(freq_US$freq, as.character(f_US), 
                                 decreasing = TRUE), ], 10)

#Plotting the graph for U.S.Open
A <- ggplot(newFreq_US, aes(x = reorder(winner, -freq), y = freq, fill = factor(winner))) +
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle('Top 10 Tennnis Players',
          subtitle = 'from U.S.Open') +
  xlab('Top 10 winners') + 
  ylab('Frequency') +
  theme_classic() +
  geom_text(aes(label = freq)) + 
  theme(axis.text.x=element_text(angle = -45, hjust = 0))

####################################################################################

#AU OPEN
#creating top 10 winners based on frequency 
freq_AU = count(AUOpen, "winner")
top_ten_AU <- freq_AU[1:10, ]

#ordering the frequency in descending order
f_AU=factor(freq_AU$winner)
levels(f_AU) = rev(levels(f_AU))
newFreq_AU <- head(freq_AU[order(freq_AU$freq, as.character(f_AU), 
                                 decreasing = TRUE), ], 10)

#Plotting the graph for AU Open
B <- ggplot(newFreq_AU, aes(x = reorder(winner, -freq), y = freq, fill = factor(winner))) + 
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle('Top 10 Tennnis Players',
          subtitle = 'from AU Open') +
  xlab('Top 10 winners') + 
  ylab('Frequency') +
  theme_classic() +
  geom_text(aes(label = freq)) + 
  theme(axis.text.x=element_text(angle = -45, hjust = 0))

###################################################################################

#French OPEN
#creating top 10 winners based on frequency 
freq_F = count(French_Open, "winner")
top_ten_F <- freq_F[1:10, ]

#ordering the frequency in descending order
f_F=factor(freq_F$winner)
levels(f_F) = rev(levels(f_F))
newFreq_F <- head(freq_F[order(freq_F$freq, as.character(f_F), 
                               decreasing = TRUE), ], 10)

#Plotting the graph for French Open
C <- ggplot(newFreq_F, aes(x = reorder(winner, -freq), y = freq, fill = factor(winner))) +
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle('Top 10 Tennnis Players',
          subtitle = 'from French Open') +
  xlab('Top 10 winners') + 
  ylab('Frequency') +
  theme_classic() +
  geom_text(aes(label = freq)) + 
  theme(axis.text.x=element_text(angle = -45, hjust = 0))

####################################################################################
#Wimbledon OPEN
#creating top 10 winners based on frequency 
freq_W = count(Wimbledon, "winner")
top_ten_W <- freq_W[1:10, ]

#ordering the frequency in descending order
f_W=factor(freq_W$winner)
levels(f_W) = rev(levels(f_W))
newFreq_W <- head(freq_W[order(freq_W$freq, as.character(f_W), 
                               decreasing = TRUE), ], 10)

#Plotting the graph for Wimbledon Open
D <- ggplot(newFreq_W, aes(x = reorder(winner, -freq), y = freq, fill = factor(winner))) +
  geom_bar(stat = "identity", position = "dodge") + 
  ggtitle('Top 10 Tennnis Players',
          subtitle = 'from Wimbledon Open') +
  xlab('Top 10 winners') + 
  ylab('Frequency') +
  theme_classic() +
  geom_text(aes(label = freq)) + 
  theme(axis.text.x=element_text(angle = -45, hjust = 0))

###################################################################################

install.packages("ggpubr")
library(ggpubr)
install.packages("cowplot")
library(cowplot)

#combining all bar graphs in one frame
ggarrange(A, B, C, D,
          labels = c(" ", " ", " ", " "),
          ncol = 2, nrow = 2)
