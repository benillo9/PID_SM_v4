
library(ggthemes)
library(ggrepel)
library(gridExtra)
library(devtools)
library(lemon)
png('figs/aprobadosprimer_y_final.png')

#gráfico del primer parcial-total
plot_pp_total<- notasparciales%>%ggplot(aes(nota_pp,final))
 
plot_pp_total<-plot_pp_total +   
  geom_vline(xintercept = 4.5,lty = 1, color = "black") +
  geom_hline(yintercept = 5,lty = 1, color = "black") +
  geom_point(aes(shape=repite,col=curso), size = 3) +
    xlab("Calificación primer parcial") + 
  ylab("Calificación final") +
  ggtitle("Aprobados 1er parcial - Aprobados asignatura") + 
    scale_color_manual(values = c("#00AFBB", "#FC4E07"))+
  scale_shape_manual(values = c(16,17))+
  theme_classic()+coord_fixed(ratio = 1)

#gráfico del segundo parcial-total
plot_sp_total<- notasparciales%>%ggplot(aes(nota_sp,final))

plot_sp_total<-plot_sp_total +   
  geom_vline(xintercept = 4.5,lty = 1, color = "black") +
  geom_hline(yintercept = 5,lty = 1, color = "black") +
  geom_point(aes(shape=repite,col=curso), size = 3) +
  xlab("Calificación segundo parcial") + 
  ylab("Calificación final") +
  ggtitle("Aprobados 2o parcial - Aprobados asignatura") + 
  scale_color_manual(values = c("#00AFBB", "#FC4E07"))+
  scale_shape_manual(values = c(16,17))+
  theme_classic()+ coord_fixed(ratio = 1)
#para mostrar las dos gráficas con una leyenda única (pues es la misma para ambas)
nt <- theme(legend.position='none')
grid_arrange_shared_legend(plot_pp_total, arrangeGrob(plot_sp_total+nt, ncol=1), ncol=1, nrow=2)

#grid.arrange(plot_pp_total, plot_sp_total, ncol = 2)