#install.packages("tidyverse")
#it includes readr, purrr, ggplot2, dplyr. The comand install.packages downloads the package into the local folder and installs it
#Actually, after installing a package once, it will be always on the PC. In the future we must load it only  in each R session
#update.packages(ask=FALSE, checkBuilt=TRUE)#para actualizar los packages
library(tidyverse)#this command loads the package tidyverse 
rm(list=ls())
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
dat5_22_23<-dat5_22_23 %>% rename(`1p_1c`=`1er parcial (primera convocatoria)`,`2p_1c`=`2o parcial (primera convocatoria)`,`1p_2c`=`1er parcial (segunda convocatoria)`, `2p_2c`=`2o parcial (segunda convocatoria)`)
dat5_22_23<-dat5_22_23 %>% mutate(`1p_1c`=as.numeric(`1p_1c`),`2p_1c`=as.numeric(`2p_1c`),`prácticas`=as.numeric(`prácticas`),`total`=as.numeric(`total`),`1p_2c`=as.numeric(`1p_2c`),`2p_2c`=as.numeric(`2p_2c`),`final`=as.numeric(`final`))

dat15_22_23<-read_tsv(fullpath15_22_23,locale=locale(encoding="latin1"))
dat15_22_23<-dat15_22_23 %>% rename(`1p_1c`=`1er parcial (primera convocatoria)`,`2p_1c`=`2o parcial (primera convocatoria)`,`1p_2c`=`1er parcial (segunda convocatoria)`, `2p_2c`=`2o parcial (segunda convocatoria)`)
dat15_22_23<-dat15_22_23 %>% mutate(`1p_1c`=as.numeric(`1p_1c`),`2p_1c`=as.numeric(`2p_1c`),`prácticas`=as.numeric(`prácticas`),`total`=as.numeric(`total`),`1p_2c`=as.numeric(`1p_2c`),`2p_2c`=as.numeric(`2p_2c`),`final`=as.numeric(`final`))


dat5_23_24<-read_tsv(fullpath5_23_24,locale=locale(encoding="latin1"))
dat5_23_24<-dat5_23_24 %>% rename(`1p_1c`=`1er parcial (primera convocatoria)`,`2p_1c`=`2o parcial (primera convocatoria)`,`1p_2c`=`1er parcial (segunda convocatoria)`, `2p_2c`=`2o parcial (segunda convocatoria)`)
dat5_23_24<-dat5_23_24 %>% mutate(`1p_1c`=as.numeric(`1p_1c`),`2p_1c`=as.numeric(`2p_1c`),`prácticas`=as.numeric(`prácticas`),`total`=as.numeric(`total`),`1p_2c`=as.numeric(`1p_2c`),`2p_2c`=as.numeric(`2p_2c`),`final`=as.numeric(`final`))


dat15_23_24<-read_tsv(fullpath15_23_24,locale=locale(encoding="latin1"))
dat15_23_24<-dat15_23_24 %>% rename(`1p_1c`=`1er parcial (primera convocatoria)`,`2p_1c`=`2o parcial (primera convocatoria)`,`1p_2c`=`1er parcial (segunda convocatoria)`, `2p_2c`=`2o parcial (segunda convocatoria)`)
dat15_23_24<-dat15_23_24 %>% mutate(`1p_1c`=as.numeric(`1p_1c`),`2p_1c`=as.numeric(`2p_1c`),`prácticas`=as.numeric(`prácticas`),`total`=as.numeric(`total`),`1p_2c`=as.numeric(`1p_2c`),`2p_2c`=as.numeric(`2p_2c`),`final`=as.numeric(`final`))
