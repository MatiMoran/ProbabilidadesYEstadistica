# hacemos montecarlo para calcular la integral de la densidad
# de una normal estandar entre 0 y

# probabilidad verdadera
verdadera<-pnorm(1)-pnorm(0)

# generamos una estimacion o aproximacion
ene<-1000
equis<-runif(ene)
promedio<-mean(dnorm(equis))
promedio
# lo repetimos 1000 veces, usando la funcion replicate de R
montecarlomil<-replicate(500,mean(dnorm(runif(ene))))

# hacemos el histograma, superponiendo la recta vertical con
# el valor verdadero
hist(montecarlomil,probability = T)
abline(v=verdadera,col="red",lty=2)

ene<-1000
#replicamos y lo guardamos como una columna en un data frame
montecarlo1000<-data.frame(prom=replicate(500,mean(dnorm(runif(ene)))))

ene<-10000
montecarlo10000<-data.frame(prom=replicate(500,mean(dnorm(runif(ene)))))

ene<-100000
montecarlo100000<-data.frame(prom=replicate(500,mean(dnorm(runif(ene)))))

# Ahora, combinamos los 3 dataframes en uno.  
# Antes de hacerlo, creamos una nueva columna en cada uno
# que sera una variable que identifique de donde vinieron.
# Le agregamos una segunda columna a cada data frame que 
# indique el ene
montecarlo1000$ene<-"mil"
montecarlo10000$ene<-"10mil"
montecarlo100000$ene<-"100mil"

# Combinamos los tres dataframes en uno nuevo que se llama monte
monte <- rbind(montecarlo1000,montecarlo10000,montecarlo100000)

library(ggplot2)

#3 histogramas superpuestos
ggplot(monte, aes(prom, fill = ene)) + 
  geom_histogram(alpha = 0.5, aes(y = ..density..), 
                 bins=25,position = 'identity')+geom_vline(xintercept=verdadera,lty=2)

# 3 graficos de densidad superpuestos, con la recta
# sobre la probabilidad verdadera
ggplot(monte, aes(prom, fill = ene)) + geom_density(alpha = 0.5)+geom_vline(xintercept=verdadera,lty=2)
