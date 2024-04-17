#install.packages("tidyverse")
#it includes readr, purrr, ggplot2, dplyr. The comand install.packages downloads the package into the local folder and installs it
#Actually, after installing a package once, it will be always on the PC. In the future we must load it only  in each R session
#update.packages(ask=FALSE, checkBuilt=TRUE)#para actualizar los packages
library(tidyverse)#this command loads the package tidyverse 
rm(list=ls())
load("workspace_PID_SM.RData")#loading the workspace from the last session of this script
filename5_22_23<-"SM_Grupo_5_22-23.txt"
filename15_22_23<-"SM_Grupo_15_22-23.txt"
filename5_23_24<-"SM_Grupo_5_23-24.txt"
filename15_23_24<-"SM_Grupo_15_23-24.txt"
dir<-"./data"#sets the folder with initial data, using relative path where the point . means the actual working directory
fullpath5_22_23<-file.path(dir,filename5_22_23)
fullpath15_22_23<-file.path(dir,filename15_22_23)
fullpath5_23_24<-file.path(dir,filename5_23_24)
fullpath15_23_24<-file.path(dir,filename15_23_24)
file.copy(fullpath5_22_23,"./rda/SM_Grupo_5_22-23.txt")
file.copy(fullpath15_22_23,"./rda/SM_Grupo_15_22-23.txt")
file.copy(fullpath5_23_24,"./rda/SM_Grupo_5_23-24.txt")
file.copy(fullpath15_23_24,"./rda/SM_Grupo_15_23-24.txt")

dat5_22_23<-read_tsv(fullpath5_22_23,locale=locale(encoding="latin1"))#Importing data separated by tabulations
dat5_22_23<-dat5_22_23 %>% rename(Nombre_Apellidos='Cognoms i nom',Num_matric='Vega. Matri.',Conv_cons='Conv. Cons.',pp_pc='1er parcial (primera convocatoria)',sp_pc='2o parcial (primera convocatoria)',practicas='prácticas',pp_sc='1er parcial (segunda convocatoria)', sp_sc='2o parcial (segunda convocatoria)')
dat5_22_23<-dat5_22_23 %>% mutate(pp_pc=as.numeric(pp_pc),sp_pc=as.numeric(sp_pc),practicas=as.numeric(practicas),`total`=as.numeric(`total`),pp_sc=as.numeric(pp_sc),sp_sc=as.numeric(sp_sc),`final`=as.numeric(`final`))
dat5_22_23<-dat5_22_23 %>%select(Nombre_Apellidos,Num_matric,Conv_cons,pp_pc,sp_pc,pp_sc,sp_sc,practicas)
dat5_22_23<-dat5_22_23 %>%mutate(repite=Num_matric>1,grupo=5,curso="22-23",total=ifelse(pp_pc>=0&is.na(sp_pc),0.375*pp_pc+0.25*practicas,ifelse(is.na(pp_pc)&sp_pc>=0,0.375*sp_pc+0.25*practicas,ifelse(is.na(pp_pc)&is.na(sp_pc),NA,ifelse(pp_pc>=4.5&sp_pc>=4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas,ifelse(0.375*pp_pc+0.375*sp_pc+0.25*practicas>=4.5,4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas))))))
dat5_22_23<-dat5_22_23 %>%mutate(final=ifelse(pp_sc>=0&is.na(sp_sc),0.375*pp_sc+0.25*practicas,ifelse(is.na(pp_sc)&sp_sc>=0,0.375*sp_sc+0.25*practicas,ifelse(is.na(pp_sc)&is.na(sp_sc),NA,ifelse(pp_sc>=4.5&sp_sc>=4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas,ifelse(0.375*pp_sc+0.375*sp_sc+0.25*practicas>=4.5,4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas))))))
dat5_22_23<-dat5_22_23 %>%mutate(final=ifelse(final>=0&is.na(total),final,ifelse(total>=0&is.na(final),total,ifelse(is.na(total)&is.na(final),NA,ifelse(total>final,total,final)))))#se coge como nota final el promedio máximo para la convocatoria complementaria y la extraordinaria
dat5_22_23<-dat5_22_23 %>%mutate(aprobado=ifelse(final>=5,"Si","No"))
##
dat15_22_23<-read_tsv(fullpath15_22_23,locale=locale(encoding="latin1"))
dat15_22_23<-dat15_22_23 %>% rename(Nombre_Apellidos='Cognoms i nom',Num_matric='Vega. Matri.',Conv_cons='Conv. Cons.',pp_pc='1er parcial (primera convocatoria)',sp_pc='2o parcial (primera convocatoria)',practicas='prácticas',pp_sc='1er parcial (segunda convocatoria)', sp_sc='2o parcial (segunda convocatoria)')
dat15_22_23<-dat15_22_23 %>% mutate(pp_pc=as.numeric(pp_pc),sp_pc=as.numeric(sp_pc),practicas=as.numeric(practicas),`total`=as.numeric(`total`),pp_sc=as.numeric(pp_sc),sp_sc=as.numeric(sp_sc),`final`=as.numeric(`final`))
dat15_22_23<-dat15_22_23 %>%select(Nombre_Apellidos,Num_matric,Conv_cons,pp_pc,sp_pc,pp_sc,sp_sc,practicas)
dat15_22_23<-dat15_22_23 %>%mutate(repite=Num_matric>1,grupo=15,curso="22-23",total=ifelse(pp_pc>=0&is.na(sp_pc),0.375*pp_pc+0.25*practicas,ifelse(is.na(pp_pc)&sp_pc>=0,0.375*sp_pc+0.25*practicas,ifelse(is.na(pp_pc)&is.na(sp_pc),NA,ifelse(pp_pc>=4.5&sp_pc>=4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas,ifelse(0.375*pp_pc+0.375*sp_pc+0.25*practicas>=4.5,4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas))))))
dat15_22_23<-dat15_22_23 %>%mutate(final=ifelse(pp_sc>=0&is.na(sp_sc),0.375*pp_sc+0.25*practicas,ifelse(is.na(pp_sc)&sp_sc>=0,0.375*sp_sc+0.25*practicas,ifelse(is.na(pp_sc)&is.na(sp_sc),NA,ifelse(pp_sc>=4.5&sp_sc>=4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas,ifelse(0.375*pp_sc+0.375*sp_sc+0.25*practicas>=4.5,4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas))))))
dat15_22_23<-dat15_22_23 %>%mutate(final=ifelse(final>=0&is.na(total),final,ifelse(total>=0&is.na(final),total,ifelse(is.na(total)&is.na(final),NA,ifelse(total>final,total,final)))))#se coge como nota final el promedio máximo para la convocatoria complementaria y la extraordinaria
dat15_22_23<-dat15_22_23 %>%mutate(aprobado=ifelse(final>=5,"Si","No"))
##
dat5_23_24<-read_tsv(fullpath5_23_24,locale=locale(encoding="latin1"))
dat5_23_24<-dat5_23_24 %>% rename(Nombre_Apellidos='Cognoms i nom',Num_matric='Vega. Matri.',Conv_cons='Conv. Cons.',pp_pc='1er parcial (primera convocatoria)',sp_pc='2o parcial (primera convocatoria)',practicas='prácticas',pp_sc='1er parcial (segunda convocatoria)', sp_sc='2o parcial (segunda convocatoria)')
dat5_23_24<-dat5_23_24 %>% mutate(pp_pc=as.numeric(pp_pc),sp_pc=as.numeric(sp_pc),practicas=as.numeric(practicas),`total`=as.numeric(`total`),pp_sc=as.numeric(pp_sc),sp_sc=as.numeric(sp_sc),`final`=as.numeric(`final`))
dat5_23_24<-dat5_23_24 %>%select(Nombre_Apellidos,Num_matric,Conv_cons,pp_pc,sp_pc,pp_sc,sp_sc,practicas)
dat5_23_24<-dat5_23_24 %>%mutate(repite=Num_matric>1,grupo=5,curso="23-24",total=ifelse(pp_pc>=0&is.na(sp_pc),0.375*pp_pc+0.25*practicas,ifelse(is.na(pp_pc)&sp_pc>=0,0.375*sp_pc+0.25*practicas,ifelse(is.na(pp_pc)&is.na(sp_pc),NA,ifelse(pp_pc>=4.5&sp_pc>=4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas,ifelse(0.375*pp_pc+0.375*sp_pc+0.25*practicas>=4.5,4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas))))))
dat5_23_24<-dat5_23_24 %>%mutate(final=ifelse(pp_sc>=0&is.na(sp_sc),0.375*pp_sc+0.25*practicas,ifelse(is.na(pp_sc)&sp_sc>=0,0.375*sp_sc+0.25*practicas,ifelse(is.na(pp_sc)&is.na(sp_sc),NA,ifelse(pp_sc>=4.5&sp_sc>=4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas,ifelse(0.375*pp_sc+0.375*sp_sc+0.25*practicas>=4.5,4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas))))))
dat5_23_24<-dat5_23_24 %>%mutate(final=ifelse(final>=0&is.na(total),final,ifelse(total>=0&is.na(final),total,ifelse(is.na(total)&is.na(final),NA,ifelse(total>final,total,final)))))#se coge como nota final el promedio máximo para la convocatoria complementaria y la extraordinaria
dat5_23_24<-dat5_23_24 %>%mutate(aprobado=ifelse(final>=5,"Si","No"))
##
dat15_23_24<-read_tsv(fullpath15_23_24,locale=locale(encoding="latin1"))
dat15_23_24<-dat15_23_24 %>% rename(Nombre_Apellidos='Cognoms i nom',Num_matric='Vega. Matri.',Conv_cons='Conv. Cons.',pp_pc='1er parcial (primera convocatoria)',sp_pc='2o parcial (primera convocatoria)',practicas='prácticas',pp_sc='1er parcial (segunda convocatoria)', sp_sc='2o parcial (segunda convocatoria)')
dat15_23_24<-dat15_23_24 %>% mutate(pp_pc=as.numeric(pp_pc),sp_pc=as.numeric(sp_pc),practicas=as.numeric(practicas),`total`=as.numeric(`total`),pp_sc=as.numeric(pp_sc),sp_sc=as.numeric(sp_sc),`final`=as.numeric(`final`))
dat15_23_24<-dat15_23_24 %>%select(Nombre_Apellidos,Num_matric,Conv_cons,pp_pc,sp_pc,pp_sc,sp_sc,practicas)
dat15_23_24<-dat15_23_24 %>%mutate(repite=Num_matric>1,grupo=15,curso="23-24",total=ifelse(pp_pc>=0&is.na(sp_pc),0.375*pp_pc+0.25*practicas,ifelse(is.na(pp_pc)&sp_pc>=0,0.375*sp_pc+0.25*practicas,ifelse(is.na(pp_pc)&is.na(sp_pc),NA,ifelse(pp_pc>=4.5&sp_pc>=4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas,ifelse(0.375*pp_pc+0.375*sp_pc+0.25*practicas>=4.5,4.5,0.375*pp_pc+0.375*sp_pc+0.25*practicas))))))
dat15_23_24<-dat15_23_24 %>%mutate(final=ifelse(pp_sc>=0&is.na(sp_sc),0.375*pp_sc+0.25*practicas,ifelse(is.na(pp_sc)&sp_sc>=0,0.375*sp_sc+0.25*practicas,ifelse(is.na(pp_sc)&is.na(sp_sc),NA,ifelse(pp_sc>=4.5&sp_sc>=4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas,ifelse(0.375*pp_sc+0.375*sp_sc+0.25*practicas>=4.5,4.5,0.375*pp_sc+0.375*sp_sc+0.25*practicas))))))
dat15_23_24<-dat15_23_24 %>%mutate(final=ifelse(final>=0&is.na(total),final,ifelse(total>=0&is.na(final),total,ifelse(is.na(total)&is.na(final),NA,ifelse(total>final,total,final)))))#se coge como nota final el promedio máximo para la convocatoria complementaria y la extraordinaria
dat15_23_24<-dat15_23_24 %>%mutate(aprobado=ifelse(final>=5,"Si","No"))
##full tibble of data
data<-bind_rows(dat5_22_23,dat15_22_23,dat5_23_24,dat15_23_24)




#Tasa de rendimiento. Relación porcentual para un curso académico entre: a) Los créditos superados; b) Los créditos matriculados.
#Tasa de evaluación. Relación porcentual para un curso académico entre: a) Los créditos presentados; b) Los créditos matriculados.
#Tasa de éxito. Relación porcentual para un curso académico entre: a) Los créditos superados; b) Los créditos presentados.


data_by_year<-data%>%group_by(curso)
#data_presentados_by_year<-data_by_year%>%filter(final>=0)#se filtran los datos para tener un nuevo data.frame con los datos de los presentados
dat_superados<-data_by_year%>%filter(final>=0)%>%summarize(n_aprobados=sum(final>=5))
dat_presentados<-data_by_year%>%filter(final>=0)%>%summarize(n_presentados=sum(final>=0))
tasa_rendimiento<-data_by_year%>%summarize(n_matriculados=length(final))%>%mutate(n_aprobados=dat_superados[2],n_presentados=dat_presentados[2])%>%summarize(curso,n_aprobados,n_matriculados,n_presentados,tasa_rendimiento=100*n_aprobados/n_matriculados,tasa_evaluacion=100*n_presentados/n_matriculados,tasa_exito=100*n_aprobados/n_presentados)
summarize(data_by_year,average=mean(final))
data_hist<-data%>%filter(final>=0)#filtra la matriz dde datos a solo los presentados

#notas medias por curso
resumen_presentados<-data_by_year%>%filter(final>=0)%>%summarize(average=mean(final),standard_deviation=sd(final))
resumen_aprobados<-data_by_year%>%filter(final>=5)%>%summarize(average=mean(final),standard_deviation=sd(final))
#notas medias por curso y distinguiendo si repiten o no
numerorep<-data_by_year%>%filter(repite==TRUE)%>%summarize(numero_repetidores=length(final))#numero de repetidores por curso
numerorep_presentados<-data_by_year%>%filter(repite==TRUE,final>=0)%>%summarize(n_presentados=sum(final>=0))
resumen_aprobados_repetidores<-data_by_year%>%filter(final>=5,repite==TRUE)%>%summarize(average=mean(final),standard_deviation=sd(final),n_aprobados_repetidores=length(final))%>%mutate(tasa_rend_repetidores=n_aprobados_repetidores/numerorep[2],tasa_ev_repetidores=100*numerorep_presentados[2]/numerorep[2],tasa_exito_rep=100*n_aprobados_repetidores/numerorep_presentados[2])

numeronorep<-data_by_year%>%filter(repite==FALSE)%>%summarize(numero_norepetidores=length(final))#numero de no repetidores por curso
numeronorep_presentados<-data_by_year%>%filter(repite==FALSE,final>=0)%>%summarize(n_presentados=sum(final>=0))
resumen_aprobados_norepetidores<-data_by_year%>%filter(final>=5,repite==FALSE)%>%summarize(average=mean(final),standard_deviation=sd(final),n_aprobados_norepetidores=length(final))%>%mutate(tasa_rend_norepetidores=n_aprobados_norepetidores/numeronorep[2],tasa_ev_norepetidores=100*numeronorep_presentados[2]/numeronorep[2],tasa_exito_norep=100*n_aprobados_norepetidores/numeronorep_presentados[2])


#notas medias por curso y distinguiendo entre primer y segundo parcial (sin tener en cuenta si fue convocatoria continua, extraordinaria o complementaria)
notasparciales<-data_by_year%>%select(Num_matric,repite,pp_pc,pp_sc,sp_pc,sp_sc,grupo,curso,final)%>%mutate(nota_pp=ifelse(pp_pc>=0&is.na(pp_sc),pp_pc,ifelse(pp_sc>=0&is.na(pp_pc),pp_sc,ifelse(is.na(pp_pc)&is.na(pp_sc),NA,ifelse(pp_pc>pp_sc,pp_pc,pp_sc)))))%>%mutate(nota_sp=ifelse(sp_pc>=0&is.na(sp_sc),sp_pc,ifelse(sp_sc>=0&is.na(sp_pc),sp_sc,ifelse(is.na(sp_pc)&is.na(sp_sc),NA,ifelse(sp_pc>sp_sc,sp_pc,sp_sc)))))
notasparciales<-notasparciales%>%filter(nota_pp>=0&nota_sp>=0)
resumenparciales<-notasparciales%>%summarize(media_pp=mean(nota_pp), desvest_pp=sd(nota_pp),media_sp=mean(nota_sp), desvest_sp=sd(nota_sp))
#notassegundoparcial<-data_by_year%>%select(Num_matric,repite,sp_pc,sp_sc,grupo,curso)%>%mutate(nota_sp=ifelse(sp_pc>=0&is.na(sp_sc),sp_pc,ifelse(sp_sc>=0&is.na(sp_pc),sp_sc,ifelse(is.na(sp_pc)&is.na(sp_sc),NA,ifelse(sp_pc>sp_sc,sp_pc,sp_sc)))))

np22_23<-notasparciales%>%filter(curso=="22-23")
vector_np22_23<-pull(np22_23[9])#vector con las notas del primer parcial en formato numerico para el curso 22-23
vector_nsp22_23<-pull(np22_23[10])#vector con las notas del segundo parcial en formato numerico para el curso 22-23

np23_24<-notasparciales%>%filter(curso=="23-24")
vector_np23_24<-pull(np23_24[9])
vector_nsp23_24<-pull(np23_24[10])

#aquí guardo el workspace de esta script. Esta línea debe ser la última del script
save.image(file="workspace_PID_SM.RData")

print(tasa_rendimiento)
print(resumen_presentados)
print(resumen_aprobados)
print(resumen_aprobados_repetidores)
print(resumen_aprobados_norepetidores)
print(resumenparciales)