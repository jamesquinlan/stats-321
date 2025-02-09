---
title: "Introduction to Probability"
author: "James Quinlan"
date: "8/6/2021"
output: html_document
---

 
 


#### Decisions are made in the presence of uncertainty. 

If the result of every experiment were certain, making decisions would be a whole lot easier.  
__Probability__ is the language of uncertainty.  It is the mechanism for making inferences about a population based on a sample.  




# Probability 

As an initial attempt to define probability, lets say: "_probability_ is the likelihood that an event occurs."  Do you see the problem with this definition?  Therefore, we will need to make this notion clear and precise. To do so, we need to have some foundational material, in particular, __set theory__ (including set enumeration) and $\sigma$-algebras.  


### Set Theory

> A __set__ is an unordered collection of objects, called elements, denoted by curly brackets, {}.

__Example__ 
$S = \{1,2, 3\}$ is a set containing three elements.




### Set Membership

If $A$ is a set, an element in $A$, written $x \in A$.  We say, "$x$ belongs to $A$", or "$x$ is an element of $A$".  If $x$ is not in $A$, we write $x \not\in A$.  
The __empty set__, $\emptyset$ contains no elements.  The __universal set__, $\Omega$ contains _all_ elements.  

The __complement__ of the set $A$ is all elements of the universe not contained in $A$.  Symbolically, 
\[
A^c = \{ x \in \Omega: x \not\in A\}
\]

> __Subset__.  $A \subseteq B$  iff $\forall x \in A, x \in B$.

__Example__: Let $A = \{1, 2, 3\}$ and $B = \{1, 2, 3, 4, 5, 6\}$.  It is easy to see that $A$ is a subset of $B$.  


---

> __Proper Subset__.  $A \subset B$  iff $A \subseteq B$ and $\exists y \in B, y \not\in A$.

In the previous example, in fact, $A$ is a proper subset of $B$.


---


>  Let $A$ and $B$ be sets.  The __union__ of $A$ and $B$ is given by:
\[
A \cup B = \{ x : x \in A \vee x \in B \}
\]





Next we define the set which has elements in common.  That is, given two sets $A$ and $B$, we are interested in the set of elements that belong to both.  In particular, 

>  Let $A$ and $B$ be sets.  The __intersection__ of $A$ and $B$ is given by:
\[
A \cap B = \{ x : x \in A \wedge x \in B \}
\]

---

#### DeMorgan's Laws

\[
(A \cup B)^c = A^c \cap B^c \\
(A \cup B)^c = A^c \cup B^c
\]


These laws can be generalized, given $A_i$ for $i=1, 2, \dots$
\[
\left(\bigcup_i^n A_i\right)^c = \bigcap_i^n A_i^c  \\
\left(\bigcap_i^n A_i\right)^c = \bigcup_i^n A_i^c
\]

---

> Let $X$ be a set.  The __power set__ of $X$ is the set of all subsets of $X$, deonted $\mathcal{P}(X)$


__Example__ Let $X = \{1,2,3\}$, then the power set of $X$ is
\[
\mathcal{P}(X) = \{ \emptyset, \{1\}, \{2\}, \{3\}, \{1,2\}, \{1,3\}, \{2,3\}, X\}
\]

---


> Let $X$ be a set. Then $\mathcal{S} \subseteq \mathcal{P}(X)$ is a __$\sigma$-algebra__  if   
(i) $\emptyset \in \mathcal{S}$,    
(ii) if $A \in \mathcal{S}$, then $A^c \in \mathcal{S}$, and    
(iii) $A_i \in \mathcal{S}$ for $i \in \mathbb{N}$, $\bigcup_{i=1}^\infty A_i \in \mathcal{S}$. 

---

> Let $\Omega$ be a sample space and $\mathcal{S}$ a $\sigma$-algebra on $\Omega$.  A function $P:\mathcal{S} \to [0,1]$ is a __probability measure__ if and only if:   
(i) $P(\Omega) = 1$   
(ii) If $E_1, E_2, \dots \in \mathcal{S}$ such that $E_i \cap E_j = \emptyset$ for $i \ne j$, then  
\[
P\left(\bigcup_{i=1}^\infty E_i\right) = \sum_{i=1}^\infty P(E_i)
\]

---



## Properties of Probability

---

__Theorem__:  $P(A^c) = 1 - P(A)$.   
_Proof_: $\Omega = A \cup A^c$ and $A \cap A^c = \emptyset$.  Therefore, 
\[
1 = P(\Omega) = P(A \cup A^c) = P(A) + P(A^c)
\]
The result follows.

---

__Corrollary__:  $P(\emptyset) = 0$.   
_Proof_: $\Omega^c = \emptyset$, therefore $P(\emptyset) = 1 - P(\Omega)$.  

---


__Theorem__ (Monotone Property):  If $A \subseteq B$, then P(A) \le P(B)$.   
_Proof_: $B$ can be decomposed as $B = A \cup (A^c \cap B)$.  Therefore, $P(B) = P(A) + P(A^c \cap B)$.  Since $P(A^c \cap B) \ge 0$, $P(B) \ge P(A)$.  

---


__Corollary__:  For all $A$, $P(A) \le 1$.   
_Proof_: $A \subseteq \Omega$ and $P(\Omega) = 1$.

---




__Theorem__:  $P(A^c) = 1 - P(A)$.   
_Proof_: 



### 4.2 Finding Probability of an Event

- Experiement
- Event
- Outcome




\[
P(A)
\]


### Read Rdata
<!-- load.Rdata2(filename, path=getwd()) -->  

```{r}
# Basic Syntax
# load.Rdata2(filename, path)
# load.Rdata2(filename, path=getwd())
```



### Probability Distributions

Four probabilitic statements based on distributions:

- The probability density (pdf) at a particular value ```d*```, i.e., $P(X = k)$
- The cumulative distribution (cdf) at value ```p*```, i.e., $P(X \le k)$
- The quantile value corresponding to a probability ```q*```
- A random selection from a distribution ```r*```

The * above represents the distribution.  In particular, 

| Command | Distribution |
|---------|--------------|
| binom   | Binomial     |
| t       | t            |
| pois    | Poisson      |
| f       | F            |
| chisq   | Chi-Square   |


#### Normal Distribution Example
The normal distribution is frequently used.  To calculate the value of the pdf
given by $f(x) = 1/(\sqrt{2 \pi} \sigma) e^{((x - \mu)^2/(2 \sigma^2))}$
at x = 3 where $\mu = 2$ and $\sigma^2 = 25$, i.e., $N(\mu = 2, \sigma^2 = 25)$, 

```{r}
dnorm(x = 3, mean = 2, sd = 5)
```
The probability $P(X \le 3) = \int_{-\infty}^3 f(x) \, dx$ is calculated using:
```{r}
pnorm(q = 3, mean = 2, sd = 5)
```
That is, GIVEN "z-score", $z=3$, find the probability $P(X \le 3)$.



##### Find the quantile value given a 

The quantile for probability 0.975 from standard normal:
```{r}
qnorm(p = 0.975, mean = 0, sd = 1)
```
That is, GIVEN probability, find "z-score".

By default, lower.tail = TRUE (i.e., $P(X \le x)$).  
```{r}
qnorm(p = 0.05, mean = 0, sd = 1, lower.tail = FALSE)
```

Generate a simple random sample of size 10 from standard normal distribution:
```{r}
rnorm(n=10, mean = 0, sd = 1)
```

#### Binomial Probability

```{r}
dbinom(x = 2, size = 2, prob=0.5)
```

Generate random sample from binomial.
```{r}
rbinom(n=10, size=4, prob=0.75)

# Combinatorial Formula 
choose(4,2)
```

Using a binomial distribution, the probability of getting no more than 1 head when flipping
a fair coin twice is, 

```{r}
pbinom(q=1, size = 2, prob=0.5)
```
This can also be computed using the density (or mass) function as:
```{r}
sum(dbinom(0:1,2,0.5))
```


The probability of getting more than 1 head is:
```{r}
pbinom(q=1,size=2, prob=0.5, lower.tail=FALSE)
```


