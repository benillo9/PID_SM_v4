#defino vector de valores de nota final de los repetidores en 22-23
index<-np22_23$repite=="TRUE"
x<-np22_23$final[index]
m<-mean(x)
s<-sd(x)
c(average=m, sd=s)
#normalizo a la variable  estandarizada
z <- scale(x)
mean(abs(z)<2)

#gráfico quantil-quantil

p <- seq(0.05, 0.95, 0.05)#Start by defining the vector of proportions
sample_quantiles <- quantile(z, p)#To obtain the quantiles from the data
theoretical_quantiles <- qnorm(p)#To obtain the theoretical normal distribution quantiles with the corresponding average and SD
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()#we plot them against each other and draw the identity line