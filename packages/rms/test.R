touch packages/rms/test.R

install.packages("rms")
library(rms)

# Test code from rms file
n <- 1000 # define sample size
set.seed(17) # so can reproduce the results
treat <- factor(sample(c('a','b','c'), n,TRUE))
num.diseases <- sample(0:4, n,TRUE)
age <- rnorm(n, 50, 10)
cholesterol <- rnorm(n, 200, 25)
weight <- rnorm(n, 150, 20)
sex <- factor(sample(c('female','male'), n,TRUE))
label(age) <- 'Age' # label is in Hmisc
label(num.diseases) <- 'Number of Comorbid Diseases'
label(cholesterol) <- 'Total Cholesterol'
label(weight) <- 'Weight, lbs.'
label(sex) <- 'Sex'
units(cholesterol) <- 'mg/dl' # uses units.default in Hmisc
# Specify population model for log odds that Y=1
L <- .1*(num.diseases-2) + .045*(age-50) +
(log(cholesterol - 10)-5.2)*(-2*(treat=='a') +
3.5*(treat=='b')+2*(treat=='c'))
# Simulate binary y to have Prob(y=1) = 1/[1+exp(-L)]
y <- ifelse(runif(n) < plogis(L), 1, 0)
fit <- lrm(y ~ treat + scored(num.diseases) + rcs(age) +
log(cholesterol+10) + treat:log(cholesterol+10))
a <- anova(fit) # Test all factors
b <- anova(fit, treat, cholesterol) # Test these 2 by themselves
# to get their pooled effects
a
b

make test-xenial-rms
make test-bionic-rms
