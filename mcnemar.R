# Chapter 10 


## Ott and Longnecker (2000), p. 537.
## Candidate Preferences.
##  Voter preferences before and after debate.
Preferences =
  matrix(c(28,6,13,28),
         nrow = 2,
         dimnames = list("Before" = c("A", "B"),
                         "After"  = c("A", "B")))
Preferences
mcnemar.test(Preferences)
## => no significant change to reject H0
# }





# 10.23

Speech = matrix(c(1921,16,58,5), 
                nrow = 2, 
                dimnames = list("GMDS" = c("T","F"),
                                "CDHMM" = c("T","F")));Speech


# Switches
n12 = Speech[1,2]
n21 = Speech[2,1]

# Tallys
m = n12 + n21 
n = sum(Speech)


# Z-test can be used?
if (m > 20){
  z = (n12 - n21)/sqrt(n12+n21)
  print(z)
  p = 1-pnorm(z)
  paste("p-value =",p)
}else{
  mcnemar.test(Speech)
}



SEmc = function(n12, n21,n){
  # Calculate the SE for the McNemar Matched Pairs
  # Use to build Confidence Intervals
  SE = (1/n)*sqrt((n12+n21) - (1/n)*(n12-n21)^2)
  return(SE)
}

# Calculate pi_1. and pi_.1
pi_1. = sum(Speech[1,])
pi_.1 = sum(Speech[,1])
SEmc(n12,n21,n)








# 10.21 (Not Matched Pairs)
x1 = 5
x2 = 9
n1 = 50
n2 = 50

# Check the proportions 
x1/n1
x2/n2
# Because x1/n1 < .2
# add 2 to x and 4 to n.

z = 1.96
p1 = (x1+z)/(n1+z^2)
p2 = (x2+z)/(n2+z^2)
p1
p2

s1 = sqrt(p1*(1-p1)/n1)
s2 = sqrt(p2*(1-p2)/n2)

c1L = p1-1.96*s1
c1U = p1+1.96*s1
c1L
c1U


c2L = p2-1.96*s2
c2U = p2+1.96*s2
c2L
c2U





# Fishers Exact Test
data = matrix(c(5,9,45,41),nrow=2)

fish = fisher.test(data, alternative = "less")
fish







# Chi-Squared test for independence
df = data.frame(I=c(15, 8, 1), 
                II=c(32, 29, 20), 
                III=c(18,23,25), 
                IV=c(5, 18, 22))
df
chisq.test(df)
