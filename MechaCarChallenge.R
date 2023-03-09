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

#Part 2: Create Visualizations for the Trip Analysis
