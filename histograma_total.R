#Histograma de frecuencia absoluta de la nota final para los presentados

n_clases=nclass.Sturges(data_hist$final)-1 #número de clases para el histograma según la regla de Sturges
rang_hist<-diff(range(data_hist$final)) #rango de valores de la nota (desde el mínimo al máximo)
incremento<-rang_hist/n_clases
L1<-min(data_hist$final) #defino el limite inferior del primer intervalo 
L=L1+incremento*(0:n_clases)  #defino los ímites de cada intervalo 
marca1=(L1+L[2])/2#defino la marca de la primera clase 
marca_clase=marca1+incremento*(0:(n_clases-1))#defino las marcas de clase 

Notas_hist=cut(data_hist$final, breaks=L,
               labels=marca_clase,
               right=FALSE)#este comando es para codificar cada nota empleando como etiquetas las marcas de clase
Frec_abs_hist=as.vector(table(Notas_hist)) #Tabla de frecuencias absolutas
Frec_cum_hist=cumsum(Frec_abs_hist)#Tabla de frecuencias acumuladas
frec_rel_hist=Frec_abs_hist/length(data_hist$final) #Tabla de frecuencias relativas
frec_rel_cum_hist=cumsum(frec_rel_hist)#Tabla de frecuencias relativas acumuladas
tabla_frec_hist=data.frame(marca=marca_clase,f.abs=Frec_abs_hist,f.abs.cum=Frec_cum_hist,f.rel=frec_rel_hist,f.rec.cum=frec_rel_cum_hist)#Construimos un data frame con toda la info
tabla_frec_hist
knitr::kable(tabla_frec_hist)#Se muestra la tabla de frecuencias en un formato más recogido
#defino una función para los histogramas de las frecuencias absolutas (segun https://aprender-uib.github.io/AprendeR1/chap-hist.html#sec:hist)
hist_abs=function(x,L){
  if (sum(diff(diff(L)))==0){ 
   h=hist(x, breaks=L, right=FALSE, include.lowest=TRUE,
          xaxt="n", col="lightgreen",
           main="Histograma de frecuencias absolutas",
          xlab="Calificación",ylab="Frecuencias absolutas")
  }
  else {
    h=hist(x, breaks=L, right=FALSE, include.lowest=TRUE,
           axes=FALSE, col="lightgreen",
           main="Histograma de frecuencias absolutas",
           xlab="Calificación",ylab="")
    text(h$mids, h$density/2, labels=h$counts, col="blue", cex=0.75)
  }
  axis(1, at=L)}

#Lo aplico a mis datos
#png('figs/histograma_total.png')
hist_abs(data_hist$final, L)
#hist(data_hist$final,breaks=L,right=FALSE,include.lowest=TRUE, axis(1, at=L), col="lightblue",main="Histograma de frecuencias absolutas", xlab="Marca",ylab="Frecuencias absolutas")

#Diagrama de barras para categorías de notas
Notas_cut=cut(data_hist$final, breaks=c(0,5,7,9,10),
              labels=c("Suspenso","Aprobado","Notable","Sobresaliente"),
              right=FALSE, include.lowest=TRUE) #este comando es para codificar cada nota empleando como etiquetas las marcas de clase
calificaciones=c("Suspenso","Aprobado","Notable","Sobresaliente")
marcas=c(2.5,6,8,9.5) #Marcas de clase
f.abs=as.vector(table(Notas_cut)) #Frecuencias absolutas
f.abs.cum=cumsum(f.abs)  #Frecuencias absolutas acumuladas
f.rel=f.abs/length(data_hist$final) #Frecuencias relativas
f.rel.cum=cumsum(f.rel) #Frecuencias relativas acumuladas
tabla.frec=data.frame(calificaciones, marcas, f.abs, 
                      f.abs.cum, f.rel, f.rel.cum)  #Construimos el data frame
#Construimos un data frame con toda la info

print(tabla.frec)