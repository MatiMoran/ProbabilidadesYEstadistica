# Probabilidad y Estadística — Primer Cuatrimestre de 2026
## Ejercicios para pensar

## Ejercicio 1. (Paradoja del cumpleaños)
En un grupo aleatorio de 23 personas, ¿cuál es la probabilidad de que al menos dos personas del grupo cumplan años el mismo día?

### Solución

#### ¿Por qué es una "paradoja"?

La intuición dice: hay 365 días y solo 23 personas, eso es apenas el $23/365 \approx 6.3\%$ del calendario. Suena a que una coincidencia es muy improbable. Sin embargo, la probabilidad de coincidencia supera el **50%**. ¿Cómo puede ser?

La trampa intuitiva es que pensamos en *cada persona contra una fecha fija*, cuando en realidad nos preguntamos si **algún par** comparte cumpleaños. Con 23 personas hay

$$\binom{23}{2} = \frac{23 \cdot 22}{2} = 253 \text{ pares}$$

y cada par tiene su propia chance de coincidir. Es como preguntar si en 253 intentos alguno acierta — ahí ya no sorprende tanto.

---

#### Idea clave: calcular el complemento

El evento "al menos dos coinciden" es difícil de atacar directamente (hay muchos casos). Es mucho más fácil calcular el evento opuesto:

$$P(\text{al menos 2 coinciden}) = 1 - P(\text{todos tienen cumpleaños distinto})$$

---

#### Resolución paso a paso

Asumimos que los cumpleaños se distribuyen uniformemente en los 365 días del año (ignoramos años bisiestos) y que son independientes entre personas.

**Paso 1 — la primera persona.**

Puede tener cualquier cumpleaños. No hay nadie con quien coincidir.

$$P(\text{persona 1 no coincide con nadie}) = \frac{365}{365} = 1$$

**Paso 2 — la segunda persona.**

Para no coincidir con la primera, su cumpleaños debe caer en uno de los 364 días restantes:

$$P(\text{persona 2 distinta} \mid \text{persona 1 ya fijada}) = \frac{364}{365}$$

**Paso 3 — la tercera persona.**

Debe evitar los cumpleaños de las dos anteriores:

$$P(\text{persona 3 distinta} \mid \text{las 2 anteriores ya fijadas}) = \frac{363}{365}$$

**Paso general — la $k$-ésima persona.**

Debe evitar los $k-1$ cumpleaños ya tomados:

$$P(\text{persona } k \text{ distinta} \mid \text{las anteriores ya fijadas}) = \frac{365 - (k-1)}{365}$$

**Probabilidad de que todos $n$ sean distintos.**

Como los eventos son condicionales y se multiplican en cadena:

$$P(\text{todos distintos}) = \frac{365}{365} \cdot \frac{364}{365} \cdot \frac{363}{365} \cdots \frac{365 - n + 1}{365} = \prod_{k=0}^{n-1} \frac{365 - k}{365}$$

Esto se puede escribir de forma compacta usando factoriales. Recordando que $365^{\underline{n}} = 365 \cdot 364 \cdots (365-n+1)$ es el "factorial descendente":

$$P(\text{todos distintos}) = \frac{365!}{(365-n)! \cdot 365^n}$$

**Para $n = 23$:**

$$P(\text{todos distintos}) = \frac{365}{365} \cdot \frac{364}{365} \cdot \frac{363}{365} \cdots \frac{343}{365}$$

Calculando numéricamente (cada factor es ligeramente menor que 1, y se acumulan 23 factores):

$$P(\text{todos distintos}) \approx 0.4927$$

Por lo tanto:

$$\boxed{P(\text{al menos dos coinciden}) = 1 - 0.4927 \approx 0.5073 \approx 50.7\%}$$

---

#### ¿Con cuántas personas se supera el 50%?

| $n$ personas | $P(\text{coincidencia})$ |
|:---:|:---:|
| 10 | 11.7% |
| 20 | 41.1% |
| 22 | 47.6% |
| **23** | **50.7%** |
| 30 | 70.6% |
| 50 | 97.0% |
| 70 | 99.9% |

El umbral del 50% se cruza con apenas **23 personas** — mucho menos de lo que la intuición sugiere.

---

#### Generalización

Para un grupo de $n$ personas y un "calendario" de $d$ días equiprobables, la probabilidad de al menos una coincidencia es:

$$P_n = 1 - \prod_{k=0}^{n-1}\frac{d-k}{d}$$

Para el año estándar, $d = 365$.

---

## Ejercicio 2. (Monty Hall)
En un concurso se te ofrece escoger entre tres puertas: detrás de una de ellas hay un auto y detrás de las otras cabras. Elegís una puerta y luego el presentador, que sabe lo que hay detrás de las puertas, abre otra mostrando una cabra. Entonces te pregunta: "¿Querés cambiar tu elección?" ¿Qué debes hacer?

### Solución

#### ¿Por qué es una paradoja?

La intuición dice: quedan dos puertas, una tiene el auto y la otra una cabra, así que es $50/50$. Cambiar o quedarse da lo mismo.

Esta intuición es **incorrecta**. La clave que la rompe es que el presentador **no abre una puerta al azar** — él *sabe* dónde está el auto y *siempre* abre una puerta con cabra. Esa acción no es neutra: transmite información que redistribuye las probabilidades.

---

#### Idea clave: el presentador no es aleatorio

La acción del presentador está **condicionada** por tu elección inicial y por dónde está el auto. Esto es lo que hace que las probabilidades no sean simétricas.

La forma más directa de verlo es analizar los dos únicos escenarios posibles al momento de elegir.

---

#### Resolución paso a paso

Supongamos sin pérdida de generalidad que elegiste la **puerta 1**.

**Escenario A — elegiste la puerta con el auto** (probabilidad $\frac{1}{3}$)

El auto está detrás de la puerta 1. El presentador puede abrir cualquiera de las otras dos (ambas tienen cabras). Si **cambiás**, perdés.

**Escenario B — elegiste una puerta con cabra** (probabilidad $\frac{2}{3}$)

El auto está detrás de la puerta 2 o la 3 (una de ellas). El presentador **no tiene opción**: debe abrir la única puerta restante con cabra. Si **cambiás**, ganás.

**Tabla resumen:**

| Situación inicial | Probabilidad | ¿Qué pasa si cambiás? |
|:---|:---:|:---:|
| Elegiste el auto | $\dfrac{1}{3}$ | Perdés |
| Elegiste una cabra | $\dfrac{2}{3}$ | Ganás |

Por lo tanto:

$$\boxed{P(\text{ganar cambiando}) = \frac{2}{3}, \qquad P(\text{ganar quedándote}) = \frac{1}{3}}$$

**Siempre conviene cambiar.**

---

#### Verificación con Bayes (opcional)

Para quien quiera verlo formalmente. Llamemos:
- $A_i$ = "el auto está detrás de la puerta $i$", con $P(A_i) = \frac{1}{3}$
- $H_3$ = "el presentador abre la puerta 3" (el caso simétrico para puerta 2 es idéntico)

Habiendo elegido la puerta 1, la probabilidad de que el presentador abra la puerta 3 en cada escenario es:

$$P(H_3 \mid A_1) = \frac{1}{2}, \quad P(H_3 \mid A_2) = 1, \quad P(H_3 \mid A_3) = 0$$

La primera es $\frac{1}{2}$ porque si el auto está en puerta 1, el presentador elige al azar entre 2 y 3. La segunda es 1 porque si el auto está en puerta 2, la única opción es abrir la 3. La tercera es 0 porque no puede revelar el auto.

Por la regla de la probabilidad total:

$$P(H_3) = \frac{1}{2} \cdot \frac{1}{3} + 1 \cdot \frac{1}{3} + 0 \cdot \frac{1}{3} = \frac{1}{6} + \frac{1}{3} = \frac{1}{2}$$

Aplicando Bayes:

$$P(A_1 \mid H_3) = \frac{P(H_3 \mid A_1)\,P(A_1)}{P(H_3)} = \frac{\frac{1}{2} \cdot \frac{1}{3}}{\frac{1}{2}} = \frac{1}{3}$$

$$P(A_2 \mid H_3) = \frac{P(H_3 \mid A_2)\,P(A_2)}{P(H_3)} = \frac{1 \cdot \frac{1}{3}}{\frac{1}{2}} = \frac{2}{3}$$

Tras ver que el presentador abrió la puerta 3: la probabilidad de que el auto esté en la puerta 1 (tu elección) sigue siendo $\frac{1}{3}$, y la probabilidad de que esté en la puerta 2 (la alternativa) es $\frac{2}{3}$.

---

#### Analogía para fijar la intuición

Imaginá que en vez de 3 puertas hay **1000 puertas**. Elegís una al azar. El presentador abre 998 puertas con cabras y te deja solo la tuya y una más. ¿Cambiás?

Casi seguro que tu puerta original era una cabra — la elegiste entre 1000. El presentador concentró toda la "información" del auto en la puerta que no abrió. En este caso extremo nadie dudaría en cambiar. El problema original con 3 puertas es exactamente el mismo principio, solo que menos dramático.

---

## Ejercicio 3. (Coleccionista de cupones)
Un álbum tiene $N$ figuritas distintas. En el quiosco las figuritas se venden de a una y cada vez te dan una al azar, todas con la misma probabilidad de salir. ¿Cuál es el número esperado de figuritas que debemos comprar para completar el álbum?

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que si hay $N$ figuritas y cada compra te da una al azar con igual probabilidad, deberías necesitar "un poco más de $N$" compras. Después de todo, la mayoría de las veces comprás una nueva, ¿no?

El problema es el **final del álbum**: cuando te faltan pocas figuritas, la enorme mayoría de las que comprás ya las tenés. Si tenés 637 de 638, cada compra tiene solo $\frac{1}{638} \approx 0.16\%$ de probabilidad de ser la que falta. En promedio necesitás **638 compras más** solo para esa última figurita. Esto hace que el total crezca mucho más de $N$.

---

#### Idea clave: linealidad de la esperanza + geométrica

Dividimos el proceso en **etapas**. La etapa $k$ empieza cuando ya tenemos $k-1$ figuritas distintas y termina cuando conseguimos la $k$-ésima nueva. El número de compras en cada etapa es una variable **geométrica** y la esperanza total es la suma de las esperanzas de cada etapa.

---

#### Resolución paso a paso

**Etapa $k$: pasar de $k-1$ a $k$ figuritas distintas.**

Cuando ya tenemos $k-1$ figuritas distintas (de $N$ posibles), la probabilidad de que la próxima compra sea una figurita **nueva** es:

$$p_k = \frac{N - (k-1)}{N} = \frac{N - k + 1}{N}$$

Las compras dentro de la etapa son independientes, cada una con probabilidad $p_k$ de éxito. Entonces la cantidad de compras en la etapa $k$ sigue una distribución **Geométrica($p_k$)**, cuya esperanza es:

$$E[\text{compras en etapa } k] = \frac{1}{p_k} = \frac{N}{N - k + 1}$$

**Suma sobre todas las etapas.**

El total de compras es $T = X_1 + X_2 + \cdots + X_N$, donde $X_k$ es el número de compras en la etapa $k$. Por **linealidad de la esperanza**:

$$E[T] = \sum_{k=1}^{N} E[X_k] = \sum_{k=1}^{N} \frac{N}{N - k + 1}$$

Haciendo el cambio de índice $j = N - k + 1$ (cuando $k$ va de $1$ a $N$, $j$ va de $N$ a $1$):

$$E[T] = N \sum_{j=1}^{N} \frac{1}{j} = N \cdot H_N$$

donde $H_N = 1 + \frac{1}{2} + \frac{1}{3} + \cdots + \frac{1}{N}$ es el **$N$-ésimo número armónico**.

**Veamos el desglose para ver por qué el final pesa tanto.**

| Etapa $k$ | Figuritas que faltan | $p_k$ | Compras esperadas |
|:---:|:---:|:---:|:---:|
| 1 | $N$ de $N$ | $\frac{N}{N} = 1$ | $1$ |
| 2 | $N-1$ de $N$ | $\frac{N-1}{N}$ | $\frac{N}{N-1}$ |
| $\vdots$ | $\vdots$ | $\vdots$ | $\vdots$ |
| $N-1$ | $2$ de $N$ | $\frac{2}{N}$ | $\frac{N}{2}$ |
| $N$ | $1$ de $N$ | $\frac{1}{N}$ | $N$ |

La última etapa sola ya contribuye $N$ compras esperadas — tanto como el álbum entero en la estimación ingenua.

---

#### Resultado

$$\boxed{E[T] = N \cdot H_N = N \left(1 + \frac{1}{2} + \frac{1}{3} + \cdots + \frac{1}{N}\right)}$$

---

#### Tabla de valores

| $N$ (figuritas) | $E[T]$ (compras esperadas) | Ratio $E[T]/N$ |
|:---:|:---:|:---:|
| 10 | $\approx 29.3$ | $2.93\times$ |
| 50 | $\approx 224.9$ | $4.50\times$ |
| 100 | $\approx 518.7$ | $5.19\times$ |
| 638 | $\approx 4\,488$ | $7.03\times$ |
| 1000 | $\approx 7\,485$ | $7.49\times$ |

Un álbum de 638 figuritas (como el del Mundial) requiere en promedio **más de 4400 compras** para completarse — más de 7 veces la cantidad de figuritas.

---

#### Generalización

El número armónico crece como $H_N \approx \ln N + \gamma$, donde $\gamma \approx 0.5772$ es la constante de Euler-Mascheroni. Por lo tanto, para $N$ grande:

$$E[T] \approx N \ln N + \gamma N$$

Esto implica que el costo de completar el álbum crece **super-linealmente**: duplicar el álbum más que duplica las compras necesarias. El logaritmo aparece naturalmente porque la suma $\sum_{k=1}^{N} \frac{1}{k}$ converge a $\ln N$.

---

## Ejercicio 4. (Prisioneros y cajas)
Hay 100 prisioneros y una habitación con 100 cajas numeradas de 1 a 100 que contienen en un orden aleatorio los números del 1 al 100. Los prisioneros entran en la habitación, uno tras otro. Cada prisionero puede abrir y mirar dentro de 50 cajas en cualquier orden. Si cada prisionero encuentra su número en uno de los cajones, todos los prisioneros son indultados. Antes de que el primer prisionero entre en la habitación, pueden discutir una estrategia, pero no pueden comunicarse una vez que el primero haya entrado a revisar las cajas. Da una estrategia con la que se salven con una chance superior al 30%.

### Solución

#### ¿Por qué es una paradoja?

La primera reacción es de desesperanza total. Cada prisionero abre 50 de 100 cajas, así que su probabilidad de encontrar su número es $\frac{1}{2}$. Como los prisioneros no pueden comunicarse, parecería que sus éxitos son independientes, y la probabilidad de que los 100 tengan éxito sería:

$$\left(\frac{1}{2}\right)^{100} \approx 10^{-30}$$

Prácticamente cero. ¿Cómo puede existir una estrategia que supere el 30%?

La trampa está en asumir independencia. Los prisioneros **no pueden comunicarse entre sí durante las búsquedas**, pero sí pueden coordinar una estrategia antes. Y la clave es que todos interactúan con la **misma permutación** de números en las cajas — eso crea una correlación que pueden explotar.

---

#### Idea clave: seguir el ciclo de la permutación

Las cajas y sus contenidos definen una **permutación** de $\{1, \ldots, 100\}$: la caja $i$ apunta al número $\sigma(i)$. Toda permutación se descompone en **ciclos**. Si el prisionero $i$ sigue la cadena

$$i \;\to\; \sigma(i) \;\to\; \sigma(\sigma(i)) \;\to\; \cdots$$

eventualmente llegará a $i$ (porque estará siguiendo el ciclo que contiene a $i$). La pregunta es: ¿el ciclo es lo suficientemente corto como para terminarlo en 50 pasos?

**La estrategia ganadora:** el prisionero $i$ empieza abriendo la caja $i$, lee el número que hay dentro, abre esa caja, y repite — siempre siguiendo el número que acaba de leer. Para si encuentra su número o si ya abrió 50 cajas.

---

#### Resolución paso a paso

**Paso 1 — La permutación y sus ciclos.**

Las 100 cajas contienen una permutación aleatoria de $\{1, \ldots, 100\}$. Por ejemplo, si la permutación es:

$$\sigma = (1 \to 7 \to 42 \to 1)(2 \to 15 \to 2)(3 \to 88 \to 56 \to 3) \cdots$$

Entonces el prisionero 1 sigue la cadena $1 \to 7 \to 42 \to 1$ y encuentra su número en 3 pasos. El prisionero 7 sigue la cadena $7 \to 42 \to 1 \to 7$ — el mismo ciclo, también en 3 pasos.

En general, todos los prisioneros en un mismo ciclo de longitud $\ell$ encuentran su número exactamente en $\ell$ pasos.

**Paso 2 — ¿Cuándo falla la estrategia?**

Cada prisionero tiene 50 intentos. La estrategia falla si y solo si existe un ciclo de longitud $> 50$. En una permutación de 100 elementos puede haber **a lo sumo un ciclo de longitud $> 50$** (porque dos ciclos de longitud $> 50$ necesitarían más de 100 elementos en total).

Todos los prisioneros en ese ciclo largo fracasarán. El resto tendrá éxito.

**Paso 3 — Probabilidad de que exista un ciclo de longitud $k$.**

¿Cuántas permutaciones de $\{1, \ldots, 100\}$ tienen un ciclo de longitud exactamente $k$?

- Elegir los $k$ elementos del ciclo: $\binom{100}{k}$ formas.
- Ordenarlos en un ciclo: $(k-1)!$ formas.
- Permutar los $100 - k$ elementos restantes: $(100-k)!$ formas.

Total de permutaciones favorables: $\binom{100}{k} \cdot (k-1)! \cdot (100-k)! = \frac{100!}{k}$

Como el total de permutaciones es $100!$:

$$P(\text{existe un ciclo de longitud } k) = \frac{100!/k}{100!} = \frac{1}{k}$$

**Paso 4 — Probabilidad de fracaso.**

La estrategia falla si hay algún ciclo de longitud $k \in \{51, 52, \ldots, 100\}$. Como estos eventos son **disjuntos** (hay a lo sumo uno):

$$P(\text{fracaso}) = \sum_{k=51}^{100} \frac{1}{k} = H_{100} - H_{50}$$

donde $H_n = \sum_{j=1}^n \frac{1}{j}$ es el $n$-ésimo número armónico.

Numéricamente: $H_{100} \approx 5.187$ y $H_{50} \approx 4.499$, entonces:

$$P(\text{fracaso}) \approx 5.187 - 4.499 = 0.688$$

Por lo tanto:

$$\boxed{P(\text{éxito}) = 1 - \sum_{k=51}^{100} \frac{1}{k} = 1 - (H_{100} - H_{50}) \approx 31.2\%}$$

---

#### Distribución de longitudes de ciclo máximo

| Ciclo más largo | Probabilidad de ese ciclo | ¿La estrategia falla? |
|:---:|:---:|:---:|
| $\leq 50$ | $\approx 31.2\%$ | No — todos se salvan |
| 51 | $1/51 \approx 1.96\%$ | Sí |
| 52 | $1/52 \approx 1.92\%$ | Sí |
| $\vdots$ | $\vdots$ | $\vdots$ |
| 100 | $1/100 = 1\%$ | Sí |

La probabilidad de fracaso es exactamente la suma de $1/k$ para $k$ de 51 a 100.

---

#### Generalización

Para $2n$ prisioneros con acceso a $n$ cajas cada uno:

$$P(\text{éxito}) = 1 - \sum_{k=n+1}^{2n} \frac{1}{k} = 1 - (H_{2n} - H_n)$$

Cuando $n \to \infty$, usando que $H_{2n} - H_n \to \ln 2$:

$$P(\text{éxito}) \xrightarrow{n \to \infty} 1 - \ln 2 \approx 30.7\%$$

Este es el límite asintótico: la estrategia de seguir ciclos garantiza una probabilidad de supervivencia que nunca baja del $\approx 30.7\%$, sin importar cuántos prisioneros haya.

---

## Ejercicio 5. (Problema de la secretaria)
Para un único puesto hay $N$ aspirantes. Los candidatos se pueden ordenar de mejor a peor sin ambigüedad. Son entrevistados secuencialmente en orden aleatorio. El objetivo del reclutador es contratar al mejor candidato. Luego de una entrevista el reclutador solo sabe si el candidato es el mejor de los entrevistados por el momento o no. Al finalizar la entrevista debe decidir si contratar a ese candidato o no. Una vez que se desecha un aspirante, este no puede ser contratado más tarde.

El reclutador elige $c$, rechaza a los primeros $c$ aspirantes y luego contrata al primero que sea el mejor entrevistado por el momento. Siguiendo esta estrategia:
- ¿Cuál es la probabilidad de contratar al mejor candidato?
- ¿Qué estrategia debe seguir el reclutador para maximizar la probabilidad de contratar al mejor candidato?
- ¿Cuál es el límite de dicha probabilidad cuando $N \to \infty$?

---

## Ejercicio 6.
Doob se anota un número distinto en cada mano y las cierra de manera que Kolmogorov no los vea. Luego, K elige una mano y D le muestra el número escrito en esa mano. A continuación K debe adivinar en qué mano está escrito el número más grande. Demostrar que K tiene una estrategia que le asegura tener probabilidad mayor a $1/2$ de ganar independientemente de lo que haga D.

---

## Ejercicio 7.
En un truelo se enfrentan tres contendientes: A, B y C. El objetivo de cada uno es eliminar a los otros dos. Se sabe que cada vez que tira A acierta un tercio de las veces, B lo hace dos de cada tres y la puntería de C es infalible, acierta siempre.

Los contendientes tirarán secuencialmente en orden A, B, C; para recomenzar cíclicamente. ¿Cuál es la mejor estrategia para A? ¿Cuál es su probabilidad de ganar?

---

## Ejercicio 8.
Consideremos el conjunto de matrices reales de $n \times n$ cuyas entradas son 0 y 1. Sorteamos en este conjunto una matriz de manera que todas tienen la misma probabilidad. ¿Cuál es la esperanza para el determinante?

---

## Ejercicio 9.
A una fiesta concurren $N$ personas, cada una con un sombrero. Al ingresar a la fiesta cada persona deja su sombrero en una caja grande situada en la entrada del salón. Cuando finaliza el evento, las $N$ personas se dirigen a la entrada del salón y extraen un sombrero al azar de la caja. Aquellas personas que sacan su propio sombrero se retiran de la fiesta. El resto vuelve a colocar los sombreros que extrajeron en la caja y luego cada uno de los todavía presentes extrae nuevamente un sombrero al azar. Este procedimiento se repite hasta que las $N$ personas se hayan retirado de la fiesta. Calcular la esperanza de la cantidad de iteraciones que fueron necesarias hasta conseguir que las $N$ personas se retiraran de la fiesta con su sombrero.

---

## Ejercicio 10.
En Probalandia si llueve un día la probabilidad de que llueva al siguiente es 50%, mientras que si un día no llueve la probabilidad de que llueva al siguiente es 10%. ¿Cuántos días al año llueve en promedio?

---

## Ejercicio 11.
Se tira una moneda balanceada repetidamente. ¿Cuál es la esperanza para la cantidad de tiradas hasta obtener dos caras seguidas? ¿Y una cara seguida de una ceca?

---

## Ejercicio 12.
Un mono pulsa teclas al azar de una máquina de escribir indefinidamente. ¿Cuál es la probabilidad de que eventualmente escriba ABRACADABRA? ¿Cuál es la esperanza para el tiempo que demora en tipear ABRACADABRA?

---

## Ejercicio 13.
Se eligen tres puntos aleatoriamente en el círculo unitario. Estos determinan tres arcos, ¿cuál es la esperanza de la longitud del arco que contiene al $(1, 0)$?

---

## Ejercicio 14. (Paradoja del inspector)
Charly y Tincho están a cargo de medir la frecuencia del 107. Tincho se acerca en momentos al azar a la parada, espera que venga un colectivo y luego controla cuanto tiempo tarda en venir el siguiente. Charly se enteró que el quiosquero anota cada vez que pasa un colectivo. Entonces va a la parada en momentos al azar, le pregunta al quiosquero cuándo pasó el último colectivo, espera que venga el siguiente y calcula la diferencia entre esos tiempos. Ambos calculan la frecuencia tomando promedio de sus mediciones. ¿Van a obtener el mismo promedio a la larga?

---

## Ejercicio 15.
Se eligen dos puntos aleatoriamente en el intervalo $[0, 1]$. Estos determinan tres segmentos, ¿cuál es la probabilidad de que se pueda formar un triángulo con dichos segmentos?

---

## Ejercicio 16.
Se eligen tres puntos aleatoriamente en un círculo. Estos determinan un triángulo, ¿cuál es la probabilidad de que el triángulo contenga al centro del círculo?

---

## Ejercicio 17.
Una enfermedad tiene una prevalencia del 1% en la población. Un test da positivo con una probabilidad del 99% si una persona está enferma y con una probabilidad del 1% si la persona no está enferma. Si a una persona al azar la testeamos y da positivo, ¿cuál es la probabilidad de que realmente esté enferma?

---

## Ejercicio 18.
Una placa de Petri contiene una bacteria. Cada un segundo esta bacteria se duplica con probabilidad $p$ o muere. ¿Cuál es la probabilidad de que la colonia viva para siempre?

---

## Ejercicio 19.
En un cine hay 100 espectadores y 100 asientos. El primero en entrar decidió sentarse en un asiento al azar. El resto entran en fila y respetan su asiento asignado salvo que al llegar esté ocupado, en cuyo caso se sientan en un lugar libre al azar. ¿Cuál es la probabilidad de que el último encuentre su asiento ocupado?

---

## Ejercicio 20.
En Probalandia los bebés son varones con probabilidad 0.51 y mujeres con probabilidad 0.49. La tradición es tener hijos hasta que nazca la primera mujer. ¿Cuál es la proporción de bebés mujeres en la población?

---

## Ejercicio 21.
En una elección, el candidato A obtuvo 60 votos y el candidato B obtuvo 40. Si los votos se cuentan de uno en uno, ¿cuál es la probabilidad de que, durante todo el escrutinio, el candidato A se mantenga siempre por delante del candidato B?

---

## Ejercicio 22.
En un tablero de 2026 columnas por 2025 filas, se construye un laberinto eligiendo al azar si colocar o no una pared en cada lado de los cuadrados unitarios (con probabilidad $1/2$), a excepción de los bordes laterales del tablero, que siempre tienen paredes. Calcular la probabilidad de que exista un camino que permita ir desde arriba del tablero hasta abajo.

---

## Ejercicio 23.
Juan va al casino con \$100. Juega repetidamente a un juego donde paga \$1 cada vez para jugar. Si gana, se lleva \$2 y si pierde, no se lleva nada. En cada apuesta tiene la misma probabilidad de ganar que de perder. Deja de jugar cuando llega a tener \$101, y se va contento de que "le ganó al casino", o cuando se queda sin dinero. Determinar la probabilidad de que Juan le gane al casino. ¿Y si la probabilidad de ganar en cada apuesta es $p$ con $0 < p < 1$?

---

## Ejercicio 24.
Ana lanza tres dados con forma de tetraedro, cada uno de los cuales tiene en sus caras los números del 1 al 4, todos equiprobables. Beto lanza dos dados usuales con los números del 1 al 6 en sus caras, todos equiprobables. El puntaje de Ana es la suma de sus tres resultados, y el puntaje de Beto es la suma de sus dos resultados. ¿Cuál es la probabilidad de que el puntaje de Ana sea estrictamente mayor al de Beto?

---

## Ejercicio 25.
12 personas se sientan en una mesa redonda. Juan tiene una moneda de oro en su mano. Van pasando la moneda con probabilidad $1/2$ hacia la izquierda y $1/2$ hacia la derecha. El juego continúa hasta que todos han tocado la moneda; la última persona en tocarla por primera vez se la queda. ¿Cuál es la probabilidad de que gane quien está inmediatamente a la derecha de Juan?

---

## Ejercicio 26.
Se tiene una urna con 2019 bolitas rojas. Se van sacando bolitas de la urna. Cuando se saca una bolita roja, se agregan tantas bolitas azules como bolitas quedan en la urna. Cuando se saca una bolita azul, se continúa sacando. ¿Cuál es la probabilidad de que la última bolita que se saque sea azul?

---

## Ejercicio 27.
Para cada entero positivo $n$, denotemos por $p_n$ la probabilidad de que Ana le gane a Beto en el siguiente juego cuando ambos juegan de manera óptima: Primero Ana elige una secuencia de caras y cecas de longitud $n$. A continuación Beto hace lo mismo, seleccionando una secuencia distinta de la de Ana. Una vez fijadas ambas secuencias, se tira una moneda reiteradamente hasta que en los resultados de las tiradas aparezca de manera consecutiva alguna de las secuencias seleccionadas. Gana quien haya elegido la secuencia que apareció. Demostrar que existe y calcular:

$$\lim_{n \to \infty} p_n$$
