#defino función para histograma de frecuencias relativas 
hist_rel=function(x,L){
  h=hist(x, breaks=L, right=FALSE, plot=FALSE)
  t=round(1.1*max(max(density(x)[[2]]),h$density),2)
  plot(h, freq=FALSE, col="lightgray",
       main="Histograma de frec. relativas y curva de densidad estimada",
       xaxt="n", ylim=c(0,t), xlab="Calificación", ylab="Densidades")
  axis(1, at=L)
  text(h$mids, h$density/2, labels=round(h$counts/length(x),2), col="blue", cex=0.75)
  lines(density(x), col="red", lwd=2)
}
n_clases=nclass.Sturges(data_hist$final)-1
rang_hist<-diff(range(data_hist$final)) #rango de valores de la nota (desde el mínimo al máximo)
incremento<-rang_hist/n_clases
L1<-min(data_hist$final) #defino el limite inferior del primer intervalo 
L=L1+incremento*(0:n_clases)  #defino los ímites de cada intervalo 
png('figs/histograma_relativo.png')
hist_rel(data_hist$final, L)


#defino función para histograma de frecuencias relativas acumuladas
hist_rel.cum=function(x,L){
  h=hist(x, breaks=L, right=FALSE, plot=FALSE)
  h$density=cumsum(h$counts)/length(x) #calculamos las f. relativas
  plot(h, freq=FALSE, main="Histograma de frec. rel. acumuladas\n y 
  curva de distribución estimada", xaxt="n", col="lightgray",
       xlab="Calificación", ylab="Frec. relativas acumuladas")
  axis(1, at=L)
  text(h$mids, h$density/2,labels=round(h$density,2), col="blue", cex=0.75)
  dens.x=density(x)
  dens.x$y=cumsum(dens.x$y)*(dens.x$x[2]-dens.x$x[1]) 
  lines(dens.x,col="red",lwd=2)
}
png('figs/histograma_relativo_acumulado.png')
hist_rel.cum(data_hist$final,L)