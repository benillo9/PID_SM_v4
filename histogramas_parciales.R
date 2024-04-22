png('figs/histograma_parciales_cursos.png')
par(mfrow=c(2,2))#esto es para representar dos figuras al lado una de la otra
hist(vector_np22_23,main="Primer parcial, curso 22-23",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_nsp22_23,main="Segundo parcial, curso 22-23",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_np23_24,main="Primer parcial, curso 23-24",xlab="Calificación",ylab="Frecuencias absolutas")
hist(vector_nsp23_24,main="Segundo parcial, curso 23-24",xlab="Calificación",ylab="Frecuencias absolutas")
#png('figs/histograma_primer_parcial_22-23.png')
#png('figs/histograma_primer_parcial_23-24.png')
#hist(vector_np23_24)
par(mfrow=c(1,1))


#Lo hago con otro tipo de formato más limpio

#notasparciales <- notasparciales%>% 
#  mutate(group = case_when(
#    repite %in% c("TRUE") ~ "Repite",
#    repite %in% c("FALSE") ~ "No repite"))
#notasparciales <- notasparciales%>% 
#  mutate(group = factor(group, levels = c("Repite", "No repite")))
#Para el primer parcial
png('figs/histograma_primer_parcial_cursos.png')
notasparciales%>%
  ggplot(aes(nota_pp)) +
  geom_histogram(binwidth = 1, color = "black") +
  facet_grid(repite~curso)

#Para el segundo parcial
png('figs/histograma_segundo_parcial_cursos.png')
notasparciales%>%
  ggplot(aes(nota_sp)) +
  geom_histogram(binwidth = 1, color = "black") +
  facet_grid(repite~curso)


#Diagramas de cajas y bigotes
png('figs/cajasybigotes.png')
notasparciales%>%
  mutate(curso = factor(curso),repite = factor(repite)) %>%
  ggplot(aes(curso, final, color = repite)) +
  geom_boxplot() +
  #theme(axis.text.x = element_text(angle = 90, hjust = 1)) +
  theme(aspect.ratio = 1)+
  xlab("") 

png('figs/densidades_estratificadas.png')
notasparciales%>%
  mutate(curso = factor(curso),repite = factor(repite))%>%
  ggplot(aes(final,y=..count.., fill = repite)) +
  geom_density(alpha = 0.2,bw=0.75) + 
  facet_grid(curso ~ .)
