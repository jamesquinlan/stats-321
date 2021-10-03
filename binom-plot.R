## Binomial Distribution Plot
# Demostrate when the binomial can be approximated by Normal
# Change n and p to explore the distribution plot.
#
# Quinlan, J
# 2021-10-02


n = 30          # <-- Edit
p = 0.1151      # <-- Edit

# Run
success = 0:n
plot(success,dbinom(success,size=n,prob=p),
     type='h',
     main=paste('Binomial Distribution (n=',n,',p=',p,')'),
     ylab='Relative Frequency',
     xlab ='Number of Successes',
     lwd=3)
