x <- as.factor(c(0,0,0,0,1,1,1,1,1))
y <- c(1.1650, 0.6268, 0.0751, 0.3516, 0.3035, 2.6961, 1.0591, 2.7971, 1.2641)
ds <- data.frame(y, x)
library(mosaic)
options(digits=3)
favstats(y ~ x, data=ds)
bwplot(y ~ x, data=ds)
t.test(y ~ x, conf.level=0.90, var.equal=TRUE, data=ds)


