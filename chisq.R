#' ---
#' title:  Chi Square
#' author: James Quinlan
#' date:   2021-09-29
#' ---

# Categorical Experiments
#' Experiments that result in categorical data
#' are summarized by frequency counts per category
#' Are these counts expected?
#' 
#' Multinomial Experiment
#' - n identical trials
#' - outcome is one of k categories
#' - Probability of each category is constant, p_i
#' - trials are independent
#' - Sum of observed counts = n

install.packages("vcd")
library(vcd)
data("Arthritis")

library(tidyr)
library(dplyr)

Arthritis
head(Arthritis)
glimpse(Arthritis)
order(Arthritis$Improved)
table(Arthritis$Improved)

# Example: 
# -----------------------
# Given data x and assumed probabilities p
x = c(89,18,12,81)       # Observed Counts
p = c(.41,.1,0.04,0.45)  # Null Probabilities

# Goodness of fit test
chisq.test(x,p)
# -----------------------




# Example: 
# -----------------------
# Test whether all categories are equally likely to occur
# H0 = p_i = 1/5 = 0.2

x = c(47,63,74,51,65)

# Note: p = empty assumes all probabilities equal
chisq.test(x)  

# Conclusion: Do not reject H0.  
# -----------------------



# Example: 
# -----------------------
# Data were collect on 1000 cars driving on the 4 Lane highway.
# 4 Lanes in one direction.  Do drivers prefer a particular Lane(s)?

# H0 = no preference to lane
cardata = c(294,276, 238, 192)
chisq.test(cardata)
# p < 0.5, reject H0.  
# Conclusion: Cars prefer lanes 1 and 2.  
# -----------------------



# Example: 
# -----------------------
# More heart attacks on Monday?
attacks = c(24,36,27,26,32,26,29)
n = sum(attacks)
chisq = chisq.test(attacks)
round(chisq$observed - chisq$expected)
# -----------------------



# Example: 
# -----------------------
# Deaths
deaths = c(43, 76, 85,21,83)
class(deaths)
p_i = c(.15,.21,.18,.14,1-.15-.21-.18-.14)
chisq.test(deaths,p=p_i)
# -----------------------











y = c(82,20,8,90)
chisq.test(x,y)




file_path = "http://www.sthda.com/sthda/RDoc/data/housetasks.txt"
housetasks = read.delim(file_path, row.names = 1)
glimpse(housetasks)
head(housetasks)
housetasks


# Graphical display of contengency tables

#Contingency table can be visualized using the function balloonplot() 
# [in gplots package]. This function draws a graphical matrix where each 
# cell contains a dot whose size reflects the relative magnitude of 
# the corresponding component.

#install.packages("gplots")
library("gplots")
