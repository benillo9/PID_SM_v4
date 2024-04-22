#diagramas de pareto a partir de los datos
data_hist%>%ggplot(aes(repite))+geom_bar() #diagrama de barras con los repetidores(TRUE) y los no repetidores(FALSE)
data_hist%>%ggplot(aes(final>=5))+geom_bar()#diagrama de barras con los que aprueban(TRUE) y los que no (FALSE) en ambos años (22-23 y 23-24)
data_hist%>%filter(final>=5)%>%ggplot(aes(repite))+geom_bar()#PAreto de segundo nivel. De los que aprueban cuántos son repetidores (TRUE) y cuántos no (FALSE)
data_hist%>%filter(final>=5)%>%ggplot(aes(curso=="22-23"))+geom_bar()#PAreto de segundo nivel. De los que aprueban cuántos lo hicieron en 22-23(TRUE) y cuántos en el 23-24
data_hist%>%filter(curso=="22-23")%>%ggplot(aes(final>=5))+geom_bar()#Pareto que muestra los que aprueban y los que no del 22-23
data_hist%>%filter(curso=="23-24")%>%ggplot(aes(final>=5))+geom_bar()#Pareto que muestra los que aprueban y los que no del 23-24
png('figs/aprueban_siendo_repetidores22_23.png')
data_hist%>%filter(curso=="22-23",final>=5)%>%ggplot(aes(repite))+geom_bar()#Pareto que muestra de los que aprobaron en 22-23, cuántos eran repetidores
png('figs/aprueban_siendo_repetidores23_24.png')
data_hist%>%filter(curso=="23-24",final>=5)%>%ggplot(aes(repite))+geom_bar()#Pareto que muestra de los que aprobaron en 23-24, cuántos eran repetidores
