print(tasa_rendimiento)
print(resumen_presentados)
print(resumen_aprobados)
print(resumen_aprobados_repetidores)
print(resumen_aprobados_norepetidores)
print(resumenparciales)


knitr::kable(tabla.frec)
knitr::kable(tabla_frec_hist)


hist_abs(data_hist$final, L)
hist(data_hist$final)

#gráfico densidad para toda la serie de datos
data_hist%>%
  ggplot(aes(final)) +
  geom_density(fill="blue",adjust=1.5)


par(mfrow=c(2,2))#esto es para representar dos figuras al lado una de la otra
hist(vector_np22_23,main="Primer parcial, curso 22-23",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_nsp22_23,main="Segundo parcial, curso 22-23",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_np23_24,main="Primer parcial, curso 23-24",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_nsp23_24,main="Segundo parcial, curso 23-24",xlab="Calificación",ylab="Frecuencias absolutas")
par(mfrow=c(1,1))

hist_abs.cum.2(data_hist$final,L,11)
hist_rel(data_hist$final, L)
hist_rel.cum(data_hist$final,L)

ptr<-data_hist%>%ggplot()+geom_histogram(binwidth=0.95,aes(final))
ptr

grid_arrange_shared_legend(plot_pp_total, arrangeGrob(plot_sp_total+nt, ncol=1), ncol=1, nrow=2)
qplot(theoretical_quantiles, sample_quantiles) + geom_abline()#cuidado pues lo he definido de dos maneras distintas, para dos sets de datos distintos

#diagramas de pareto a partir de los datos
data_hist%>%ggplot(aes(repite))+geom_bar() #diagrama de barras con los repetidores(TRUE) y los no repetidores(FALSE)
data_hist%>%ggplot(aes(final>=5))+geom_bar()#diagrama de barras con los que aprueban(TRUE) y los que no (FALSE) en ambos años (22-23 y 23-24)
data_hist%>%filter(final>=5)%>%ggplot(aes(repite))+geom_bar()#PAreto de segundo nivel. De los que aprueban cuántos son repetidores (TRUE) y cuántos no (FALSE)
data_hist%>%filter(final>=5)%>%ggplot(aes(curso=="22-23"))+geom_bar()#PAreto de segundo nivel. De los que aprueban cuántos lo hicieron en 22-23(TRUE) y cuántos en el 23-24
data_hist%>%filter(curso=="22-23")%>%ggplot(aes(final>=5))+geom_bar()#Pareto que muestra los que aprueban y los que no del 22-23
data_hist%>%filter(curso=="23-24")%>%ggplot(aes(final>=5))+geom_bar()#Pareto que muestra los que aprueban y los que no del 23-24
data_hist%>%filter(curso=="22-23",final>=5)%>%ggplot(aes(repite))+geom_bar()#Pareto que muestra de los que aprobaron en 22-23, cuántos eran repetidores
data_hist%>%filter(curso=="23-24",final>=5)%>%ggplot(aes(repite))+geom_bar()#Pareto que muestra de los que aprobaron en 23-24, cuántos eran repetidores
