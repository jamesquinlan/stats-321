#' Fisher's Exact Test
#' 
#' Use when n_ip_i < 5 or n_i(1-p_i)<5
#' 
#' Quinlan, J
#' 2021-10-03


#' 10.21 - Sludge is dried sewage and is used as fertilizer.  However, it may 
#' contain high levels of heavy medals.  A new method for detecting and removing
#' Nickel is developed.  A test is to be conducted to compare the old method to
#' the new method.  See page 537 for complete details.  
#' 
#' Treatment    Toxic   Nontoxic    Total
#' New            5        45         50
#' Old            9        41         50
#' ======================================
#' Total         14        86        100

# Use Fisher's test to test the hypothesis that the new treatment produce lower
# proportion of Nickel compared to old treatment at the 5% error level.
# 
# H0: p1 - p2 >= 0  vs. H1: p1 - p2 < 0

data = matrix(c(5,9,45,41), nrow = 2)
fisher.test(data, alternative = "less")

# Note: The alternative hypotesis is "less" than.  The other options for the 
# alternative parameter of the fisher.test function are: "greater" and "two.sided"

# We see the p-value = 0.194 > 0.05.  FAIL to reject H0.  




#' 10.24 Does sexual orientation of the mother have an impact on the sexual 
#' identity of her children?  
#' 
#' Twenty-five children of lesbian mothers and a control group of 21 children
#' of heterosexual single mothers were interviewed in their early twenties
#' regarding their sexual orientation.  The results are given in the table below.
#' Note: 1 child declined the interview, so only 20 are reported.  
#' 
#' Mother       Nonheterosexual        Heterosexual
#' --------------------------------------------------
#' Lesbian           2                     23
#' Heterosexual      0                     20
#' --------------------------------------------------
#' 
#' Is the proportion of young adults identifying as nonhetersexual higher for 
#' lesbian mothers than for heterosexual mothers at the 0.05 level?
#' 
#' NOTE: 0 cell count makes a large sample test impossible.  Thus, use Fisher's 
#' exact test.

data = matrix(c(2,0,23,20), nrow = 2)
fisher.test(data, alternative = "greater")

# CONCLUSION: Fail to reject H0: sexual orientation of the mother makes no difference
# on the child.  In other words, there is not sufficient evidence to conclude that
# the sexual orientation of the mother impacts the child.  