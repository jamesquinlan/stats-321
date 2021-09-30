# Chapter 10 

# 10.21
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
