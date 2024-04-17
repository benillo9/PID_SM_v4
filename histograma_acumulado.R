
n_clases=nclass.Sturges(data_hist$final) #número de clases para el histograma según la regla de Sturges
rang_hist<-diff(range(data_hist$final)) #rango de valores de la nota (desde el mínimo al máximo)
incremento<-rang_hist/n_clases
L1<-min(data_hist$final) #defino el limite inferior del primer intervalo 
L=L1+incremento*(0:n_clases)
#defino función para histograma de frecuencias acumuladas
hist_abs.cum.2=function(x,L,m){
  h=hist(x, breaks=L, right=FALSE, include.lowest=TRUE, plot=FALSE)
  h$density=cumsum(h$density)
  plot(h, freq=FALSE, axes=FALSE, col="lightgray",
       main="Histograma de frecuencias absolutas acumuladas", 
       xlab="Calificación", ylab="")
  axis(1, at=L)
  axis(2,at=seq(0,max(h$density),length.out=m),labels=seq(0,length(x),length.out=m))
}
png('figs/histograma_acumulado.png')#to export the image to figs folder
hist_abs.cum.2(data_hist$final,L,11)




