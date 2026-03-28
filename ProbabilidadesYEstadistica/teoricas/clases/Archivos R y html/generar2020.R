###########################################################
#
#  Ejemplo 1: Tiramos dos dados, queremos aproximar via 
#    simulaciones, la probabilidad de que la suma de 8
#
###########################################################

# Queremos  simular la tirada de dos dados. Para ello, usamos 
# el comando "sample".
# sample() es una de las primeras funciones relevantes para 
# simular. Para saber que hace esta funcion, basta tipear

?sample

# en la consola de comandos, y ver que se abre en la ventana
# del help.
# Aparece un monton de informacion.
  
# sample toma hasta 4 argumentos, aunque solo el primero, x es 
# fundamental.  

#  "x"    es el vector de elementos del cual uno
#         quiere samplear (obtener observaciones).
#  "size" es el numero de observaciones que uno quiere
#         obtener.
# "replace" determina si uno está muestreando con o sin 
#         reposicion 
#          (replace = TRUE para muestrear con reposicion).
#  "prob" es un vector de pesos o probabilidades asociadas a
#          x. Deberia ser positivo y sus coordenadas sumar 1.

# Para obtener un numero aleatorio entre 1 y 10 inclusive,

sample(x = 1:10,size = 1)

# Cada vez que corremos la instruccion, obtenemos un resultado
# (potencialmente) distinto

sample(x = 1:10,size = 1)

# Para obtener dos tiros del dado, hacemos
  
sample(x = 1:6, size = 2, replace = TRUE) # tiramos dos dados

# Cada vez que corremos la instruccion, obtenemos un resultado
# distinto

sample(x = 1:6, size = 2, replace = TRUE) 
sample(x = 1:6, size = 2, replace = TRUE) 


# Guardamos el resultado en un vector, que se llama "dados"
dados <- sample(x = 1:6, size = 2, replace = TRUE)

# Vemos cuanto salio
dados

# Ahora, cada vez que nos refiramos a "dados" estaremos
# trabajando con estos valores

# Veamos cuanto da la suma de los valores

sum(dados)

# Armemos la indicadora de exito, o sea, una funcion
# que valga 1 (o TRUE) si la suma es 8, y 0 (FALSE) sino

sum(dados) == 8 # chequeamos si fuimos exitosos
# (equivale a la indicadora de exito)

# Ahora replicamos el codigo de arriba 20 veces.
# Para eso, creamos un vector donde guardar los resultados,
# inicialmente un vector con 20 ceros
resultados <- rep(0,20)

# El "for" es una instruccion sencilla de ciclo (loop). 
# Comienza con el contador, (i en este caso) en el primer 
# valor (i=1 en nuestro caso). Luego realiza lo que esta 
# entre llaves, y cuando termina, aumenta el contador en una 
# unidad (i=2) y vuelve a repetir la expresion que esta entre
# llaves. Entre llaves le estamos pidiendo que repita 
# tirar dos veces un dado, sumarlos, chequear si vale 8 y 
# anotar la indicadora de exito en la coordenada 
# correspondiente del vector resultados.

for(i in 1:20){ 
  dados <- sample(x = 1:6, size = 2, replace = TRUE) 
  resultados[i] <- sum(dados) == 8
}

resultados
mean(resultados)  # frecuencia empirica o proporcion observada


# La verdadera probabilidad que queremos aproximar.
# Sea A = {(2,6),(3,5),(4,4),(5,3),(6,2)}
# P(A) = 5/36 = 0.1388889 
5/36   

# Aumentamos el tamaño de muestra a 100000, y repetimos
n <- 100000
resultados <- rep(0,n)

for(i in 1:n){ 
  dados <- sample(x = 1:6, size = 2, replace = TRUE) 
  resultados[i] <- sum(dados) == 8
}

mean(resultados)  


#############################################################
#
#    Ejemplo 2: de los cumpleaños (ejercicio practica 1)
#
#############################################################

# Se elige un grupo de r personas al azar y se les pregunta 
# su fecha de cumpleaños. Si bien los años no son todos 
# iguales en longitud, y se sabe que los porcentajes de 
# nacimientos no son constantes a traves del año, como una 
# primera aproximacion podemos suponer que una eleccion al 
# azar de personas es equivalente a realizar una seleccion al 
# azar de las fechas de nacimientos y ademas considerar que 
# el año tiene 365 dias. Bajo estas hipotesis, calcular
# la probabilidad de que entre las r personas elegidas al azar 
# todas tengan distintas fechas de cumpleaños. 
# Llamemos A_r al evento de interes.
# P(A_r) =365!/(365^r * (365-r)! )
# para r=23, P(A_r) = 0.4927
# para r=30, P(A_r) = 0.29368


# Podemos armar una muestra de 23 cumpleaños, como antes P(A_r)
# nos interesa.

sample(x = 1:365, size = 23, replace = TRUE)

# Interesa ver si se repiten.
# Para hacer esto, necesitamos poder determinar si todos los 
# elementos en un vector son únicos. R tiene muchas, muchas 
# funciones que pueden usarse con vectores. Para la mayoría 
# de las cosas que uno quiera hacer, habrá una función R que 
# lo haga. En este caso, es anyDuplicated (), que devuelve 
# la ubicación del primer duplicado si hay alguno, y cero 
# en caso contrario.
# 
# Lo importante para  aprender de esto no es necesariamente 
# esta función en particular, sino el hecho de que la mayoría 
# de las tareas son posibles a través de algunas funciones 
# que se pueden googlear.

cumples <- sample(x = 1:365, size = 23, replace = TRUE)
anyDuplicated(cumples)
cumples


# Repetimos primero 20 veces
resultcumples  <- rep(0,20)
for(i in 1:20){ 
  cumples <- sample(x = 1:365, size = 23, replace = TRUE)
  resultcumples[i] <- anyDuplicated(cumples)
}

resultcumples

# calculamos la indicadora de exito
resultcumples==0

# y contamos la proporción de exitos en las repeticiones
mean(resultcumples==0)   # proporción de ceros en resultcumples

# Finalmente lo repetimos 100000 veces.
n <- 100000
resultcumples  <- rep(0,n)
for(i in 1:n){ 
  cumples <- sample(x = 1:365, size = 23, replace = TRUE)
  resultcumples[i] <- anyDuplicated(cumples)
}
mean(resultcumples==0)   # estimacion de P(A_r)

# para r=23, P(A_r) = 0.4927

#####################
# Lo podemos hacer para r=30

n <- 100000
resultcumples  <- rep(0,n)
for(i in 1:n){ 
  cumples <- sample(x = 1:365, size = 30, replace = TRUE)
  resultcumples[i] <- anyDuplicated(cumples)
}
mean(resultcumples==0)   # estimacion de P(A_r)

# tambien puede hacerse usando la instruccion replicate() 
# del R, que reemplaza al for

resultsimulacion<-replicate(100000,{ 
  cumples <- sample(x = 1:365, size = 30, replace = TRUE)
   anyDuplicated(cumples)
})
mean(resultsimulacion==0)

# para r=30, P(A_r) = 0.29368


# Ventajas? Por ejemplo, con datos de nacimientos, podemos 
# levantar con este metodo el supuesto de que las fechas son 
# equiprobables. E incorporar el 29 de febrero! 
# Podemos aproximar probabilidades mas dificiles de calcular.
# Una buena fuente: https://mathstat.slu.edu/~speegle/_book/
# Ver la seccion de simulaciones, en el capitulo 2.4.

############################################################
# otros graficos
# graficamos la trayectoria
# Para eso, acomodamos una matriz, donde cada columna es una
# sucesion de promedios, xbarra_n comenzando con el promedio 
# de una observacion y terminando con n (5000).
# Hay B trayectorias diferentes
# La programacion intenta ser simple, no computacionalmente 
# eficiente
B<-500
n<-5000

unatrayequis<-rep(0,n)
resultcumples  <- rep(0,n)
unatraypromedio <- matrix(rep(0,n*B),nrow = n,ncol = B)
unatrayequis <- rep(0,n)
resultcumples <- rep(0,n)
for(j in 1:B){
for(i in 1:n){ 
  cumples <- sample(x = 1:365, size = 23, replace = TRUE)
  resultcumples[i] <- anyDuplicated(cumples)
  unatrayequis[i]<-resultcumples[i]==0
  unatraypromedio[i,j]<-mean(unatrayequis[1:i])
  }}
mean(resultcumples==0)   # estimacion de P(A_r)

# graficamos 10 trayectorias de los promedios, 
# con n entre 1 y 1000
plot(1:1000,unatraypromedio[1:1000,1],type="l",ylim = c(0,1))
for(j in 2:10){ 
  points(1:1000,unatraypromedio[1:1000,j],type="l",
         col=rainbow(10)[j])}
abline(h=0.4927,lty=2)

# graficamos 10 trayectorias de los promedios, 
# con n entre 1 y 5000
plot(1:5000,unatraypromedio[1:5000,1],type="l",ylim = c(0,1))
for(j in 2:10){ 
points(1:5000,unatraypromedio[,j],type="l",col=rainbow(10)[j])}
abline(h=0.4927,lty=2)


# histogramas de promedios, fijando el eje x en (0,1)
par(mfrow=c(2,3))
hist(unatraypromedio[1,],xlim = c(0,1),main = "Observaciones (n=1)",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[10,],xlim = c(0,1),main = "n = 10",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[100,],xlim = c(0,1),main = "n = 100",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[500,],xlim = c(0,1),main = "n = 500",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[1000,],xlim = c(0,1),main = "n = 1000",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[5000,],xlim = c(0,1),main = "n = 5000",
     xlab="",ylab = "",freq = F)


# histogramas de promedios, moviendo la escala del eje x
par(mfrow=c(2,3))
hist(unatraypromedio[1,],main = "Observaciones (n=1)",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[10,],main = "n = 10",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[100,],main = "n = 100",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[500,],main = "n = 500",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[1000,],main = "n = 1000",
     xlab="",ylab = "",freq = F)
hist(unatraypromedio[5000,],main = "n = 5000",
     xlab="",ylab = "",freq = F)
