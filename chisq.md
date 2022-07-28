---
title: "Chi Square Test"
author: "James Quinlan"
date: "7/27/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# Introduction

Much research involves qualitative, as opposed to quantitative, data.  In many fields (e.g., business) research studies involve surveys using a Likert ordinal scale.  Sales departments may be interested in customer attitudes and preferences. In medicine, categorial data (e.g., yes/no) is collected to test the efficacy of a vaccination.  A psychologist may be interested in which door a mouse will choose (A, B, or C) based on a stimulus.  In all these cases we are interested in frequency counts among the different categories.

The situations describe above have characteristics of the multinomial  experiment.  Specifically, a multinomial experiements:

1. Consists of $n$ independent and identical trials (iid)
2. Outcomes fall into one of $k$ categories
3. Probability of an observation from a single trial belongs to category $i$, is $p_i$, and remains constant across all trials.
4. The sum of all observation is equal to the total number of trials, i.e., $O_1 + \dots + O_k = n$, where $O_i =$ count of observations in category $i$.  

## Pearson's Chi Square Test Statistic

Given $n$ observations with $k$ categories, each with probability $p_i$ so that $\sum p_i = 1$, the expected number of observations in category $i$ is $E_i = np_i$.  The number of observed counts by category (cells, buckets) is $O_i$, then Pearson's Chi Square Test Statistic is given by
$$
\chi^2 = \sum_{i = 1}^k \frac{(O_i - E_i)^2}{E_i}
$$


## How to use Chi-Square in R?

The function `chisq.test()` is used to test the appropriate hypothesis, that is whether our observations are in line with the expectation.  If our hypothesis is incorrect, the test will imply that the observations could not have occurred by chance.  The first argument of the function `chisq.test()` is the observations (data) and the second argument is a list of probabilities.  If no second argument is supplied, equal probabilities is assumed.  

### Example 

Toss a fair coin 100 times.  Suppose the observations are 54 heads and 46 tails.  We would set up our Chi square test as follows where pH is the probability of Heads and pT is the probability of Tails.

H0: pH = pT = 0.5

```{r}
observed = c(54,46)
chisq.test(observed)
```
In this case, we would NOT reject the null hypothesis.  That is, since the p-value is large (0.4), the evidence does not support the notion that the probabilities are different than 50-50.  




### Example

In this example, we have unequal probabilities.  Therefore, it is necessary to specify and pass that list to the `chisq.test()` function.  


```{r}
observed = c(10,19,32,25)
probabilities = c(0.25,0.25,0.30,0.20)
```

We are testing the null hypothesis:

H0: p1 = 0.25, p2 = 0.25, p3 = 0.30, p4 = 0.20

```{r gof, echo=TRUE}
chisq.test(observed, p = probabilities)
```

R shows the test statistic $\chi^2 = 1$ with 3 degrees of freedom has a p-value less than 0.01.  It is highly unlikely we would observe the frequencies given if the probabilities were as given in the null hypothesis.  Therefore, we would reject the null hypothesis based on the Chi-square test statistic.   


### Degrees of Freedom

If there are $k$ categories, once $k-1$ probabilities are identified, the last one is determined since the sum of probabilities has to be one.  That is, $p_k = 1 - (p_1 + \dots + p_{k-1})$.  This is what is meant by 'degrees of freedom', the research is 'free' to assign $k-1$ probabilities, then the last one is calculated based on those $k-1$ values.  








# Test of Independence

In the examples above, we tested "goodness-of-fit".  When given __bivariate__ data in the form of contingency tables, we use Chi-square test of independence.  The situation is slightly different in a two-way classification. 


The two-way classification has $m \times n$ cells.  The rows (and columns) are associated with factors.  The probability an observation falls into row $i$ and column $j$ is $p_{ij}$.  Because of independence, 
$$ p_{ij} = p_i p_j $$

where the marginal probability (or unconditional probability) $p_i$ is given by the total observations in row $i$ divided by the total number of observations $n$, (similar for $p_j$).  That is, let $r_i = $ row sum of $i$th row and $c_j = j$th column sum.  Then the _expected_ cell count is

$$
E_{ij} = n \frac{r_i}{n}\frac{c_j}{n} = \frac{r_ic_j}{n} .
$$


### Chi-square test statistic
$$
\chi^2 = \sum_{i = 1}^k \frac{(O_{ij} - E_{ij})^2}{E_{ij}}
$$
with degrees of freedom $df = (r-1)(c-1)$.  


The hypothesis tested in this case is:

H0: the two factors are independent




### Example

One thousand residents where sampled to test the efficacy of a COVID-19 vaccination.  The observations were:

|          | No Vaccine | One Shot | Two Shots | Total |
|----------|:----------:|:--------:|:---------:|:-----:|
| COVID    |     24     |     9    |     13    |   46  |
| No COVID |     289    |    100   |    565    |  954  |
| Total    |     313    |    110   |    577    |  1000 |


```{r}
observations = data.frame(No = c(24,289), One = c(9,100), Two = c(13,565), row.names = c("COVID","No COVID"))

chisq.test(observations)
```
The Chi-square test implies contracting COVID-19 depends on the vaccination status.   




