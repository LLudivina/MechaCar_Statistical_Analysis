#Part 1: Linear Regression to Predict MPG
#load package
library(tidyverse)

#Import csv as a Data Frame
MechaCar_mpg <- read.csv(file = "./Resources/MechaCar_mpg.csv")

#view data
view(MechaCar_mpg)

#Perform linear regression using lm() function. 
model <- lm(mpg ~ vehicle_weight + 
     +        vehicle_length + spoiler_angle + ground_clearance +
     +        AWD, data= MechaCar_mpg)

#Use summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(model)

# Part 2: Create Visualizations for the Trip Analysis
#import and read file as a table

#library(tidyverse)
#data(Suspension_Coil, package = 'ggplot2')

#read_csv = read.table('./Resources/Suspension_Coil.csv',sep=',')
#print(read_csv)

library(tidyverse)
Suspension_Coil <- read.csv(file = "./Resources/Suspension_Coil.csv")
View(Suspension_Coil)

#use the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary_tibble <- Suspension_Coil %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
total_summary <- as.data.frame(total_summary_tibble)

#view dataframe
View(total_summary)

#Use group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance,
#and standard deviation of the suspension coil’s PSI column.
lot_summary_tibble <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance=var(PSI), SD=sd(PSI), .groups = 'keep')
lot_summary <- as.data.frame(lot_summary_tibble)

#View lot_summary
View(lot_summary)

#write an RScript using the t.test() function to determine if the PSI across all manufacturing lots 
#is statistically different from the population mean of 1,500 pounds per square inch
t.test(Suspension_Coil$PSI, mu=1500, alternative="two.sided", conf.level = 0.95)

#Write three more RScripts using the t.test() function and its subset() argument to determine 
#if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.
t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == 'Lot1'), mu=1500, alternative="two.sided", conf.level = 0.95)

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == 'Lot2'), mu=1500, alternative="two.sided", conf.level = 0.95)

t.test(subset(Suspension_Coil$PSI,Suspension_Coil$Manufacturing_Lot == 'Lot3'), mu=1500, alternative="two.sided", conf.level = 0.95)
