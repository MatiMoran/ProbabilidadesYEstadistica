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

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que si hay $N$ candidatos, para elegir al mejor deberíamos entrevistarlos a todos y recién al final decidir. Pero el problema exige decidir en el momento. Entonces uno podría pensar: "elijo al primero que parece bueno" — pero eso arriesga descartar candidatos mejores que aún no vimos.

La sorpresa es que existe una estrategia **con una chance de éxito que se acerca al 37%**, independientemente de cuán grande sea $N$. Y esa estrategia tiene una forma elegantísima: ignorar los primeros $c$ candidatos y luego contratar al primero que supere a todos ellos.

---

#### Idea clave: umbral de exploración

Dividimos el proceso en dos fases:

1. **Fase de exploración**: entrevistar los primeros $c$ candidatos sin contratar a nadie. Solo servimos para "calibrar" el nivel.
2. **Fase de selección**: a partir del candidato $c+1$, contratar al primero que sea mejor que todos los vistos hasta ahora.

El parámetro $c$ controla el balance entre explorar (aprender quiénes son buenos) y explotar (contratar al primero que supera el umbral). Hay que encontrar el $c$ óptimo.

---

#### Resolución paso a paso

**Paso 1 — Fórmula para $P(c)$.**

Sea $P(c)$ la probabilidad de contratar al mejor candidato usando umbral $c$.

Sea $A_k$ el evento "el mejor candidato ocupa la posición $k$". Como el orden es aleatorio:

$$P(A_k) = \frac{1}{N} \quad \text{para todo } k = 1, \ldots, N$$

Condicionando sobre la posición del mejor candidato:

$$P(c) = \sum_{k=1}^{N} P(\text{contratar al mejor} \mid A_k) \cdot P(A_k) = \frac{1}{N} \sum_{k=1}^{N} P(\text{contratar al mejor} \mid A_k)$$

**Paso 2 — ¿Cuándo se contrata al mejor dado que está en la posición $k$?**

- Si $k \leq c$: el mejor cae en la fase de exploración y es descartado. La probabilidad de contratarlo es $0$.
- Si $k > c$: el mejor está en la fase de selección. Lo contratamos si y solo si **ninguno de los candidatos en las posiciones $c+1, c+2, \ldots, k-1$ fue contratado**, lo que ocurre cuando el mejor de las posiciones $1, \ldots, k-1$ cae dentro de los primeros $c$ (así ninguno de las posiciones $c+1$ a $k-1$ superó el umbral).

La probabilidad de que el mejor entre los primeros $k-1$ esté en las primeras $c$ posiciones es:

$$P(\text{contratar al mejor} \mid A_k) = \frac{c}{k-1} \quad \text{para } k > c$$

**Paso 3 — Sustituyendo en la fórmula.**

$$\boxed{P(c) = \frac{c}{N} \sum_{k=c+1}^{N} \frac{1}{k-1} = \frac{c}{N} \sum_{j=c}^{N-1} \frac{1}{j}}$$

**Paso 4 — Encontrar el $c$ óptimo.**

Para $N$ grande, aproximamos la suma discreta por una integral:

$$\sum_{j=c}^{N-1} \frac{1}{j} \approx \int_{c}^{N} \frac{1}{x}\,dx = \ln\!\left(\frac{N}{c}\right)$$

Entonces:

$$P(c) \approx \frac{c}{N} \ln\!\left(\frac{N}{c}\right)$$

Hacemos el cambio de variable $t = c/N \in (0,1)$:

$$P(t) \approx t \ln\!\left(\frac{1}{t}\right) = -t \ln t$$

Maximizamos respecto a $t$:

$$\frac{d}{dt}(-t \ln t) = -\ln t - 1 = 0 \implies t^* = \frac{1}{e}$$

Por lo tanto, el umbral óptimo es:

$$\boxed{c^* \approx \frac{N}{e} \approx 0.368 \cdot N}$$

Es decir: **rechazar aproximadamente el primer 36.8% de los candidatos** y luego contratar al primero que supere a todos los anteriores.

**Paso 5 — La probabilidad máxima.**

Sustituyendo $t^* = 1/e$:

$$P_{\max} = -\frac{1}{e} \ln\!\left(\frac{1}{e}\right) = -\frac{1}{e} \cdot (-1) = \frac{1}{e}$$

---

#### Límite cuando $N \to \infty$

$$\boxed{\lim_{N \to \infty} P(c^*) = \frac{1}{e} \approx 36.79\%}$$

Esto es notable: sin importar cuántos candidatos haya, la estrategia óptima garantiza **casi el 37% de probabilidad** de elegir al mejor. Y ese porcentaje no mejora al agregar más candidatos.

---

#### Tabla de valores

| $N$ | $c^* = \lfloor N/e \rfloor$ | $P(c^*)$ |
|:---:|:---:|:---:|
| 5 | 2 | 43.3% |
| 10 | 4 | 39.9% |
| 20 | 7 | 38.4% |
| 50 | 18 | 37.4% |
| 100 | 37 | 37.1% |
| 1000 | 368 | 36.8% |
| $\infty$ | $N/e$ | $1/e \approx 36.79\%$ |

Notar que para $N$ pequeño la probabilidad es un poco mayor que $1/e$; converge desde arriba.

---

#### Generalización

La función $P(t) = -t \ln t$ tiene un único máximo en $t = 1/e$, independientemente de $N$. El resultado se generaliza a cualquier variante donde:

- Se puede observar el rango relativo de cada candidato.
- La decisión es irrevocable.
- El orden es aleatorio.

En ese caso, la estrategia óptima siempre tiene la forma "explorar una fracción $1/e$ y luego tomar el primero que supere el máximo visto", con probabilidad de éxito $1/e$.

---

## Ejercicio 6.
Doob se anota un número distinto en cada mano y las cierra de manera que Kolmogorov no los vea. Luego, K elige una mano y D le muestra el número escrito en esa mano. A continuación K debe adivinar en qué mano está escrito el número más grande. Demostrar que K tiene una estrategia que le asegura tener probabilidad mayor a $1/2$ de ganar independientemente de lo que haga D.

### Solución

#### ¿Por qué es paradójico?

La intuición dice que K no puede ganar más del 50%: ve un solo número y no sabe nada del otro. Ambas manos parecen simétricas — da igual adivinar "este es el mayor" que "el otro es el mayor". Con cualquier estrategia determinista, D podría anticiparla y hacerle perder siempre.

La clave que rompe esta intuición es que K puede usar una estrategia **aleatoria**. Al incorporar su propia aleatoriedad, K crea una asimetría que D no puede predecir ni contrarrestar.

---

#### Idea clave: umbral aleatorio con distribución continua

K genera un número $T$ al azar, con una distribución continua de soporte $\mathbb{R}$ (por ejemplo, una normal estándar). Luego:

- Si el número visto $x > T$: K declara que esa mano tiene el mayor.
- Si el número visto $x < T$: K declara que la otra mano tiene el mayor.

En esencia, $T$ actúa como un "umbral de referencia" generado por K de manera independiente a lo que haga D.

---

#### Resolución paso a paso

Sean $a < b$ los dos números que Doob escribió (D puede elegirlos como quiera, pero debe ser $a \neq b$).

K elige una mano al azar con probabilidad $1/2$ cada una, y ve $x \in \{a, b\}$.

**Caso 1 — K ve $a$ (el número menor).**

K dice "éste es el mayor" si $a > T$, y "el otro es el mayor" si $a < T$.
La decisión correcta es "el otro es el mayor", que ocurre cuando $a < T$:

$$P(\text{acierto} \mid \text{ve } a) = P(T > a) = 1 - F(a)$$

donde $F$ es la CDF de $T$.

**Caso 2 — K ve $b$ (el número mayor).**

La decisión correcta es "éste es el mayor", que ocurre cuando $b > T$:

$$P(\text{acierto} \mid \text{ve } b) = P(T < b) = F(b)$$

**Probabilidad total de acierto.**

Como K elige una mano al azar con probabilidad $1/2$:

$$P(\text{acierto}) = \frac{1}{2} P(\text{acierto} \mid \text{ve } a) + \frac{1}{2} P(\text{acierto} \mid \text{ve } b)$$

$$= \frac{1}{2}(1 - F(a)) + \frac{1}{2} F(b)$$

$$= \frac{1}{2} + \frac{1}{2}\bigl(F(b) - F(a)\bigr)$$

**Paso clave.** Como $a < b$ y $F$ es **estrictamente creciente** (porque $T$ tiene distribución continua):

$$F(b) > F(a) \implies F(b) - F(a) > 0$$

Por lo tanto:

$$\boxed{P(\text{acierto}) = \frac{1}{2} + \frac{1}{2}(F(b) - F(a)) > \frac{1}{2}}$$

Esto vale para **cualquier** par $a < b$ que elija D.

---

#### ¿Por qué D no puede contrarrestar la estrategia?

La ventaja de K depende de $F(b) - F(a)$, que es la probabilidad de que el umbral $T$ caiga entre $a$ y $b$. Esta cantidad es siempre positiva porque $T$ tiene distribución continua — no importa qué números elija D, siempre hay probabilidad positiva de que $T$ quede entre ellos.

D podría intentar minimizar esa ventaja eligiendo $a$ y $b$ muy cercanos o muy grandes/chicos, pero como $F$ tiene soporte en todo $\mathbb{R}$, nunca puede hacer que $F(b) - F(a) = 0$.

---

#### Tabla de ejemplos con $T \sim \mathcal{N}(0,1)$

| $a$ | $b$ | $F(b) - F(a)$ | $P(\text{acierto})$ |
|:---:|:---:|:---:|:---:|
| $-1$ | $1$ | $0.841 - 0.159 = 0.682$ | $84.1\%$ |
| $0$ | $1$ | $0.841 - 0.500 = 0.341$ | $67.1\%$ |
| $10$ | $11$ | $\approx 7.6 \times 10^{-24}$ | $50.000\ldots\%$ |
| $-100$ | $-99$ | $\approx 7.6 \times 10^{-24}$ | $50.000\ldots\%$ |

La ventaja puede ser ínfima si D elige números alejados del centro de la distribución, pero **nunca es exactamente cero**.

---

#### Generalización

La estrategia funciona con cualquier distribución continua con soporte en $\mathbb{R}$. Lo esencial es que $F$ sea estrictamente creciente en todo punto, para que $F(b) - F(a) > 0$ siempre que $a < b$.

Si en cambio D supiera la distribución de $T$ con exactitud, podría elegir $a$ y $b$ para minimizar la ventaja — pero no puede anularla por completo. La estrategia de K es **universalmente dominante** frente a cualquier estrategia determinista o aleatoria de D.

---

## Ejercicio 7.
En un truelo se enfrentan tres contendientes: A, B y C. El objetivo de cada uno es eliminar a los otros dos. Se sabe que cada vez que tira A acierta un tercio de las veces, B lo hace dos de cada tres y la puntería de C es infalible, acierta siempre.

Los contendientes tirarán secuencialmente en orden A, B, C; para recomenzar cíclicamente. ¿Cuál es la mejor estrategia para A? ¿Cuál es su probabilidad de ganar?

### Solución

#### ¿Por qué es paradójico?

La intuición dice que A, al ser el peor tirador, está en desventaja. Uno esperaría que A intente eliminar al más peligroso (C) lo antes posible. Pero el resultado es el opuesto: **la mejor estrategia de A es disparar al aire intencionalmente**, y con esa estrategia A termina siendo el jugador con mayor probabilidad de ganar.

La trampa intuitiva es ignorar que A se beneficia de que B y C se eliminen mutuamente. Si A elimina a uno de ellos, A queda mano a mano con el sobreviviente — que tiene mejor puntería. Es mejor dejar que los fuertes se destruyan entre sí.

---

#### Idea clave: análisis de estrategias racionales

Primero determinamos cómo juegan B y C racionalmente, y luego comparamos las tres opciones de A: disparar a B, disparar a C, o errar intencionalmente.

**¿A quién apunta B?**

Si B apunta a C y lo elimina (prob 2/3): B se enfrenta a A, que es el más débil. Bueno para B.
Si B apunta a A y lo elimina: B se enfrenta a C solo, y C nunca falla — B pierde con seguridad en el siguiente turno.

Entonces **B siempre apunta a C** (es la única opción que le da chances de ganar).

**¿A quién apunta C?**

Si C apunta a B y lo elimina: C enfrenta a A (prob de sobrevivir = 2/3, ya que A falla 2/3 de las veces y C nunca falla).
Si C apunta a A y lo elimina: C enfrenta a B, que dispara primero — B gana con prob 2/3.

Entonces **C siempre apunta a B** (le da 2/3 de chance vs 1/3 si apunta a A).

**Conclusión:** B y C se apuntan mutuamente. A puede aprovechar esto.

---

#### Resolución paso a paso

Calculamos $P(\text{A gana})$ para cada estrategia de A en su primer turno. Dado que C nunca falla, el juego siempre se resuelve dentro del primer ciclo completo (A, B, C).

**Herramienta: duelos entre dos jugadores.**

Necesitamos las probabilidades de A en duelos uno a uno. Sea $p$ = P(A gana | turno de B) y $q$ = P(A gana | turno de A) en un duelo A vs B:

$$p = \frac{1}{3} \cdot 0 + \frac{2}{3} \cdot q \qquad \text{(B falla con prob } 1/3\text{, da turno a A)}$$

Espera, corrijo:
$$p = \underbrace{\frac{2}{3} \cdot 0}_{\text{B elimina a A}} + \underbrace{\frac{1}{3} \cdot q}_{\text{B falla, turno de A}}$$
$$q = \underbrace{\frac{1}{3} \cdot 1}_{\text{A elimina a B}} + \underbrace{\frac{2}{3} \cdot p}_{\text{A falla, turno de B}}$$

Resolviendo: $p = \frac{1}{3}q$ y $q = \frac{1}{3} + \frac{2}{9}q \Rightarrow q = \frac{3}{7},\; p = \frac{1}{7}$.

En A vs C (C nunca falla): si es turno de A, A gana solo si acierta en ese disparo: $P(\text{A gana} \mid \text{turno de A}) = \frac{1}{3}$. Si es turno de C: A pierde con certeza.

| Duelo | Quién dispara primero | $P(\text{A gana})$ |
|:---:|:---:|:---:|
| A vs B | B | $\dfrac{1}{7}$ |
| A vs B | A | $\dfrac{3}{7}$ |
| A vs C | A | $\dfrac{1}{3}$ |
| A vs C | C | $0$ |

---

**Opción 1: A apunta a B.**

- Con prob $\frac{1}{3}$: B muere. Siguiente turno: C. Duelo A vs C con C primero. $P(\text{A gana}) = 0$.
- Con prob $\frac{2}{3}$: A falla. Turno de B. B apunta a C.
  - Con prob $\frac{2}{3}$: C muere. Turno de A. Duelo A vs B con A primero. $P(\text{A gana}) = \frac{3}{7}$.
  - Con prob $\frac{1}{3}$: B falla. Turno de C. C elimina a B (siempre). Duelo A vs C con A primero. $P(\text{A gana}) = \frac{1}{3}$.

$$P_{\text{apunta B}} = \frac{1}{3} \cdot 0 + \frac{2}{3}\left[\frac{2}{3} \cdot \frac{3}{7} + \frac{1}{3} \cdot \frac{1}{3}\right] = \frac{2}{3} \cdot \frac{25}{63} \cdot \frac{3}{2} = \frac{2}{3} \cdot \left[\frac{2}{7} + \frac{1}{9}\right] = \frac{2}{3} \cdot \frac{25}{63} = \frac{50}{189}$$

---

**Opción 2: A apunta a C.**

- Con prob $\frac{1}{3}$: C muere. Turno de B. Duelo A vs B con B primero. $P(\text{A gana}) = \frac{1}{7}$.
- Con prob $\frac{2}{3}$: A falla. Turno de B. B apunta a C.
  - Con prob $\frac{2}{3}$: C muere. Turno de A (se saltea el turno de C). Duelo A vs B con A primero. $P(\text{A gana}) = \frac{3}{7}$.
  - Con prob $\frac{1}{3}$: B falla. Turno de C. C elimina a B. Duelo A vs C con A primero. $P(\text{A gana}) = \frac{1}{3}$.

$$P_{\text{apunta C}} = \frac{1}{3} \cdot \frac{1}{7} + \frac{2}{3}\left[\frac{2}{3} \cdot \frac{3}{7} + \frac{1}{3} \cdot \frac{1}{3}\right] = \frac{1}{21} + \frac{2}{3} \cdot \frac{25}{63} = \frac{9}{189} + \frac{50}{189} = \frac{59}{189}$$

---

**Opción 3: A falla intencionalmente.**

- El disparo de A no elimina a nadie. Turno de B. B apunta a C.
  - Con prob $\frac{2}{3}$: C muere. Turno de A. Duelo A vs B con A primero. $P(\text{A gana}) = \frac{3}{7}$.
  - Con prob $\frac{1}{3}$: B falla. Turno de C. C elimina a B. Duelo A vs C con A primero. $P(\text{A gana}) = \frac{1}{3}$.

$$P_{\text{falla}} = \frac{2}{3} \cdot \frac{3}{7} + \frac{1}{3} \cdot \frac{1}{3} = \frac{2}{7} + \frac{1}{9} = \frac{18}{63} + \frac{7}{63} = \frac{25}{63} = \frac{75}{189}$$

---

#### Resultado

| Estrategia de A | $P(\text{A gana})$ |
|:---:|:---:|
| Apuntar a B | $\dfrac{50}{189} \approx 26.5\%$ |
| Apuntar a C | $\dfrac{59}{189} \approx 31.2\%$ |
| **Fallar intencionalmente** | $\mathbf{\dfrac{25}{63} \approx 39.7\%}$ |

$$\boxed{P(\text{A gana con estrategia óptima}) = \frac{25}{63} \approx 39.7\%}$$

**La mejor estrategia de A es fallar intencionalmente en su primer turno**, dejando que B y C se enfrenten entre sí.

---

#### Probabilidades finales de cada jugador (con estrategia óptima de A)

Con prob $\frac{2}{3}$: B elimina a C. Queda A vs B con A primero.
Con prob $\frac{1}{3}$: C elimina a B. Queda A vs C con A primero.

$$P(\text{A gana}) = \frac{2}{3} \cdot \frac{3}{7} + \frac{1}{3} \cdot \frac{1}{3} = \frac{25}{63} \approx 39.7\%$$

$$P(\text{B gana}) = \frac{2}{3} \cdot \frac{4}{7} = \frac{8}{21} = \frac{24}{63} \approx 38.1\%$$

$$P(\text{C gana}) = \frac{1}{3} \cdot \frac{2}{3} = \frac{2}{9} = \frac{14}{63} \approx 22.2\%$$

Verificación: $25 + 24 + 14 = 63$. ✓

**El jugador más débil tiene la mayor probabilidad de ganar.** C, el único que nunca falla, es paradójicamente el que menos chances tiene.

---

#### ¿Por qué C pierde más?

C dispara último en el primer turno. Para cuando llega el turno de C, B ya tuvo su oportunidad de eliminarlo. C nunca tiene la ventaja de disparar primero en el truelo — siempre entra al duelo uno a uno habiendo sobrevivido el disparo de B. En cambio, A nunca es el objetivo prioritario de nadie, por lo que siempre llega vivo al duelo final.

---

## Ejercicio 8.
Consideremos el conjunto de matrices reales de $n \times n$ cuyas entradas son 0 y 1. Sorteamos en este conjunto una matriz de manera que todas tienen la misma probabilidad. ¿Cuál es la esperanza para el determinante?

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que el determinante puede tomar valores positivos o negativos, y que quizás se cancelen. Pero lo sorprendente es que el resultado es **exactamente cero**, no aproximadamente, para todo $n \geq 2$. Esto vale sin importar cuánto crezca $n$, aunque el determinante en sí pueda ser un número enorme en valor absoluto.

La clave es que hay una simetría perfecta entre los aportes positivos y negativos al determinante, forzada por la distribución de las entradas.

---

#### Idea clave: argumento de simetría por intercambio de columnas

Si permutamos dos columnas de una matriz aleatoria, la nueva matriz tiene **la misma distribución** (las entradas siguen siendo i.i.d. Bernoulli(1/2)), pero el determinante **cambia de signo**. Entonces la esperanza del determinante debe ser igual a su negativo — lo que solo es posible si es cero.

---

#### Resolución paso a paso

**Enfoque 1 — Argumento de simetría (elegante).**

Sea $A$ una matriz aleatoria $n \times n$ con entradas i.i.d. Bernoulli(1/2). Sea $A'$ la matriz obtenida intercambiando las columnas 1 y 2 de $A$.

Como las entradas de $A$ son independientes e igualmente distribuidas, la matriz $A'$ tiene **exactamente la misma distribución** que $A$:

$$A' \overset{d}{=} A$$

Por lo tanto:

$$E[\det(A')] = E[\det(A)]$$

Pero intercambiar dos columnas multiplica el determinante por $-1$:

$$\det(A') = -\det(A)$$

Entonces:

$$E[\det(A)] = E[\det(A')] = E[-\det(A)] = -E[\det(A)]$$

La única solución es:

$$\boxed{E[\det(A)] = 0}$$

Este argumento vale para cualquier $n \geq 2$ (se necesitan al menos dos columnas para intercambiar).

---

**Enfoque 2 — Fórmula de Leibniz + linealidad de la esperanza.**

La fórmula de Leibniz expande el determinante como suma sobre todas las permutaciones de $\{1, \ldots, n\}$:

$$\det(A) = \sum_{\sigma \in S_n} \text{sgn}(\sigma) \prod_{i=1}^n a_{i,\sigma(i)}$$

donde $\text{sgn}(\sigma) \in \{+1, -1\}$ es la signatura de la permutación $\sigma$.

Tomando esperanza y usando linealidad:

$$E[\det(A)] = \sum_{\sigma \in S_n} \text{sgn}(\sigma)\, E\!\left[\prod_{i=1}^n a_{i,\sigma(i)}\right]$$

Para cada permutación $\sigma$, el producto $\prod_{i=1}^n a_{i,\sigma(i)}$ involucra exactamente $n$ entradas, **una de cada fila y una de cada columna** (por definición de permutación). Por lo tanto las $n$ entradas son **independientes entre sí**, y:

$$E\!\left[\prod_{i=1}^n a_{i,\sigma(i)}\right] = \prod_{i=1}^n E[a_{i,\sigma(i)}] = \left(\frac{1}{2}\right)^n$$

Este valor es el **mismo para toda permutación $\sigma$**. Entonces:

$$E[\det(A)] = \left(\frac{1}{2}\right)^n \sum_{\sigma \in S_n} \text{sgn}(\sigma)$$

Para $n \geq 2$, el grupo simétrico $S_n$ tiene exactamente la misma cantidad de permutaciones pares e impares: $\frac{n!}{2}$ de cada tipo. Por lo tanto:

$$\sum_{\sigma \in S_n} \text{sgn}(\sigma) = \frac{n!}{2} \cdot (+1) + \frac{n!}{2} \cdot (-1) = 0$$

Y concluimos:

$$\boxed{E[\det(A)] = \left(\frac{1}{2}\right)^n \cdot 0 = 0}$$

---

#### Verificación para $n = 2$

$$A = \begin{pmatrix} a & b \\ c & d \end{pmatrix}, \quad \det(A) = ad - bc$$

$$E[\det(A)] = E[ad] - E[bc] = E[a]E[d] - E[b]E[c] = \frac{1}{2}\cdot\frac{1}{2} - \frac{1}{2}\cdot\frac{1}{2} = 0 \checkmark$$

Los dos términos son iguales y se cancelan exactamente.

---

#### Tabla: ¿por qué la suma de signaturas es cero?

| $n$ | $|S_n|$ | Permutaciones pares | Permutaciones impares | $\sum \text{sgn}$ |
|:---:|:---:|:---:|:---:|:---:|
| 1 | 1 | 1 | 0 | 1 |
| 2 | 2 | 1 | 1 | 0 |
| 3 | 6 | 3 | 3 | 0 |
| 4 | 24 | 12 | 12 | 0 |
| $n \geq 2$ | $n!$ | $n!/2$ | $n!/2$ | 0 |

Para $n = 1$ el resultado es $E[\det] = E[a_{11}] = 1/2$, caso trivial sin simetría de signo.

---

#### Generalización

El resultado vale para **cualquier distribución i.i.d. con media $\mu$** en las entradas:

$$E[\det(A)] = \mu^n \sum_{\sigma \in S_n} \text{sgn}(\sigma) = 0 \quad \text{para } n \geq 2$$

No depende del valor de $\mu$: tanto el argumento de simetría como el de Leibniz funcionan para cualquier distribución simétrica en las columnas.

---

## Ejercicio 9.
A una fiesta concurren $N$ personas, cada una con un sombrero. Al ingresar a la fiesta cada persona deja su sombrero en una caja grande situada en la entrada del salón. Cuando finaliza el evento, las $N$ personas se dirigen a la entrada del salón y extraen un sombrero al azar de la caja. Aquellas personas que sacan su propio sombrero se retiran de la fiesta. El resto vuelve a colocar los sombreros que extrajeron en la caja y luego cada uno de los todavía presentes extrae nuevamente un sombrero al azar. Este procedimiento se repite hasta que las $N$ personas se hayan retirado de la fiesta. Calcular la esperanza de la cantidad de iteraciones que fueron necesarias hasta conseguir que las $N$ personas se retiraran de la fiesta con su sombrero.

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que como en cada ronda solo sale en promedio **una persona** (la probabilidad de que alguien saque su propio sombrero es $1/N$, y hay $N$ personas), el proceso debería tardar muchísimas rondas. Por ejemplo, con 100 personas, ¿no deberían hacer falta unas 100 o más rondas?

La sorpresa es que la esperanza es exactamente $N$ — la misma cantidad que el número de personas. Y ese "en promedio una persona por ronda" es exactamente la razón: el proceso es mucho más eficiente de lo que parece porque en las rondas tardías quedan pocas personas, que terminan rápido.

---

#### Idea clave: recursión + inducción usando $E[\text{puntos fijos}] = 1$

Definimos $E_k$ = esperanza de rondas hasta terminar cuando quedan $k$ personas. Buscaremos la recursión que satisface $E_k$ y demostraremos que $E_k = k$ para todo $k \geq 1$.

La herramienta central es: **en una permutación aleatoria de $k$ elementos, la esperanza del número de puntos fijos es siempre 1**, sin importar $k$.

---

#### Resolución paso a paso

**Paso 1 — Casos base.**

- $E_1 = 1$: una persona saca inevitablemente su propio sombrero. Sale en la primera ronda. ✓
- $E_2 = 2$: dos personas, dos sombreros. La permutación es la identidad (ambas salen) con prob $\frac{1}{2}$, o el intercambio (ninguna sale) con prob $\frac{1}{2}$. Entonces $T \sim \text{Geom}(1/2)$ y $E_2 = 2$. ✓

**Paso 2 — Recursión general.**

Con $k$ personas presentes, cada ronda produce una permutación aleatoria uniforme de los $k$ sombreros. Sean $p_{k,j}$ la probabilidad de que exactamente $j$ personas saquen su propio sombrero (es decir, la permutación tenga exactamente $j$ puntos fijos):

$$p_{k,j} = \binom{k}{j} \frac{D_{k-j}}{k!}$$

donde $D_m$ es el número de desarreglos de $m$ elementos.

Tras la ronda, quedan $k-j$ personas. Usando $E_0 = 0$:

$$E_k = 1 + \sum_{j=0}^{k} p_{k,j} \cdot E_{k-j}$$

**Paso 3 — Demostración de que $E_k = k$ por inducción.**

Hipótesis inductiva: $E_m = m$ para todo $m < k$. Entonces $E_{k-j} = k-j$ para $j = 0, 1, \ldots, k-1$, y $E_0 = 0$. Sustituyendo:

$$E_k = 1 + \sum_{j=0}^{k-1} p_{k,j} (k-j) = 1 + k\sum_{j=0}^{k-1} p_{k,j} - \sum_{j=0}^{k-1} j \cdot p_{k,j}$$

Calculamos cada término por separado.

**Término 1:** $\displaystyle\sum_{j=0}^{k-1} p_{k,j} = 1 - p_{k,k} = 1 - \frac{1}{k!}$

(la suma de todas las probabilidades es 1, menos la de la identidad).

**Término 2:** Usamos que la esperanza del número de puntos fijos de una permutación aleatoria de $k$ elementos es 1:

$$\sum_{j=0}^{k} j \cdot p_{k,j} = E[\text{puntos fijos}] = 1$$

El término $j = k$ contribuye $k \cdot p_{k,k} = k \cdot \frac{1}{k!} = \frac{1}{(k-1)!}$. Por lo tanto:

$$\sum_{j=0}^{k-1} j \cdot p_{k,j} = 1 - \frac{1}{(k-1)!}$$

**Sustituyendo en la recursión:**

$$E_k = 1 + k\!\left(1 - \frac{1}{k!}\right) - \left(1 - \frac{1}{(k-1)!}\right)$$

$$= 1 + k - \frac{k}{k!} - 1 + \frac{1}{(k-1)!}$$

$$= k - \frac{1}{(k-1)!} + \frac{1}{(k-1)!} = k \quad \checkmark$$

**Paso 4 — ¿Por qué $E[\text{puntos fijos}] = 1$?**

Sea $X_i = \mathbf{1}[\text{persona } i \text{ saca su propio sombrero}]$. Por simetría, $P(X_i = 1) = 1/k$ para cada $i$. Por linealidad de la esperanza:

$$E\!\left[\sum_{i=1}^k X_i\right] = \sum_{i=1}^k \frac{1}{k} = 1$$

Este resultado vale para **cualquier** $k \geq 1$, sin importar si las $X_i$ son independientes o no.

---

#### Resultado

$$\boxed{E[T] = N}$$

La esperanza del número de rondas necesarias es exactamente $N$.

---

#### Tabla de casos pequeños

| $N$ | $P(T=1)$ | $P(T=2)$ | $E[T]$ |
|:---:|:---:|:---:|:---:|
| 1 | $1$ | $0$ | $1$ |
| 2 | $\frac{1}{2}$ | $\frac{1}{4}$ | $2$ |
| 3 | $\frac{1}{6}$ | $\frac{1}{3}$ | $3$ |
| 4 | $\frac{1}{24}$ | — | $4$ |

Para $N = 3$: con prob $1/6$ todos salen en ronda 1 (identidad); con prob $1/2$ queda un par (que tarda en promedio 2 rondas más); con prob $1/3$ nadie sale y se repite. La recursión da $E_3 = 3$.

---

#### Generalización

El resultado $E_k = k$ dice que en promedio **se necesita exactamente una ronda por persona**. Esto es consistente con la intuición de que "en promedio sale una persona por ronda" — pero esa tasa se mantiene constante porque la cantidad de personas va decreciendo junto con la cantidad de rondas restantes. El proceso es, en cierto sentido, perfectamente balanceado.

---

## Ejercicio 10.
En Probalandia si llueve un día la probabilidad de que llueva al siguiente es 50%, mientras que si un día no llueve la probabilidad de que llueva al siguiente es 10%. ¿Cuántos días al año llueve en promedio?

### Solución

#### ¿Por qué hay que tener cuidado con la intuición?

La intuición podría decir: "llueve el 10% de los días secos y el 50% de los días lluviosos; como llueve poco, la mayoría son días secos, entonces llueve cerca del 10%". Pero este razonamiento es circular: para saber cuánto pesa cada probabilidad hay que saber cuántos días son lluviosos, que es justo lo que queremos calcular.

La forma correcta es encontrar la **distribución estacionaria** de la cadena de Markov que describe el clima.

---

#### Idea clave: distribución estacionaria de una cadena de Markov

El clima de Probalandia es un proceso con memoria de un día: el estado de mañana depende solo del estado de hoy. Esto es una **cadena de Markov** de dos estados.

La distribución estacionaria $(\pi_L, \pi_S)$ es la fracción de días que el sistema pasa en cada estado a largo plazo. Se obtiene resolviendo el sistema de balance.

---

#### Resolución paso a paso

**Paso 1 — Definir los estados y las probabilidades de transición.**

| Estado actual | $\to$ Lluvia | $\to$ Seco |
|:---:|:---:|:---:|
| Lluvia (L) | $0.5$ | $0.5$ |
| Seco (S) | $0.1$ | $0.9$ |

**Paso 2 — Ecuaciones de estacionariedad.**

La distribución $(\pi_L, \pi_S)$ debe satisfacer $\pi = \pi P$, es decir, las probabilidades de flujo entrante y saliente se equilibran:

$$\pi_L = 0.5\,\pi_L + 0.1\,\pi_S$$
$$\pi_S = 0.5\,\pi_L + 0.9\,\pi_S$$
$$\pi_L + \pi_S = 1$$

Las dos primeras ecuaciones son equivalentes (una se deduce de la otra usando la tercera), así que trabajamos con la primera y la normalización.

**Paso 3 — Resolver el sistema.**

De la primera ecuación:

$$\pi_L - 0.5\,\pi_L = 0.1\,\pi_S$$
$$0.5\,\pi_L = 0.1\,\pi_S$$
$$\frac{\pi_L}{\pi_S} = \frac{0.1}{0.5} = \frac{1}{5}$$

Con $\pi_L + \pi_S = 1$:

$$\pi_L = \frac{1}{6}, \qquad \pi_S = \frac{5}{6}$$

**Paso 4 — Días de lluvia por año.**

A largo plazo, llueve en una fracción $\pi_L = \frac{1}{6}$ de los días. En un año de 365 días:

$$\boxed{E[\text{días de lluvia}] = 365 \times \frac{1}{6} = \frac{365}{6} \approx 60.8 \text{ días}}$$

---

#### Interpretación por balance de flujos

La distribución estacionaria tiene una interpretación directa: el flujo de días "seco → lluvia" debe igualar el flujo "lluvia → seco" (condición de balance global):

$$\underbrace{\pi_S \cdot 0.1}_{\text{seco} \to \text{lluvia}} = \underbrace{\pi_L \cdot 0.5}_{\text{lluvia} \to \text{seco}}$$

$$\frac{5}{6} \cdot 0.1 = \frac{1}{6} \cdot 0.5 \quad\Longrightarrow\quad \frac{1}{12} = \frac{1}{12} \checkmark$$

En promedio, por cada día que "entra" a ser lluvioso, hay exactamente un día que "sale". El sistema está en equilibrio.

---

#### Tabla: sensibilidad al parámetro $p = P(L \mid S)$

¿Qué pasa si cambia la probabilidad de lluvia en días secos? Con $P(L \mid L) = 0.5$ fijo:

| $P(L \mid S)$ | $\pi_L = \frac{p}{0.5 + p}$ | Días/año |
|:---:|:---:|:---:|
| 0.05 | $\frac{1}{11} \approx 9.1\%$ | $\approx 33$ |
| **0.10** | $\mathbf{\frac{1}{6} \approx 16.7\%}$ | $\mathbf{\approx 61}$ |
| 0.20 | $\frac{2}{7} \approx 28.6\%$ | $\approx 104$ |
| 0.50 | $\frac{1}{2} = 50\%$ | $\approx 183$ |

Cuando $P(L \mid S) = P(L \mid L) = 0.5$, los días son independientes y llueve exactamente la mitad del tiempo.

---

#### Generalización

Para una cadena de Markov de dos estados con parámetros $\alpha = P(L \mid L)$ y $\beta = P(L \mid S)$, la distribución estacionaria es:

$$\pi_L = \frac{\beta}{(1-\alpha) + \beta}, \qquad \pi_S = \frac{1-\alpha}{(1-\alpha) + \beta}$$

En este problema: $\alpha = 0.5$, $\beta = 0.1$, por lo que $\pi_L = \frac{0.1}{0.5 + 0.1} = \frac{1}{6}$.

---

## Ejercicio 11.
Se tira una moneda balanceada repetidamente. ¿Cuál es la esperanza para la cantidad de tiradas hasta obtener dos caras seguidas? ¿Y una cara seguida de una ceca?

### Solución

#### ¿Por qué es sorprendente?

Ambos patrones — CC (cara-cara) y CS (cara-seca) — tienen la misma probabilidad de ocurrir en dos tiradas consecutivas: $\frac{1}{4}$. La intuición dice que ambos deberían tardar lo mismo en aparecer. Sin embargo:

$$E[\text{tiradas hasta CC}] = 6 \qquad E[\text{tiradas hasta CS}] = 4$$

Dos patrones igualmente probables requieren esperas distintas. La diferencia está en cómo cada patrón "aprovecha" los intentos fallidos.

---

#### Idea clave: cadena de Markov de estados de progreso

Modelamos el proceso como una cadena de Markov donde el estado registra cuánto del patrón ya fue logrado. Planteamos ecuaciones para la esperanza de tiradas desde cada estado y resolvemos el sistema.

---

#### Parte 1 — Esperanza para CC (cara-cara)

**Estados:**

- **Estado 0 (∅):** inicio, o el último resultado fue seca (ningún progreso hacia CC).
- **Estado 1 (C):** el último resultado fue cara (un paso avanzado).
- **Estado 2 (CC):** meta alcanzada (absorbente).

**Diagrama de transiciones:**

$$\emptyset \xrightarrow{C,\;1/2} C \xrightarrow{C,\;1/2} \text{CC (fin)}$$
$$\emptyset \xrightarrow{S,\;1/2} \emptyset \qquad C \xrightarrow{S,\;1/2} \emptyset$$

**Ecuaciones** (sea $E_0$, $E_1$ la esperanza de tiradas restantes desde cada estado):

$$E_0 = 1 + \frac{1}{2} E_1 + \frac{1}{2} E_0$$
$$E_1 = 1 + \frac{1}{2} \cdot 0 + \frac{1}{2} E_0$$

De la segunda: $E_1 = 1 + \frac{1}{2} E_0$.

Sustituyendo en la primera:

$$E_0 = 1 + \frac{1}{2}\!\left(1 + \frac{1}{2}E_0\right) + \frac{1}{2} E_0 = \frac{3}{2} + \frac{3}{4} E_0$$

$$\frac{1}{4} E_0 = \frac{3}{2} \implies E_0 = 6, \quad E_1 = 4$$

$$\boxed{E[\text{tiradas hasta CC}] = 6}$$

**¿Por qué tarda tanto?** Al obtener una seca en el estado C (cuando ya teníamos una cara), no solo perdemos ese intento — volvemos al estado 0 y perdemos todo el progreso. Esto hace que el patrón CC sea "frágil": una seca en cualquier punto reinicia desde cero.

---

#### Parte 2 — Esperanza para CS (cara-seca)

**Estados:**

- **Estado 0 (∅):** inicio, o el último resultado fue seca tras no haber avanzado.
- **Estado 1 (C):** el último resultado fue cara (primer paso logrado).
- **Estado 2 (CS):** meta alcanzada (absorbente).

**Diagrama de transiciones:**

$$\emptyset \xrightarrow{C,\;1/2} C \xrightarrow{S,\;1/2} \text{CS (fin)}$$
$$\emptyset \xrightarrow{S,\;1/2} \emptyset \qquad C \xrightarrow{C,\;1/2} C$$

La diferencia crucial: obtener otra cara en el estado C **no reinicia** — seguimos en el estado C con una cara fresca lista.

**Ecuaciones:**

$$E_0 = 1 + \frac{1}{2} E_1 + \frac{1}{2} E_0$$
$$E_1 = 1 + \frac{1}{2} \cdot 0 + \frac{1}{2} E_1$$

De la segunda: $\frac{1}{2} E_1 = 1 \implies E_1 = 2$.

Sustituyendo en la primera:

$$E_0 = 1 + \frac{1}{2} \cdot 2 + \frac{1}{2} E_0 = 2 + \frac{1}{2} E_0$$

$$\frac{1}{2} E_0 = 2 \implies E_0 = 4$$

$$\boxed{E[\text{tiradas hasta CS}] = 4}$$

**¿Por qué tarda menos?** Una cara extra en el estado C no es un retroceso — sigue siendo útil como inicio del patrón. El patrón CS es más "robusto" a los intentos fallidos.

---

#### Comparación de los dos patrones

| | CC | CS |
|:---|:---:|:---:|
| Probabilidad en 2 tiradas | $1/4$ | $1/4$ |
| $E[\text{tiradas}]$ | $6$ | $4$ |
| Si falla a mitad… | vuelve a estado 0 | queda en estado 1 |

La asimetría se debe a la **auto-solapabilidad** del patrón:

- CC se solapa consigo mismo: la segunda C de un intento fallido podría ser la primera C del próximo. Pero una seca lo destruye todo.
- CS no se solapa: una seca al final completa el patrón; una cara extra mantiene el progreso.

---

#### Tabla: trayectorias posibles para CC

| Resultado | Prob | ¿Sale? |
|:---:|:---:|:---:|
| CC | $1/4$ | Sí, en 2 tiradas |
| CS, SC, SS luego CC | variable | No de inmediato |

Promediando sobre todas las trayectorias, la espera es 6.

---

#### Generalización

Para un patrón de longitud $\ell$, la esperanza de espera depende de las **auto-correlaciones** del patrón (si el patrón se solapa consigo mismo). Esto conecta con la teoría de martingalas y con el algoritmo de Conway-Gardner para calcular tiempos de espera de patrones arbitrarios.

En general, para patrones de longitud $\ell$ con una moneda equilibrada:

$$E[\text{tiradas}] = \sum_{k=1}^{\ell} 2^k \cdot \mathbf{1}[\text{los primeros } k \text{ símbolos del patrón coinciden con los últimos } k]$$

Para CC: coincidencia en $k=1$ (C=C) y $k=2$ (CC=CC) → $E = 2^1 + 2^2 = 2 + 4 = 6$. ✓

Para CS: solo coincidencia en $k=2$ (CS=CS) → $E = 2^2 = 4$. ✓

---

## Ejercicio 12.
Un mono pulsa teclas al azar de una máquina de escribir indefinidamente. ¿Cuál es la probabilidad de que eventualmente escriba ABRACADABRA? ¿Cuál es la esperanza para el tiempo que demora en tipear ABRACADABRA?

### Solución

#### ¿Por qué es sorprendente?

Hay dos sorpresas. La primera es que la probabilidad de escribir ABRACADABRA es **1** — el mono lo escribe con certeza, aunque la chance de lograrlo en 11 teclas es $(1/26)^{11} \approx 10^{-15}$.

La segunda sorpresa viene al comparar ABRACADABRA con otra palabra de la misma longitud, digamos ABRACADABRC. Ambas tienen exactamente la misma probabilidad de aparecer en cualquier momento dado, pero sus **tiempos de espera esperados son distintos**. La razón, igual que en el ejercicio anterior, es la auto-solapabilidad del patrón.

---

#### Idea clave: auto-solapabilidad del patrón + argumento del casino

El tiempo de espera depende de cuánto se solapa ABRACADABRA consigo mismo. Para calcularlo elegantemente, usamos un argumento de martingala: imaginamos un casino donde en cada instante entra un nuevo apostador que apuesta secuencialmente a las letras del patrón. Al tiempo de parada, los apostadores "sobrevivientes" son exactamente los que comenzaron en posiciones de solapamiento.

---

#### Parte 1 — Probabilidad de que eventualmente aparezca ABRACADABRA

Dividimos la secuencia infinita de teclas en **bloques no solapados** de 11 caracteres: posiciones $1$–$11$, posiciones $12$–$22$, posiciones $23$–$33$, …

La probabilidad de que un bloque específico sea exactamente ABRACADABRA es:

$$p = \left(\frac{1}{26}\right)^{11} > 0$$

Los bloques son independientes entre sí. La probabilidad de que ABRACADABRA **no aparezca** en ninguno de los primeros $N$ bloques es:

$$\left(1 - \frac{1}{26^{11}}\right)^N \xrightarrow{N \to \infty} 0$$

Por lo tanto:

$$\boxed{P(\text{el mono eventualmente escribe ABRACADABRA}) = 1}$$

Esto vale para cualquier palabra de longitud finita sobre un alfabeto finito: el mono la escribe con probabilidad 1. (Este es el *Teorema del Mono Infinito*.)

---

#### Parte 2 — Tiempo esperado: auto-solapamientos de ABRACADABRA

**Paso 1 — Identificar los solapamientos.**

Escribimos el patrón con índices:

$$\underbrace{A}_{1}\underbrace{B}_{2}\underbrace{R}_{3}\underbrace{A}_{4}\underbrace{C}_{5}\underbrace{A}_{6}\underbrace{D}_{7}\underbrace{A}_{8}\underbrace{B}_{9}\underbrace{R}_{10}\underbrace{A}_{11}$$

Buscamos todos los $k \in \{1, \ldots, 11\}$ tales que el **prefijo de longitud $k$** coincide con el **sufijo de longitud $k$**:

| $k$ | Prefijo | Sufijo | ¿Coinciden? |
|:---:|:---:|:---:|:---:|
| 1 | A | A | ✓ |
| 2 | AB | RA | ✗ |
| 3 | ABR | BRA | ✗ |
| 4 | ABRA | ABRA | ✓ |
| 5 | ABRAC | DABRA | ✗ |
| 6–10 | — | — | ✗ |
| 11 | ABRACADABRA | ABRACADABRA | ✓ (siempre) |

Los solapamientos están en $k = 1$, $k = 4$ y $k = 11$.

**Paso 2 — El argumento del casino (martingala).**

En cada instante $t$, un nuevo apostador entra al casino con \$1 y apuesta secuencialmente:
- Apuesta sus \$1 a que la tecla $t$ es 'A'. Si acierta, gana \$26 (su dinero se multiplica por 26). Si falla, pierde todo y sale.
- Si ganó, apuesta sus \$26 a que la tecla $t+1$ es 'B'. Si acierta, tiene \$26². Etc.
- Continúa hasta completar ABRACADABRA o perder.

Al tiempo $T$ en que ABRACADABRA aparece por primera vez, los apostadores que aún están vivos (ganando) son exactamente los que empezaron en una posición de solapamiento:

- El apostador que entró en el instante $T - 10$ completó los 11 pasos: tiene $26^{11}$.
- El apostador que entró en el instante $T - 3$ completó 4 pasos (las últimas 4 letras = ABRA = prefijo de longitud 4): tiene $26^4$.
- El apostador que entró en el instante $T$ completó 1 paso (la última letra = A = prefijo de longitud 1): tiene $26^1$.

El casino recibió \$1 de cada uno de los $T$ apostadores que entraron. El proceso total es una martingala, así que por el teorema de parada opcional:

$$E[T] = E[\text{pago total al tiempo } T] = 26^{11} + 26^4 + 26^1$$

**Paso 3 — Resultado.**

$$\boxed{E[T] = 26^{11} + 26^4 + 26 = 3{,}670{,}344{,}486{,}987{,}776 + 456{,}976 + 26 \approx 3.67 \times 10^{15} \text{ teclas}}$$

---

#### Comparación con otra palabra de 11 letras

Tomemos ABRACADABRC (sin solapamiento consigo misma salvo el trivial $k=11$):

$$E[T_{\text{ABRACADABRC}}] = 26^{11} \approx 3.67 \times 10^{15}$$

$$E[T_{\text{ABRACADABRA}}] = 26^{11} + 26^4 + 26 \approx 3.67 \times 10^{15} + 457{,}002$$

ABRACADABRA tarda *más* que ABRACADABRC. Su auto-solapamiento hace que cuando casi terminás pero fallás, parte del progreso queda aprovechado — pero también hace que cuando aparece por primera vez, haya apostadores extra que cobran, lo que eleva la esperanza.

---

#### Fórmula general (de Conway)

Para cualquier patrón $W = w_1 w_2 \ldots w_n$ sobre un alfabeto de tamaño $m$:

$$E[T_W] = \sum_{\substack{k=1 \\ w_1\cdots w_k = w_{n-k+1}\cdots w_n}}^{n} m^k$$

La suma recorre todos los $k$ en que el prefijo de longitud $k$ coincide con el sufijo de longitud $k$.

| Patrón | Longitud | Solapamientos | $E[T]$ |
|:---:|:---:|:---:|:---:|
| HH (moneda) | 2 | $k=1,2$ | $2^1 + 2^2 = 6$ |
| HT (moneda) | 2 | $k=2$ | $2^2 = 4$ |
| ABRACADABRA | 11 | $k=1,4,11$ | $26^{11} + 26^4 + 26$ |
| ABRACADABRC | 11 | $k=11$ | $26^{11}$ |

---

## Ejercicio 13.
Se eligen tres puntos aleatoriamente en el círculo unitario. Estos determinan tres arcos, ¿cuál es la esperanza de la longitud del arco que contiene al $(1, 0)$?

### Solución

#### ¿Por qué es sorprendente?

Los tres arcos determinados por los puntos aleatorios tienen, en promedio, longitud $\frac{2\pi}{3}$ cada uno (un tercio de la circunferencia). La intuición dice que el arco que contiene a $(1, 0)$ debería ser uno de esos tres arcos "típicos", con esperanza $\frac{2\pi}{3}$.

Sin embargo, el resultado es $\pi$ — **la mitad de la circunferencia**, que es $\frac{3}{2}$ veces el promedio de los arcos. El arco que contiene a $(1,0)$ es más largo en promedio porque $(1,0)$ tiene mayor probabilidad de caer en los arcos más grandes. Este es el **sesgo por tamaño** (size bias).

---

#### Idea clave: estadísticos de orden + sesgo por tamaño

El punto $(1,0)$ es fijo, no aleatorio. Por eso el arco que lo contiene no es un arco elegido al azar entre los tres — es el arco "más tentador" para contenerlo, y los arcos grandes lo contienen con más frecuencia. Calculamos la esperanza directamente via estadísticos de orden.

---

#### Resolución paso a paso

**Paso 1 — Parametrización.**

Parametrizamos el círculo unitario por el ángulo $\theta \in [0, 2\pi)$, con $(1,0)$ en $\theta = 0$. Los tres puntos aleatorios tienen ángulos $\Theta_1, \Theta_2, \Theta_3$ independientes y uniformes en $[0, 2\pi)$.

Sean $\Theta_{(1)} \leq \Theta_{(2)} \leq \Theta_{(3)}$ los estadísticos de orden (ángulos ordenados).

**Paso 2 — Longitud del arco que contiene a $\theta = 0$.**

El arco que contiene a $\theta = 0$ va desde $\Theta_{(3)}$ (el último punto en sentido antihorario antes de volver a 0) hasta $\Theta_{(1)}$ (el primer punto en sentido antihorario después de 0). Su longitud es:

$$L = \Theta_{(1)} + \bigl(2\pi - \Theta_{(3)}\bigr)$$

El primer sumando es la distancia de 0 al primer punto en sentido antihorario, y el segundo es la distancia del último punto a 0 dando la vuelta.

**Paso 3 — Esperanza de los estadísticos de orden.**

Para $n = 3$ variables uniformes en $[0, 2\pi)$:

$$E[\Theta_{(k)}] = \frac{k}{n+1} \cdot 2\pi = \frac{k}{4} \cdot 2\pi$$

Entonces:

$$E[\Theta_{(1)}] = \frac{2\pi}{4} = \frac{\pi}{2}, \qquad E[\Theta_{(3)}] = \frac{3 \cdot 2\pi}{4} = \frac{3\pi}{2}$$

**Paso 4 — Esperanza de la longitud del arco.**

Por linealidad de la esperanza:

$$E[L] = E[\Theta_{(1)}] + 2\pi - E[\Theta_{(3)}] = \frac{\pi}{2} + 2\pi - \frac{3\pi}{2} = \frac{\pi}{2} + \frac{\pi}{2}$$

$$\boxed{E[L] = \pi}$$

La mitad de la circunferencia del círculo unitario.

---

#### Interpretación: sesgo por tamaño

¿Por qué $\pi$ y no $\frac{2\pi}{3}$? El punto $(1,0)$ es fijo, y un punto fijo cae en el arco $i$ con probabilidad proporcional a su longitud $L_i$. Entonces el arco seleccionado no es uno al azar — está sesgado hacia los arcos más largos.

Formalmente, si los arcos tienen longitudes $L_1, L_2, L_3$ (con $L_1 + L_2 + L_3 = 2\pi$), entonces $(1,0)$ cae en el arco $i$ con probabilidad $L_i / (2\pi)$. La esperanza de la longitud del arco que lo contiene es:

$$E[L] = \sum_{i=1}^{3} E\!\left[L_i \cdot \frac{L_i}{2\pi}\right] = \frac{E[L_1^2 + L_2^2 + L_3^2]}{2\pi}$$

Los arcos $(L_1/2\pi, L_2/2\pi, L_3/2\pi)$ se distribuyen como $\text{Dirichlet}(1,1,1)$ (uniforme en el símplex). Para esta distribución: $E[x_i^2] = \frac{1 \cdot 2}{3 \cdot 4} = \frac{1}{6}$. Por lo tanto:

$$E[L_i^2] = (2\pi)^2 \cdot \frac{1}{6} = \frac{2\pi^2}{3}$$

$$E[L] = \frac{3 \cdot \frac{2\pi^2}{3}}{2\pi} = \frac{2\pi^2}{2\pi} = \pi \checkmark$$

---

#### Tabla: comparación entre arco aleatorio y arco con sesgo

| | Arco aleatorio | Arco que contiene $(1,0)$ |
|:---|:---:|:---:|
| Esperanza de longitud | $\dfrac{2\pi}{3} \approx 2.09$ | $\pi \approx 3.14$ |
| Fracción de la circunferencia | $\dfrac{1}{3}$ | $\dfrac{1}{2}$ |
| Factor de sesgo | $1$ | $\dfrac{3}{2}$ |

El factor $3/2$ coincide con $\frac{E[L_i^2]}{E[L_i]^2} = \frac{2\pi^2/3}{(2\pi/3)^2} = \frac{3}{2}$, que es el factor de inflación estándar por sesgo de tamaño.

---

#### Generalización

Para $n$ puntos uniformes en un círculo, la longitud esperada del arco que contiene a un punto fijo es:

$$E[L] = \frac{2}{n+1} \cdot \pi = \frac{2\pi}{n+1} \cdot \frac{n}{2} \cdot \frac{2}{n} $$

Más directo: con $n$ puntos, los estadísticos de orden satisfacen $E[\Theta_{(1)}] = \frac{2\pi}{n+1}$ y $E[\Theta_{(n)}] = \frac{n \cdot 2\pi}{n+1}$, así:

$$E[L] = \frac{2\pi}{n+1} + 2\pi - \frac{n \cdot 2\pi}{n+1} = \frac{2 \cdot 2\pi}{n+1} = \frac{4\pi}{n+1}$$

Para $n=3$: $E[L] = \frac{4\pi}{4} = \pi$. ✓

Cuando $n \to \infty$, el arco esperado se achica como $4\pi/(n+1)$ pero siempre es el doble del arco promedio $2\pi/n$ (el factor de sesgo tiende a 2).

---

## Ejercicio 14. (Paradoja del inspector)
Charly y Tincho están a cargo de medir la frecuencia del 107. Tincho se acerca en momentos al azar a la parada, espera que venga un colectivo y luego controla cuanto tiempo tarda en venir el siguiente. Charly se enteró que el quiosquero anota cada vez que pasa un colectivo. Entonces va a la parada en momentos al azar, le pregunta al quiosquero cuándo pasó el último colectivo, espera que venga el siguiente y calcula la diferencia entre esos tiempos. Ambos calculan la frecuencia tomando promedio de sus mediciones. ¿Van a obtener el mismo promedio a la larga?

### Solución

#### ¿Por qué es paradójico?

La intuición dice que ambos miden "el tiempo entre dos colectivos consecutivos", así que deberían obtener el mismo promedio. Charly mide un intervalo entero (del último al siguiente), Tincho mide solo la segunda mitad (del arribo al siguiente) — así que a lo sumo los promedios difieren por un factor constante.

La trampa es más profunda: **el intervalo que Charly observa no es un intervalo típico**. Al llegar en un momento al azar, Charly tiene mayor probabilidad de caer dentro de un intervalo largo. Es exactamente el mismo sesgo por tamaño del Ejercicio 13: los arcos más grandes son más propensos a contener un punto fijo.

El resultado: **no, no obtienen el mismo promedio**. Charly siempre obtiene el doble que Tincho.

---

#### Idea clave: sesgo por tamaño (size bias)

Al llegar en un instante aleatorio, la probabilidad de caer en el intervalo $[t_k, t_{k+1}]$ es proporcional a su longitud $X_k = t_{k+1} - t_k$. Los intervalos largos se ven con más frecuencia — igual que en el Ejercicio 13, donde el arco que contiene a $(1,0)$ es más largo en promedio.

---

#### Resolución paso a paso

Modelamos los colectivos como un **proceso de renovación**: los tiempos entre colectivos son variables aleatorias i.i.d. $X_1, X_2, \ldots$ con media $\mu = E[X]$ y segundo momento $E[X^2]$.

**¿Qué mide cada uno?**

Sea $T$ el instante (aleatorio, uniforme) en que cada uno llega a la parada. Hay un intervalo entre colectivos que contiene a $T$: el anterior llegó en $t_-$ y el siguiente llegará en $t_+$.

- **Tincho** mide: $t_+ - T$ (tiempo de espera hacia adelante = *tiempo de recurrencia hacia adelante*).
- **Charly** mide: $t_+ - t_-$ (longitud total del intervalo que contiene a $T$).

La medición de Charly es exactamente el doble conceptual: es el intervalo completo, mientras que Tincho mide solo la mitad derecha.

**Paso 1 — Distribución del intervalo observado (sesgo por tamaño).**

La probabilidad de que el instante $T$ caiga en el intervalo de longitud $x$ es proporcional a $x$. Entonces la longitud $\tilde{X}$ del intervalo que ve Charly tiene distribución **size-biased** de $X$:

$$P(\tilde{X} \in dx) = \frac{x}{\mu} f_X(x)\,dx$$

Su esperanza es:

$$E[\tilde{X}] = \int_0^\infty x \cdot \frac{x}{\mu} f_X(x)\,dx = \frac{E[X^2]}{\mu}$$

**Paso 2 — Esperanza de la medición de Tincho.**

Dado que el intervalo observado tiene longitud $\tilde{X}$, el arribo de Tincho cae uniformemente dentro de ese intervalo (condicional en $\tilde{X}$). Por lo tanto, su tiempo de espera es $\text{Uniform}(0, \tilde{X})$, con esperanza $\tilde{X}/2$. En total:

$$E[\text{Tincho}] = E\!\left[\frac{\tilde{X}}{2}\right] = \frac{E[\tilde{X}]}{2} = \frac{E[X^2]}{2\mu}$$

**Paso 3 — Comparación.**

$$\frac{E[\text{Charly}]}{E[\text{Tincho}]} = \frac{E[X^2]/\mu}{E[X^2]/(2\mu)} = 2$$

$$\boxed{E[\text{Charly}] = 2 \cdot E[\text{Tincho}] \quad \text{siempre}}$$

Los promedios nunca son iguales: Charly siempre obtiene exactamente el doble que Tincho, independientemente de la distribución de los tiempos entre colectivos.

---

#### Caso concreto: colectivos con proceso de Poisson

Si los colectivos llegan como proceso de Poisson con tasa $\lambda$ (tiempos entre llegadas $X \sim \text{Exp}(\lambda)$), entonces $\mu = 1/\lambda$ y $E[X^2] = 2/\lambda^2$.

**Tincho** (propiedad de falta de memoria de la exponencial): llega en un momento aleatorio y espera al próximo colectivo. Como la exponencial no tiene memoria, su espera es $\text{Exp}(\lambda)$ sin importar cuándo llegó:

$$E[\text{Tincho}] = \frac{1}{\lambda} = \mu \quad \checkmark \text{ (estimación correcta)}$$

**Charly** mide el intervalo completo que contiene su arribo. El intervalo observado tiene distribución size-biased de $\text{Exp}(\lambda)$, que resulta ser $\text{Gamma}(2, \lambda)$ con media $2/\lambda$:

$$E[\text{Charly}] = \frac{E[X^2]}{\mu} = \frac{2/\lambda^2}{1/\lambda} = \frac{2}{\lambda} = 2\mu \quad \text{(sobreestima por un factor 2)}$$

---

#### Tabla comparativa

| Distribución $X$ | $\mu = E[X]$ | $E[\text{Tincho}]$ | $E[\text{Charly}]$ | Factor de sesgo |
|:---|:---:|:---:|:---:|:---:|
| Determinista ($X = \mu$ siempre) | $\mu$ | $\mu/2$ | $\mu$ | 1 |
| Exponencial (Poisson) | $1/\lambda$ | $1/\lambda$ | $2/\lambda$ | 2 |
| General | $\mu$ | $\dfrac{E[X^2]}{2\mu}$ | $\dfrac{E[X^2]}{\mu}$ | 2 |

En el caso determinista (colectivos perfectamente regulares), Tincho subestima a la mitad (llega a mitad de intervalo en promedio) y Charly acierta. En el Poisson, Tincho acierta y Charly sobreestima al doble. En todos los casos, Charly = 2 × Tincho.

---

#### Conexión con el Ejercicio 13

Este ejercicio es la versión temporal del Ejercicio 13. En aquel ejercicio, el arco que contiene al punto fijo $(1,0)$ tiene esperanza $\pi$ (el doble del arco promedio $2\pi/3$) porque los arcos más largos "atrapan" al punto con mayor probabilidad. Aquí, el intervalo que contiene al instante aleatorio $T$ tiene esperanza $E[X^2]/\mu \geq \mu$ por la misma razón. El sesgo por tamaño es el mismo fenómeno.

---

#### Generalización

Para cualquier distribución de $X$ con $\text{CV}^2 = \text{Var}(X)/E[X]^2$:

$$E[\text{Charly}] = \mu (1 + \text{CV}^2) \geq \mu$$

$$E[\text{Tincho}] = \frac{\mu}{2}(1 + \text{CV}^2)$$

El factor $1 + \text{CV}^2 \geq 1$ es la inflación por variabilidad: cuanto más irregulares los colectivos, mayor el sesgo. Para colectivos perfectamente regulares ($\text{CV} = 0$), Charly mide exactamente $\mu$ y Tincho mide $\mu/2$.

---

## Ejercicio 15.
Se eligen dos puntos aleatoriamente en el intervalo $[0, 1]$. Estos determinan tres segmentos, ¿cuál es la probabilidad de que se pueda formar un triángulo con dichos segmentos?

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que la mayoría de las veces los tres segmentos "se ven razonables" y deberían poder formar un triángulo. Al fin y al cabo, los puntos son aleatorios y nada los fuerza a crear un segmento enorme. Sin embargo, la probabilidad es solo $\frac{1}{4}$.

La trampa es que para que NO haya triángulo, basta con que **uno solo** de los tres segmentos sea mayor que $\frac{1}{2}$. Eso ocurre con probabilidad $\frac{3}{4}$.

---

#### Idea clave: desigualdad triangular simplificada

Si los tres segmentos tienen longitudes $a, b, c$ con $a + b + c = 1$, las tres desigualdades triangulares ($a+b>c$, $a+c>b$, $b+c>a$) se reducen a una sola condición:

$$\text{triángulo posible} \iff a < \tfrac{1}{2},\ b < \tfrac{1}{2},\ c < \tfrac{1}{2}$$

Esto es porque, por ejemplo, $b + c > a$ equivale a $(1 - a) > a$, es decir, $a < \frac{1}{2}$.

El problema se reduce a: **¿cuál es la probabilidad de que ningún trozo supere la mitad?**

---

#### Resolución paso a paso

Sean $U, V$ independientes y uniformes en $[0,1]$. Los dos puntos crean tres segmentos de longitudes $a = \min(U,V)$, $b = |U-V|$, $c = 1 - \max(U,V)$.

**Enfoque 1 — Coordenadas (cálculo directo).**

Por simetría, basta considerar el caso $U < V$ (que ocurre con prob $\frac{1}{2}$, y el caso $V < U$ es idéntico). Entonces $a = U$, $b = V - U$, $c = 1 - V$, y las condiciones son:

$$U < \tfrac{1}{2}, \qquad V - U < \tfrac{1}{2}, \qquad V > \tfrac{1}{2}$$

La última condición ($c < 1/2$) equivale a $V > 1/2$. Dado $U < V$, como $U < 1/2$ y $V > 1/2$, la condición $V > U$ se satisface automáticamente. Entonces la región favorable es:

$$U \in \left(0, \tfrac{1}{2}\right), \qquad V \in \left(\tfrac{1}{2},\ U + \tfrac{1}{2}\right)$$

Calculamos su área en el cuadrado unitario:

$$\int_0^{1/2} \int_{1/2}^{U + 1/2} dV\, dU = \int_0^{1/2} U\, dU = \frac{U^2}{2}\bigg|_0^{1/2} = \frac{1}{8}$$

La región $\{U < V\}$ tiene área $\frac{1}{2}$, así que:

$$P(\text{triángulo} \mid U < V) = \frac{1/8}{1/2} = \frac{1}{4}$$

Por simetría, $P(\text{triángulo}) = \frac{1}{4}$.

---

**Enfoque 2 — Geométrico (el más elegante).**

El vector $(a, b, c)$ con $a+b+c = 1$, $a,b,c \geq 0$ tiene distribución uniforme en el **símplex estándar** (triángulo equilátero con vértices en $(1,0,0)$, $(0,1,0)$, $(0,0,1)$).

La región favorable $\{a < 1/2,\ b < 1/2,\ c < 1/2\}$ es el **triángulo medial**: el triángulo formado por los puntos medios de los lados del símplex, con vértices en $(\frac{1}{2}, \frac{1}{2}, 0)$, $(\frac{1}{2}, 0, \frac{1}{2})$, $(0, \frac{1}{2}, \frac{1}{2})$.

El triángulo medial es semejante al original con razón $\frac{1}{2}$, por lo que su área es $\left(\frac{1}{2}\right)^2 = \frac{1}{4}$ la del símplex total.

$$\boxed{P(\text{triángulo}) = \frac{1}{4}}$$

Los tres triángulos "malos" (donde $a \geq \frac{1}{2}$, $b \geq \frac{1}{2}$, o $c \geq \frac{1}{2}$) son semejantes al símplex con razón $\frac{1}{2}$, cada uno con área $\frac{1}{4}$. No se solapan (no pueden dos segmentos ser simultáneamente $\geq \frac{1}{2}$, pues sumarían más que 1). Cubren $3 \times \frac{1}{4} = \frac{3}{4}$ del símplex, y el triángulo medial ocupa el $\frac{1}{4}$ restante.

---

#### Diagrama del símplex

```
(1,0,0)
   /\
  /  \   ← región mala: a ≥ 1/2
 /----\
(1/2 ,*)---(*,1/2)   ← triángulo medial (bueno): área = 1/4
 \  /\/  /
  \/  \/
  /----\
 /  \/  \
(0,1,0)---(0,0,1)
```

Los tres triángulos de las esquinas (malos) tienen área $\frac{1}{4}$ cada uno. El triángulo central (bueno) también tiene área $\frac{1}{4}$.

---

#### Tabla de casos

| Condición | Probabilidad |
|:---|:---:|
| $a \geq \frac{1}{2}$ (segmento izquierdo muy largo) | $\frac{1}{4}$ |
| $b \geq \frac{1}{2}$ (segmento central muy largo) | $\frac{1}{4}$ |
| $c \geq \frac{1}{2}$ (segmento derecho muy largo) | $\frac{1}{4}$ |
| Ninguno $\geq \frac{1}{2}$ (triángulo posible) | $\frac{1}{4}$ |
| **Total** | $1$ |

Los cuatro casos son equiprobables y disjuntos (no pueden superponerse).

---

#### Generalización

Si se eligen $n-1$ puntos uniformes en $[0,1]$ y se forman $n$ segmentos, la probabilidad de que formen un polígono de $n$ lados (usando la desigualdad generalizada: ningún lado supera la suma de los demás, equivalente a ningún lado $\geq \frac{1}{2}$) es:

$$P = \frac{n}{2^{n-1}}$$

Para $n = 3$: $P = \frac{3}{4}$... espera, eso es la probabilidad de que algún segmento supere $\frac{1}{2}$.

Más precisamente, la probabilidad de que los $n$ segmentos formen un $n$-gon (condición: ningún lado $\geq$ suma de los demás $\Leftrightarrow$ ninguno $\geq \frac{1}{2}$) es:

$$P(\text{n-gon}) = 1 - \frac{n}{2^{n-1}}$$

Para $n=3$: $P = 1 - \frac{3}{4} = \frac{1}{4}$. ✓

---

## Ejercicio 16.
Se eligen tres puntos aleatoriamente en un círculo. Estos determinan un triángulo, ¿cuál es la probabilidad de que el triángulo contenga al centro del círculo?

### Solución

#### ¿Por qué es sorprendente?

La intuición dice que el centro está "adentro" del círculo, y los puntos también, así que debería ser probable que el triángulo lo encierre. Pero la respuesta es solo $\frac{1}{4}$ — la misma que el Ejercicio 15.

Esto no es coincidencia: ambos problemas son esencialmente el mismo, y la condición que falla en cada caso es idéntica.

---

#### Idea clave: el centro queda adentro ↔ ningún semicírculo contiene los tres puntos

El centro $O$ está dentro del triángulo si y solo si, al pararse en $O$ y mirar hacia cada vértice, los tres vértices "rodean" los 360°. Equivalentemente:

$$\text{centro adentro} \iff \text{ningún semicírculo abierto contiene los tres puntos}$$

$$\iff \text{los tres arcos determinados por los puntos son todos} < \pi$$

Esta segunda equivalencia conecta directamente con el Ejercicio 15: los tres arcos $(a, b, c)$ con $a + b + c = 2\pi$ son uniformes en el símplex escalado, y la condición "todos $< \pi$" es "todos $< \frac{1}{2}$ del total". Eso tiene probabilidad $\frac{1}{4}$.

---

#### Resolución — Enfoque 1: reducción al Ejercicio 15

Los tres puntos $P_1, P_2, P_3$ uniformes en el círculo determinan tres arcos de longitudes $a, b, c$ con $a + b + c = 2\pi$ y $(a/2\pi, b/2\pi, c/2\pi)$ uniforme en el símplex.

La condición para que el centro esté adentro es $a < \pi$, $b < \pi$, $c < \pi$, es decir, cada arco es menor que la mitad de la circunferencia. Esto es exactamente la condición del Ejercicio 15 con los segmentos siendo $a/2\pi$, $b/2\pi$, $c/2\pi$ y el umbral $\frac{1}{2}$:

$$\boxed{P(\text{centro adentro}) = \frac{1}{4}}$$

---

#### Resolución — Enfoque 2: el argumento del semicírculo (más elegante)

Para cada punto $P_i$, definimos el evento:

$$A_i = \{\text{el semicírculo abierto que comienza en } P_i \text{ (sentido antihorario) contiene a los otros dos}\}$$

**¿Por qué los $A_i$ son disjuntos a.s.?** Si todos los puntos están en algún semicírculo, hay un único punto $P_i$ que es el "extremo inicial" del semicírculo cobertor mínimo. Ese es el único $A_i$ que puede ocurrir. Los tres eventos $A_1, A_2, A_3$ cubren todos los casos posibles en que los puntos están en algún semicírculo.

**¿Cuánto vale $P(A_i)$?** Fijado $P_i$, cada uno de los otros dos puntos cae independientemente en el semicírculo $[P_i, P_i + \pi)$ con probabilidad $\frac{1}{2}$:

$$P(A_i) = \left(\frac{1}{2}\right)^2 = \frac{1}{4}$$

**Probabilidad de que los tres estén en algún semicírculo:**

$$P(A_1 \cup A_2 \cup A_3) = P(A_1) + P(A_2) + P(A_3) = 3 \times \frac{1}{4} = \frac{3}{4}$$

Por lo tanto:

$$\boxed{P(\text{centro adentro}) = 1 - \frac{3}{4} = \frac{1}{4}}$$

---

#### Verificación directa por coordenadas

Fijamos $P_1$ en el ángulo $0$. Los otros dos ángulos $\alpha$ (de $P_2$) y $\beta$ (de $P_3$) son uniformes en $[0, 2\pi)$. Suponemos $0 < \alpha < \beta < 2\pi$ (caso simétrico). Los tres arcos son $\alpha$, $\beta - \alpha$, $2\pi - \beta$. La condición es:

$$\alpha < \pi, \qquad \beta - \alpha < \pi, \qquad \beta > \pi$$

Con $U = \alpha/(2\pi)$ y $V = \beta/(2\pi)$, esto se convierte exactamente en:

$$U < \tfrac{1}{2}, \qquad V - U < \tfrac{1}{2}, \qquad V > \tfrac{1}{2}$$

Que es el mismo cálculo del Ejercicio 15, con resultado $\frac{1}{4}$. ✓

---

#### Conexión con Ejercicio 15

| | Ejercicio 15 | Ejercicio 16 |
|:---|:---:|:---:|
| Objeto | Segmento $[0,1]$ | Círculo |
| Puntos | 2 puntos aleatorios | 3 puntos aleatorios |
| Piezas | 3 segmentos $a+b+c=1$ | 3 arcos $a+b+c=2\pi$ |
| Condición | $a,b,c < \frac{1}{2}$ | $a,b,c < \pi$ |
| Significado | Triángulo posible | Centro adentro |
| Probabilidad | $\frac{1}{4}$ | $\frac{1}{4}$ |

Ambos problemas son instancias del mismo fenómeno: tres piezas aleatorias (uniformes en el símplex) y la condición de que ninguna supere la mitad del total.

---

#### Generalización

Para $n$ puntos en un círculo y la condición de que ningún semicírculo los contenga a todos:

$$P(\text{ningún semicírculo los contiene}) = 1 - \frac{n}{2^{n-1}}$$

| $n$ puntos | $P(\text{centro adentro del polígono})$ |
|:---:|:---:|
| 3 | $\frac{1}{4} = 25\%$ |
| 4 | $\frac{1}{2} = 50\%$ |
| 5 | $\frac{11}{16} \approx 68.75\%$ |
| $n$ grande | $\to 1$ |

Con más puntos, el polígono cubre más y es más probable que encierre el centro.

---

## Ejercicio 17.
Una enfermedad tiene una prevalencia del 1% en la población. Un test da positivo con una probabilidad del 99% si una persona está enferma y con una probabilidad del 1% si la persona no está enferma. Si a una persona al azar la testeamos y da positivo, ¿cuál es la probabilidad de que realmente esté enferma?

### Solución

#### ¿Por qué es paradójico?

La intuición dice: *"el test acierta el 99% de las veces, así que si da positivo, casi seguro que estoy enfermo."*

El resultado real es **50%**. Un test con 99% de precisión, aplicado a alguien que dio positivo, solo garantiza que hay una chance de uno a dos de estar enfermo. Esto desconcierta a médicos, estudiantes y al público general por igual.

El error intuitivo es ignorar la **prevalencia**: la enfermedad es muy rara (solo 1 de cada 100 personas la tiene), entonces en la población hay muchísimos sanos que pueden dar falso positivo, y eso "contamina" el resultado positivo.

---

#### Idea clave

**Teorema de Bayes**: actualizar una probabilidad a priori ($P(E)$) con la evidencia del test para obtener la probabilidad a posteriori ($P(E \mid +)$).

$$P(E \mid +) = \frac{P(+ \mid E)\, P(E)}{P(+)}$$

donde $P(+)$ se calcula por **probabilidad total**, descomponiendo según si la persona está enferma o no.

---

#### Resolución paso a paso

**Definir eventos:**

- $E$ = la persona está enferma
- $+$ = el test da positivo

**Datos del problema:**

| Dato | Notación | Valor |
|------|----------|-------|
| Prevalencia | $P(E)$ | $0{,}01$ |
| Sano | $P(E^c)$ | $0{,}99$ |
| Sensibilidad (verdadero positivo) | $P(+ \mid E)$ | $0{,}99$ |
| Tasa de falso positivo | $P(+ \mid E^c)$ | $0{,}01$ |

**Paso 1 — Probabilidad total de dar positivo:**

$$P(+) = P(+ \mid E)\,P(E) + P(+ \mid E^c)\,P(E^c)$$

$$P(+) = 0{,}99 \cdot 0{,}01 + 0{,}01 \cdot 0{,}99 = 0{,}0099 + 0{,}0099 = 0{,}0198$$

**Paso 2 — Aplicar Bayes:**

$$P(E \mid +) = \frac{P(+ \mid E)\,P(E)}{P(+)} = \frac{0{,}99 \cdot 0{,}01}{0{,}0198} = \frac{0{,}0099}{0{,}0198}$$

$$\boxed{P(E \mid +) = 0{,}5 = 50\%}$$

---

#### Interpretación con frecuencias naturales

Una forma más concreta de ver por qué el resultado es 50%: imaginemos **10.000 personas**.

| Grupo | Cantidad | Test positivo | Test negativo |
|-------|----------|---------------|---------------|
| Enfermos ($1\%$) | 100 | $99$ (verdadero +) | $1$ (falso −) |
| Sanos ($99\%$) | 9.900 | $99$ (falso +) | $9.801$ (verdadero −) |
| **Total** | 10.000 | **198** | 9.802 |

De los **198 positivos**, solo **99 están realmente enfermos**:

$$P(E \mid +) = \frac{99}{198} = \frac{1}{2} = 50\%$$

Los 99 verdaderos positivos quedan exactamente igualados por los 99 falsos positivos. El efecto de la baja prevalencia cancela la alta precisión del test.

---

#### ¿Cuándo el test sería más informativo?

La paradoja surge porque $P(E)$ es muy baja. Si la prevalencia cambia, cambia todo:

| Prevalencia $P(E)$ | $P(E \mid +)$ |
|--------------------|---------------|
| $1\%$ | $50\%$ |
| $5\%$ | $84\%$ |
| $10\%$ | $92\%$ |
| $50\%$ | $99\%$ |

La conclusión práctica: **un test positivo es mucho más informativo cuando se aplica a poblaciones de alto riesgo** (prevalencia alta) que a la población general.

---

#### Generalización

Para un test con sensibilidad $s = P(+\mid E)$ y tasa de falso positivo $f = P(+\mid E^c)$, aplicado a una población con prevalencia $\pi = P(E)$:

$$P(E \mid +) = \frac{s\,\pi}{s\,\pi + f\,(1-\pi)}$$

En este ejercicio $s = 0{,}99$ y $f = 0{,}01$. Como $\pi = 0{,}01$ y $1-\pi = 0{,}99$, los dos términos del denominador resultan idénticos, dando exactamente $1/2$.

La condición para que $P(E\mid+) = 1/2$ es precisamente $s\,\pi = f\,(1-\pi)$, es decir, cuando la prevalencia es tan baja que los verdaderos y falsos positivos se equilibran.

---

## Ejercicio 18.
Una placa de Petri contiene una bacteria. Cada un segundo esta bacteria se duplica con probabilidad $p$ o muere. ¿Cuál es la probabilidad de que la colonia viva para siempre?

### Solución

#### ¿Por qué es paradójico?

La intuición dice: *"si la bacteria tiene más chances de duplicarse que de morir, la colonia debería sobrevivir con alta probabilidad."*

El resultado sorprendente es que **para $p \leq \frac{1}{2}$ la extinción es segura** — incluso si cada bacteria tiene exactamente 50% de chance de duplicarse, la colonia inevitablemente muere. Y para $p > \frac{1}{2}$, la probabilidad de sobrevivir no es $2p - 1$ de forma obvia, sino que requiere un cálculo cuidadoso.

El truco está en que la colonia se extingue si **todas** las ramas del árbol genealógico se extinguen, y eso ocurre con más frecuencia de lo que parece.

---

#### Idea clave

**Proceso de ramificación de Galton-Watson**: modelar la colonia como un árbol donde cada bacteria genera descendientes de forma independiente. La probabilidad de extinción $q$ satisface una **ecuación de punto fijo** obtenida condicionando en lo que hace la primera bacteria.

---

#### Resolución paso a paso

Sea $q$ = probabilidad de que la colonia se extinga eventualmente (partiendo de 1 bacteria).

**Paso 1 — Ecuación de punto fijo:**

Condicionamos en lo que le pasa a la primera bacteria:

- Con probabilidad $1-p$: muere $\Rightarrow$ la colonia se extingue con certeza.
- Con probabilidad $p$: se duplica $\Rightarrow$ quedan 2 bacterias independientes, cada una con su propia colonia que se extingue con probabilidad $q$. Ambas deben extinguirse, lo cual ocurre con probabilidad $q^2$.

Entonces:

$$q = (1-p) + p\,q^2$$

**Paso 2 — Resolver la ecuación cuadrática:**

Reordenando:

$$p\,q^2 - q + (1-p) = 0$$

Aplicando la fórmula cuadrática:

$$q = \frac{1 \pm \sqrt{1 - 4p(1-p)}}{2p} = \frac{1 \pm \sqrt{(1-2p)^2}}{2p} = \frac{1 \pm |1-2p|}{2p}$$

Las dos soluciones son siempre:

$$q = 1 \qquad \text{y} \qquad q = \frac{1-p}{p}$$

**Paso 3 — Elegir la solución correcta:**

La probabilidad de extinción $q$ es el **menor punto fijo en $[0,1]$** de la función $f(q) = (1-p) + pq^2$.

- Si $p \leq \dfrac{1}{2}$: entonces $\dfrac{1-p}{p} \geq 1$, así que la única solución en $[0,1]$ es $q = 1$. La extinción es **segura**.

- Si $p > \dfrac{1}{2}$: entonces $\dfrac{1-p}{p} < 1$, y el menor punto fijo es $q = \dfrac{1-p}{p}$.

**Paso 4 — Probabilidad de supervivencia eterna:**

$$P(\text{colonia vive para siempre}) = 1 - q$$

$$\boxed{P(\text{supervivencia}) = \begin{cases} 0 & \text{si } p \leq \dfrac{1}{2} \\[8pt] \dfrac{2p - 1}{p} & \text{si } p > \dfrac{1}{2} \end{cases}}$$

---

#### Verificación intuitiva

La progenie esperada de cada bacteria es $\mathbb{E}[\text{hijos}] = 0 \cdot (1-p) + 2 \cdot p = 2p$.

| Régimen | Condición | Extinción |
|---------|-----------|-----------|
| Subcrítico | $2p < 1 \;\Leftrightarrow\; p < \frac{1}{2}$ | Segura ($q=1$) |
| Crítico | $2p = 1 \;\Leftrightarrow\; p = \frac{1}{2}$ | Segura ($q=1$) |
| Supercrítico | $2p > 1 \;\Leftrightarrow\; p > \frac{1}{2}$ | Posible supervivencia |

El caso crítico ($p = \frac{1}{2}$) es el más sorprendente: aunque en promedio el número de bacterias se mantiene constante, la extinción es **inevitable**. Esto se debe a las fluctuaciones aleatorias que en algún momento llevan la colonia a cero.

---

#### Tabla de valores

| $p$ | $q = \frac{1-p}{p}$ | $P(\text{supervivencia}) = \frac{2p-1}{p}$ |
|-----|---------------------|--------------------------------------------|
| $0{,}50$ | $1{,}00$ | $0\%$ |
| $0{,}60$ | $0{,}667$ | $33{,}3\%$ |
| $0{,}70$ | $0{,}429$ | $57{,}1\%$ |
| $0{,}80$ | $0{,}250$ | $75{,}0\%$ |
| $0{,}90$ | $0{,}111$ | $88{,}9\%$ |
| $1{,}00$ | $0$ | $100\%$ |

Nótese que incluso con $p = 0{,}9$ (la bacteria se duplica 9 de cada 10 veces), hay un $11\%$ de chance de extinción.

---

#### Generalización

Este es el **proceso de Galton-Watson**, el modelo fundamental para poblaciones que se reproducen en generaciones discretas. El resultado general es:

> La probabilidad de extinción $q$ es el menor punto fijo en $[0,1]$ de la función generatriz de probabilidad $G(s) = \sum_k p_k s^k$, donde $p_k$ es la probabilidad de tener $k$ descendientes.
>
> La extinción es **segura** si y solo si $\mathbb{E}[\text{descendientes}] \leq 1$.

En este ejercicio $G(s) = (1-p) + p\,s^2$, con media $2p$. La condición $2p \leq 1$ reproduce exactamente el umbral $p \leq \frac{1}{2}$.

---

## Ejercicio 19.
En un cine hay 100 espectadores y 100 asientos. El primero en entrar decidió sentarse en un asiento al azar. El resto entran en fila y respetan su asiento asignado salvo que al llegar esté ocupado, en cuyo caso se sientan en un lugar libre al azar. ¿Cuál es la probabilidad de que el último encuentre su asiento ocupado?

### Solución

#### ¿Por qué es paradójico?

La intuición dice: *"hay 100 asientos y el primero eligió al azar, así que hay solo un 1% de chance de que haya elegido justamente el asiento del último."* Parece que la respuesta debería estar cerca de 1%.

El resultado real es **50%**, independientemente de si hay 2 o 2 millones de espectadores. Esto sorprende porque parece que con más personas, las perturbaciones se "acumulan" y el caos crece — pero el resultado es siempre el mismo.

---

#### Idea clave

**Argumento de simetría**: los únicos dos asientos que importan para el resultado final son el **asiento 1** (del primer espectador) y el **asiento $n$** (del último). Ambos permanecen disponibles hasta que uno de ellos es elegido en alguna selección aleatoria, y por simetría cada uno tiene igual probabilidad de ser el primero en ser elegido.

---

#### Resolución paso a paso

Numeremos los asientos del 1 al $n$ ($n = 100$) y los espectadores igual: el espectador $k$ tiene asignado el asiento $k$.

**Observación clave — ¿qué asientos quedan disponibles cuando alguien elige al azar?**

Cuando el espectador 1 (o cualquier desplazado) debe elegir aleatoriamente, hay un conjunto de asientos libres. Entre ellos están siempre el asiento 1 y el asiento $n$:

- **Asiento $n$**: nadie lo ocupa deliberadamente — solo el espectador $n$ lo haría, y aún no llegó. Solo puede tomarse por una elección aleatoria.
- **Asiento 1**: nadie lo tiene asignado excepto el espectador 1, que ya se sentó en otro lado. Solo puede tomarse por una elección aleatoria.

Por lo tanto, **los asientos 1 y $n$ siempre están disponibles juntos** hasta que uno de ellos es elegido aleatoriamente.

**Paso 1 — El proceso termina cuando se elige el asiento 1 o el asiento $n$:**

Cada vez que un espectador desplazado elige al azar, puede elegir:
- El **asiento 1** → la cadena de desplazamientos termina. Todos los siguientes espectadores encontrarán su asiento libre, incluyendo el espectador $n$.
- El **asiento $n$** → la cadena termina. El espectador $n$ llega y su asiento está ocupado.
- Cualquier otro **asiento $k$** → el espectador $k$ queda desplazado y deberá elegir aleatoriamente más tarde. Se extiende la cadena.

**Paso 2 — Simetría entre el asiento 1 y el asiento $n$:**

En cada elección aleatoria, el asiento 1 y el asiento $n$ son indistinguibles desde el punto de vista probabilístico — ambos están disponibles y ambos son elegidos con igual probabilidad entre los disponibles. Por lo tanto:

$$P(\text{asiento 1 es elegido antes que el asiento } n) = P(\text{asiento } n \text{ es elegido antes que el asiento 1}) = \frac{1}{2}$$

**Paso 3 — Traducir al resultado pedido:**

$$P(\text{último encuentra su asiento ocupado}) = P(\text{asiento } n \text{ es elegido primero}) = \frac{1}{2}$$

$$\boxed{P = \frac{1}{2}}$$

---

#### Verificación con casos pequeños

**$n = 2$:** El espectador 1 elige al azar entre el asiento 1 y el asiento 2. Con prob $\frac{1}{2}$ elige el 1 (espectador 2 encuentra el suyo libre), con prob $\frac{1}{2}$ elige el 2 (espectador 2 lo encuentra ocupado). $P = \frac{1}{2}$. ✓

**$n = 3$:** El espectador 1 elige:
- Asiento 1 (prob $\frac{1}{3}$): todos bien, espectador 3 libre. Contribuye $0$.
- Asiento 3 (prob $\frac{1}{3}$): espectador 3 lo encuentra ocupado. Contribuye $1$.
- Asiento 2 (prob $\frac{1}{3}$): espectador 2 queda desplazado, elige entre {1, 3} con igual prob. Contribuye $\frac{1}{2}$.

$$P = \frac{1}{3} \cdot 0 + \frac{1}{3} \cdot 1 + \frac{1}{3} \cdot \frac{1}{2} = \frac{1}{3} + \frac{1}{6} = \frac{1}{2}$$ ✓

---

#### Generalización

El resultado es $\frac{1}{2}$ para **cualquier $n \geq 2$**, lo que puede demostrarse formalmente por inducción usando la recursión del caso $n = 3$.

Más aún, el resultado sigue siendo $\frac{1}{2}$ aunque el primer espectador elija su asiento con una distribución no uniforme (siempre que tenga probabilidad positiva de elegir cualquier asiento): lo único que importa es la simetría entre el asiento 1 y el asiento $n$ en los pasos aleatorios.

Este problema es conocido como el **problema del pasajero distraído en el avión** y es uno de los ejemplos más elegantes de cómo un argumento de simetría evita un cálculo engorroso.

---

## Ejercicio 20.
En Probalandia los bebés son varones con probabilidad $0{,}51$ y mujeres con probabilidad $0{,}49$. La tradición es tener hijos hasta que nazca la primera mujer. ¿Cuál es la proporción de bebés mujeres en la población?

### Solución

#### ¿Por qué es paradójico?

La intuición dice: *"como las familias paran de tener hijos cuando nace una mujer, las mujeres deben ser menos comunes — están 'subrepresentadas' porque el proceso se detiene apenas aparecen."*

El resultado real es que la proporción de mujeres es exactamente **$0{,}49$** — idéntica a la probabilidad de nacimiento. La tradición no distorsiona nada.

El error intuitivo es confundir la **regla de parada** (cuándo dejar de tener hijos) con las **probabilidades de nacimiento** (qué tan probable es que cada hijo sea mujer). La regla de parada afecta el tamaño de las familias, pero no puede cambiar la probabilidad de cada nacimiento individual.

---

#### Idea clave

**Linealidad de la esperanza + ley de los grandes números**: la proporción de mujeres en la población es el cociente entre el número esperado de mujeres por familia y el número esperado de hijos por familia. Ambas cantidades se calculan con la distribución geométrica.

---

#### Resolución paso a paso

Sea $p = 0{,}49$ la probabilidad de que un bebé sea mujer y $q = 0{,}51$ la de que sea varón.

**Estructura de cada familia:**

Cada familia tiene hijos hasta la primera mujer. La familia $k$-ésima tiene exactamente $k$ hijos: $k-1$ varones seguidos de $1$ mujer, con probabilidad $q^{k-1} p$.

| Composición | Probabilidad | Mujeres | Hijos totales |
|-------------|-------------|---------|---------------|
| M | $p$ | 1 | 1 |
| VM | $qp$ | 1 | 2 |
| VVM | $q^2 p$ | 1 | 3 |
| $\vdots$ | $\vdots$ | 1 | $\vdots$ |
| $\underbrace{V\cdots V}_{k-1}$M | $q^{k-1}p$ | 1 | $k$ |

**Observación fundamental:** toda familia tiene exactamente **1 mujer**, independientemente de cuántos varones haya antes.

**Paso 1 — Esperanza de mujeres por familia:**

$$\mathbb{E}[\text{mujeres}] = 1$$

(siempre exactamente una, la que detiene el proceso).

**Paso 2 — Esperanza de hijos totales por familia:**

El número de hijos es $X \sim \text{Geométrica}(p)$ (número de intentos hasta el primer éxito):

$$\mathbb{E}[X] = \frac{1}{p} = \frac{1}{0{,}49}$$

**Paso 3 — Proporción de mujeres:**

Por la **ley de los grandes números**, con muchas familias la proporción de mujeres converge a:

$$\text{proporción de mujeres} = \frac{\mathbb{E}[\text{mujeres por familia}]}{\mathbb{E}[\text{hijos por familia}]} = \frac{1}{1/p} = p$$

$$\boxed{\text{proporción de mujeres} = 0{,}49}$$

---

#### Argumento alternativo: cada nacimiento es independiente

Una forma aún más directa: considerá cualquier nacimiento en la población. No importa si es el primero, el segundo o el décimo hijo de una familia — **cada nacimiento es independientemente mujer con probabilidad $0{,}49$**, porque la biología no cambia según el orden de nacimiento.

La regla de parada solo determina cuántos nacimientos ocurren en total en cada familia, pero no puede "seleccionar" qué nacimientos son de mujeres. El último nacimiento de cada familia (el que detiene el proceso) es mujer, sí — pero también es mujer con probabilidad $p$ como cualquier otro, por lo que no hay sesgo.

---

#### ¿Y si la proporción biológica fuera 50/50?

Si $p = 0{,}5$, la proporción en la población sería también exactamente $0{,}5$. Esto refuta la idea de que esta tradición podría "balancear" una población con más varones: la tradición no altera la proporción natural.

| Prob. de mujer ($p$) | Proporción en población |
|----------------------|------------------------|
| $0{,}30$ | $0{,}30$ |
| $0{,}49$ | $0{,}49$ |
| $0{,}50$ | $0{,}50$ |
| $0{,}70$ | $0{,}70$ |

La proporción en la población siempre iguala $p$, sin importar la regla de parada.

---

#### Generalización

Este resultado vale para **cualquier regla de parada** que dependa solo de los nacimientos pasados (no del futuro), siempre que:
1. Cada nacimiento sea independiente con probabilidad fija $p$ de ser mujer.
2. La regla de parada garantice que cada familia tenga al menos un hijo.

En general, si cada familia tiene $N$ hijos (donde $N$ puede ser cualquier variable aleatoria independiente de los sexos), la proporción de mujeres es:

$$\frac{\mathbb{E}[\text{mujeres}]}{\mathbb{E}[N]} = \frac{p \cdot \mathbb{E}[N]}{\mathbb{E}[N]} = p$$

La regla de parada define la distribución de $N$, pero al cancelarse en el cociente, no afecta la proporción.

---

## Ejercicio 21.
En una elección, el candidato A obtuvo 60 votos y el candidato B obtuvo 40. Si los votos se cuentan de uno en uno, ¿cuál es la probabilidad de que, durante todo el escrutinio, el candidato A se mantenga siempre por delante del candidato B?

### Solución

#### ¿Por qué es paradójico?

La intuición dice: *"A ganó 60 a 40, una diferencia cómoda. Debe ser bastante probable que haya estado adelante todo el tiempo."*

El resultado real es solo **20%**. A pesar de ganar por 20 votos, hay un 80% de chance de que en algún momento del conteo B haya empatado o superado a A. La ventaja final no garantiza liderazgo durante el proceso.

---

#### Idea clave

**Lema del ciclo** (Cycle Lemma, Dvoretzky–Motzkin 1947): entre todas las rotaciones circulares de una secuencia de $a$ votos A y $b$ votos B con $a > b$, exactamente $a - b$ de las $a + b$ rotaciones tienen a A estrictamente adelante en todo momento. Esto da la probabilidad directamente.

---

#### Resolución paso a paso

Modelamos el conteo como una **caminata aleatoria**: partimos de 0 y sumamos $+1$ por cada voto A y $-1$ por cada voto B. Queremos que la trayectoria sea estrictamente positiva en todo momento $k = 1, 2, \ldots, 100$.

**Paso 1 — El espacio de posibilidades:**

Una secuencia de conteo es una permutación de 60 A's y 40 B's. Hay $\binom{100}{40}$ secuencias igualmente probables.

**Paso 2 — Lema del ciclo:**

Tomemos una secuencia circular de $n = a + b$ símbolos con $a$ A's y $b$ B's, y consideremos sus $n$ rotaciones lineales (comenzando en cada posición).

> **Lema del ciclo:** entre las $n$ rotaciones de cualquier secuencia circular con suma $a - b > 0$, exactamente $a - b$ de ellas tienen todas las sumas parciales estrictamente positivas.

**Paso 3 — Aplicar el lema a nuestro problema:**

Tomamos una secuencia aleatoria uniforme de 60 A's y 40 B's, y la rotamos por un lugar aleatorio uniforme e independiente. Hay $\binom{100}{40} \cdot 100$ pares (secuencia, rotación) igualmente probables.

Por el lema del ciclo, en cada grupo de 100 rotaciones de una secuencia fija, exactamente $a - b = 20$ son buenas. Entonces:

$$P(\text{A siempre adelante}) = \frac{a - b}{a + b} = \frac{60 - 40}{60 + 40} = \frac{20}{100}$$

Pero el paso adicional es notar que **rotar una secuencia uniforme al azar sigue dando una secuencia uniforme** — la rotación aleatoria no cambia la distribución. Por lo tanto la probabilidad calculada sobre pares (secuencia, rotación) es la misma que sobre secuencias solas:

$$\boxed{P = \frac{a - b}{a + b} = \frac{20}{100} = \frac{1}{5} = 20\%}$$

---

#### Demostración del lema del ciclo

Sea $(x_1, x_2, \ldots, x_n)$ una secuencia circular con $x_i \in \{+1, -1\}$, $n = a+b$, suma total $a - b > 0$. Para cada rotación $r$, definimos las sumas parciales:

$$S_k^{(r)} = x_{r+1} + x_{r+2} + \cdots + x_{r+k} \pmod{n}$$

La rotación $r$ es **buena** si $S_k^{(r)} > 0$ para todo $k = 1, \ldots, n$.

Equivalentemente, $r$ es buena si y solo si la posición $r+1$ es el **mínimo global único** de la secuencia circular acumulada. Como la suma total es $a - b > 0$, hay exactamente $a - b$ posiciones donde ocurren mínimos del tipo "nuevo mínimo estricto desde el inicio circular", lo que da exactamente $a - b$ rotaciones buenas.

---

#### Verificación con casos pequeños

**$a = 2, b = 1$:** Las $\binom{3}{1} = 3$ secuencias son AAB, ABA, BAA.

- **AAB**: sumas parciales $1, 2, 1$ → siempre positivo. ✓
- **ABA**: sumas parciales $1, 0, 1$ → toca 0. ✗
- **BAA**: sumas parciales $-1, 0, 1$ → baja a negativo. ✗

$P = \frac{1}{3} = \frac{a-b}{a+b} = \frac{2-1}{3}$. ✓

---

#### Generalización — Teorema de la Boleta

> **Teorema de la Boleta (Bertrand, 1887):** Si el candidato A obtiene $a$ votos y el candidato B obtiene $b$ votos con $a > b$, la probabilidad de que A esté estrictamente adelante durante todo el escrutinio es:
>
> $$P = \frac{a - b}{a + b}$$

| $a$ | $b$ | $P = \frac{a-b}{a+b}$ |
|-----|-----|----------------------|
| 51 | 49 | $2\%$ |
| 55 | 45 | $10\%$ |
| 60 | 40 | $20\%$ |
| 70 | 30 | $40\%$ |
| 90 | 10 | $80\%$ |
| 100 | 0 | $100\%$ |

Nótese que incluso con una ventaja de 60 a 40 (ganar por 20%), la probabilidad de liderazgo permanente es solo 20%. Se necesita una ventaja muy amplia para que el líder final haya estado casi siempre adelante.

---

## Ejercicio 22.
En un tablero de 2026 columnas por 2025 filas, se construye un laberinto eligiendo al azar si colocar o no una pared en cada lado de los cuadrados unitarios (con probabilidad $1/2$), a excepción de los bordes laterales del tablero, que siempre tienen paredes. Calcular la probabilidad de que exista un camino que permita ir desde arriba del tablero hasta abajo.

### Solución

**1. ¿Por qué es interesante/paradójico?**

A primera vista parece un problema complicado: hay millones de aristas aleatorias y rutas posibles. La intuición dice que la probabilidad debería depender de las dimensiones del tablero de forma no trivial. Sin embargo, la respuesta es exactamente $1/2$, independientemente de que el tablero sea $2026 \times 2025$ en lugar de, por ejemplo, $100 \times 100$. Las dimensiones asimétricas son la clave que activa un argumento elegante.

**2. Idea clave: dualidad planar en percolación de enlaces**

Este es un problema de **percolación de enlaces** (*bond percolation*) en la retícula cuadrada. La herramienta central es la **dualidad planar**: cada grafo planar tiene un grafo dual donde los roles de aristas abiertas y cerradas se intercambian. A $p = 1/2$, el grafo y su dual tienen exactamente la misma distribución. Esto convierte eventos complementarios en eventos equiprobables, forzando a cada uno a tener probabilidad $1/2$.

**3. Resolución paso a paso**

**Paso 1: Modelo formal.**

El tablero tiene $2026$ columnas y $2025$ filas de celdas unitarias. Cada arista interna entre celdas adyacentes (compartida horizontalmente o verticalmente) es **abierta** (sin pared) con probabilidad $1/2$ y **cerrada** (con pared) con probabilidad $1/2$, independientemente. Los bordes laterales (izquierdo y derecho) están siempre cerrados. Los bordes superior e inferior participan normalmente.

Queremos:
$$P(\text{existe camino abierto de arriba a abajo})$$

**Paso 2: El grafo dual.**

Para cada retícula planar $G$, se define el **grafo dual** $G^*$ cuyas aristas cruzan perpendicularmente a las de $G$. Si una arista de $G$ está abierta, la arista dual correspondiente está cerrada, y viceversa.

En nuestro tablero de $2026 \times 2025$ celdas, el dual es un tablero de $2025 \times 2026$ celdas (columnas y filas intercambiadas). A $p = 1/2$, las aristas del dual son independientes, cada una abierta con probabilidad $1/2$, **misma distribución que el primal**.

**Paso 3: Eventos complementarios.**

Con las condiciones de borde dadas (laterales siempre cerrados), vale el siguiente resultado topológico:

> En cualquier realización del laberinto, **exactamente uno** de los siguientes eventos ocurre:
> - $A$: existe un camino **abierto** de arriba a abajo en $G$
> - $B$: existe un camino **abierto** de izquierda a derecha en $G^*$ (equivalentemente: un camino **cerrado** de izquierda a derecha en $G$)

Esto se debe a que en el plano, un camino vertical y un camino horizontal que atraviesan el rectángulo deben cruzarse. Si se cruzan, comparten una arista, y esa arista no puede ser simultáneamente abierta (para el camino vertical) y cerrada (para el camino horizontal del dual). Luego $A$ y $B$ no pueden ocurrir juntos. Por argumentos topológicos (teorema de Jordan discreto), tampoco pueden ambos fallar: si no hay camino abierto arriba-abajo, el conjunto de aristas cerradas forma una "barrera" horizontal en el dual, creando un camino abierto en el dual de izquierda a derecha.

Por lo tanto: $A$ y $B$ son **complementarios**, es decir, $P(A) + P(B) = 1$.

**Paso 4: Simetría a $p = 1/2$.**

Las condiciones de borde: izquierdo y derecho siempre cerrados en $G$ se convierten en izquierdo y derecho siempre **abiertos** en $G^*$ (aristas duales de aristas primales siempre cerradas son siempre abiertas). Entonces en $G^*$, los bordes laterales están siempre abiertos, y el problema de cruzar $G^*$ de izquierda a derecha es el **mismo tipo de problema** que cruzar $G$ de arriba a abajo (con roles de dimensiones y bordes intercambiados). Las dimensiones $2026 \times 2025$ y $2025 \times 2026$ son la misma situación por simetría del enunciado.

A $p = 1/2$, la distribución es invariante bajo el intercambio abierto $\leftrightarrow$ cerrado, luego:
$$P(A) = P(\text{camino abierto arriba-abajo en } G) = P(\text{camino abierto izq-der en } G^*) = P(B)$$

**Paso 5: Conclusión.**

De $P(A) + P(B) = 1$ y $P(A) = P(B)$:
$$\boxed{P(A) = \dfrac{1}{2}}$$

**4. ¿Por qué $2026 \times 2025$ y no $n \times n$?**

Con un tablero cuadrado $n \times n$, el argumento de complementariedad entre cruce vertical y cruce horizontal también funciona, pero los eventos $A$ y $B$ no serían inmediatamente simétricos (cruzar de arriba a abajo vs. de izquierda a derecha son el mismo problema en un cuadrado). Las dimensiones $2026 \times 2025$ (asimétricas) hacen el problema más sorprendente: la asimetría podría sugerir que las probabilidades dependen de si el tablero es "más alto" o "más ancho", pero la dualidad a $p=1/2$ garantiza $1/2$ en todos los casos.

**5. Generalización**

Para cualquier tablero $m \times n$ (con bordes laterales siempre cerrados) y $p = 1/2$:
$$P(\text{camino abierto arriba-abajo}) = \frac{1}{2}$$

Para $p \neq 1/2$, esta simetría se rompe: si $p > 1/2$ hay más aristas abiertas y la probabilidad de cruce vertical aumenta; si $p < 1/2$ disminuye. El valor crítico exacto para la retícula cuadrada es $p_c = 1/2$ (teorema de Kesten, 1980).

---

## Ejercicio 23.
Juan va al casino con \$100. Juega repetidamente a un juego donde paga \$1 cada vez para jugar. Si gana, se lleva \$2 y si pierde, no se lleva nada. En cada apuesta tiene la misma probabilidad de ganar que de perder. Deja de jugar cuando llega a tener \$101, y se va contento de que "le ganó al casino", o cuando se queda sin dinero. Determinar la probabilidad de que Juan le gane al casino. ¿Y si la probabilidad de ganar en cada apuesta es $p$ con $0 < p < 1$?

### Solución

**1. ¿Por qué es interesante/paradójico?**

Juan solo necesita ganar \$1 neto partiendo de \$100. Parece casi seguro que lo logre antes de perder todo. Sin embargo, la probabilidad de "ganarle al casino" es apenas $\frac{100}{101} \approx 99\%$... que sigue siendo alta. El verdadero golpe viene al generalizar a $p < 1/2$: aunque Juan solo necesita subir \$1, si el juego es levemente desfavorable la probabilidad colapsa drásticamente. El casino no necesita una ventaja grande para destruir al jugador a largo plazo.

**2. Idea clave: Ruina del Jugador (Gambler's Ruin)**

Cada ronda Juan gana o pierde exactamente \$1 (neto), con probabilidades $p$ y $q = 1-p$. Su capital es una caminata aleatoria con barreras absorbentes en $0$ y $101$. La probabilidad de alcanzar $101$ antes de llegar a $0$, partiendo de $k$, se resuelve con una **ecuación en diferencias lineal de segundo orden**.

**3. Resolución paso a paso**

**Paso 1: Planteo.**

Sea $P_k$ = probabilidad de que Juan llegue a \$101 partiendo de \$k. Las barreras son $P_0 = 0$ y $P_{101} = 1$. Para $1 \le k \le 100$, por la ley de probabilidad total condicionando en el primer resultado:

$$P_k = p \cdot P_{k+1} + q \cdot P_{k-1}$$

**Paso 2: Caso $p = q = 1/2$ (juego justo).**

La ecuación se convierte en $P_k = \frac{1}{2}P_{k+1} + \frac{1}{2}P_{k-1}$, o equivalentemente $P_{k+1} - P_k = P_k - P_{k-1}$. Las diferencias consecutivas son constantes, luego $P_k$ es **lineal en $k$**:

$$P_k = ak + b$$

Con $P_0 = 0 \Rightarrow b = 0$ y $P_{101} = 1 \Rightarrow a = \frac{1}{101}$:

$$P_k = \frac{k}{101}$$

Juan empieza con $k = 100$:

$$\boxed{P_{100} = \frac{100}{101} \approx 99.01\%}$$

**Paso 3: Caso general $p \neq q$.**

La ecuación $P_k = p\, P_{k+1} + q\, P_{k-1}$ es lineal de segundo orden. Se busca solución de la forma $P_k = r^k$, lo que lleva a:

$$p\,r^2 - r + q = 0 \implies r = 1 \quad \text{o} \quad r = \frac{q}{p}$$

La solución general es $P_k = A + B\left(\frac{q}{p}\right)^k$. Aplicando condiciones de borde:

$$P_0 = 0 \implies A + B = 0 \implies B = -A$$

$$P_{101} = 1 \implies A\left(1 - \left(\frac{q}{p}\right)^{101}\right) = 1 \implies A = \frac{1}{1 - \left(\frac{q}{p}\right)^{101}}$$

Luego:

$$P_k = \frac{1 - \left(\dfrac{q}{p}\right)^k}{1 - \left(\dfrac{q}{p}\right)^{101}}$$

Para $k = 100$:

$$\boxed{P_{100} = \frac{1 - \left(\dfrac{q}{p}\right)^{100}}{1 - \left(\dfrac{q}{p}\right)^{101}}}$$

**4. Tabla numérica — efecto de una pequeña desventaja**

| $p$ | $q/p$ | $P_{100}$ (aprox.) |
|-----|--------|---------------------|
| $0.50$ | $1.000$ | $100/101 \approx 99.0\%$ |
| $0.49$ | $1.041$ | $\approx 33.7\%$ |
| $0.48$ | $1.083$ | $\approx 8.7\%$ |
| $0.45$ | $1.222$ | $\approx 0.3\%$ |
| $0.40$ | $1.500$ | $\approx 0.0006\%$ |

Con solo 1% de desventaja ($p = 0.49$), la probabilidad cae de 99% a 34%. El casino no necesita una gran ventaja.

**5. Generalización**

Para una caminata aleatoria con barreras en $0$ y $N$, partiendo de $k$:

$$P_k = \begin{cases} \dfrac{k}{N} & \text{si } p = \tfrac{1}{2} \\[10pt] \dfrac{1 - (q/p)^k}{1 - (q/p)^N} & \text{si } p \neq \tfrac{1}{2} \end{cases}$$

Este resultado es fundamental en teoría de colas, finanzas y biología evolutiva (fijación de alelos). Observar que cuando $p < 1/2$ y $N$ es grande, $(q/p)^k \gg 1$ y $(q/p)^N \gg (q/p)^k$, por lo que $P_k \approx (p/q)^{N-k} \to 0$: la ruina es casi segura.

---

## Ejercicio 24.
Ana lanza tres dados con forma de tetraedro, cada uno de los cuales tiene en sus caras los números del 1 al 4, todos equiprobables. Beto lanza dos dados usuales con los números del 1 al 6 en sus caras, todos equiprobables. El puntaje de Ana es la suma de sus tres resultados, y el puntaje de Beto es la suma de sus dos resultados. ¿Cuál es la probabilidad de que el puntaje de Ana sea estrictamente mayor al de Beto?

### Solución

**1. ¿Por qué es interesante/paradójico?**

Ana tira 3 dados de 4 caras y Beto tira 2 dados de 6 caras. Las sumas de ambos van de 3 a 12 y de 2 a 12 respectivamente, con distribuciones distintas. La media de Ana es $3 \times 2.5 = 7.5$ y la de Beto es $2 \times 3.5 = 7$, así que Ana tiene ventaja en valor esperado. Sin embargo, la probabilidad de que Ana gane estrictamente resulta ser **exactamente $1/2$**. Sorprendente: la ventaja promedio no alcanza para superar a Beto más de la mitad de las veces.

**2. Idea clave: función generatriz y conteo exhaustivo**

La distribución de cada suma se obtiene expandiendo el **polinomio generatriz** correspondiente. Luego, $P(A > B)$ se calcula como una doble suma sobre todos los pares $(a, b)$ con $a > b$.

**3. Resolución paso a paso**

**Paso 1: Distribución de Ana (3d4).**

Cada dado aporta valores en $\{1,2,3,4\}$; total de resultados: $4^3 = 64$.

El polinomio generatriz es:
$$A(x) = (x + x^2 + x^3 + x^4)^3$$

Los coeficientes (cantidad de formas de obtener cada suma):

| Suma $a$ | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|----------|---|---|---|---|---|---|---|----|----|----|
| Casos    | 1 | 3 | 6 |10 |12 |12 |10 | 6  | 3  | 1  |

(Distribución simétrica alrededor de $7.5$, suma $= 64$.)

**Paso 2: Distribución de Beto (2d6).**

Cada dado aporta valores en $\{1,\ldots,6\}$; total: $6^2 = 36$.

| Suma $b$ | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9 | 10 | 11 | 12 |
|----------|---|---|---|---|---|---|---|---|----|----|----|
| Casos    | 1 | 2 | 3 | 4 | 5 | 6 | 5 | 4 | 3  | 2  | 1  |

(Distribución simétrica alrededor de $7$, suma $= 36$.)

**Paso 3: Cálculo de $P(A > B)$.**

El total de pares equiprobables es $64 \times 36 = 2304$. Para cada valor $a$ de Ana, se suman los casos de Beto con $b < a$:

| $a$ | Casos Ana | Casos Beto con $b < a$ | Producto |
|-----|-----------|------------------------|----------|
| 3   | 1         | 1                      | 1        |
| 4   | 3         | 1+2 = 3                | 9        |
| 5   | 6         | 1+2+3 = 6              | 36       |
| 6   | 10        | 1+2+3+4 = 10           | 100      |
| 7   | 12        | 1+2+3+4+5 = 15         | 180      |
| 8   | 12        | 1+2+3+4+5+6 = 21       | 252      |
| 9   | 10        | 1+2+3+4+5+6+5 = 26     | 260      |
| 10  | 6         | $\cdots$ = 30          | 180      |
| 11  | 3         | $\cdots$ = 33          | 99       |
| 12  | 1         | $\cdots$ = 35          | 35       |

$$\text{Casos favorables} = 1+9+36+100+180+252+260+180+99+35 = 1152$$

$$\boxed{P(A > B) = \frac{1152}{2304} = \frac{1}{2}}$$

**4. ¿Por qué exactamente $1/2$?**

Puede verificarse que también $P(A \leq B) = \frac{1}{2}$, es decir:

$$P(A < B) + P(A = B) = \frac{870 + 282}{2304} = \frac{1152}{2304} = \frac{1}{2}$$

Esto equivale a que $P(A > B) = P(A \leq B)$: el puntaje de Beto es igualmente probable de quedar por encima o por debajo (o igual) al de Ana. No es evidente a priori; es una consecuencia de la forma particular de ambas distribuciones y emerge del cálculo.

**5. Generalización**

En general, para comparar distribuciones discretas $X$ e $Y$, la probabilidad $P(X > Y)$ se obtiene como:

$$P(X > Y) = \sum_{a} \sum_{b < a} P(X = a)\, P(Y = b)$$

que equivale al coeficiente cruzado del producto de las funciones generatrices evaluadas apropiadamente. La simetría $P(X > Y) = 1/2$ es una propiedad notable que no se da en general: depende de la forma específica de las distribuciones.

---

## Ejercicio 25.
12 personas se sientan en una mesa redonda. Juan tiene una moneda de oro en su mano. Van pasando la moneda con probabilidad $1/2$ hacia la izquierda y $1/2$ hacia la derecha. El juego continúa hasta que todos han tocado la moneda; la última persona en tocarla por primera vez se la queda. ¿Cuál es la probabilidad de que gane quien está inmediatamente a la derecha de Juan?

### Solución

**¿Por qué es interesante/paradójico?**

La intuición dice que cada uno de los 11 vecinos de Juan debería tener igual probabilidad $1/11$ de ser el último. Eso es casi correcto, pero los dos vecinos inmediatos (izquierda y derecha) tienen probabilidad *distinta* al resto. ¿Por qué? Porque ellos son los *primeros* en ser alcanzados, lo que los penaliza frente a los más lejanos.

**Idea clave — caminata aleatoria y el resultado del "último visitado"**

Numeremos las personas $0, 1, 2, \ldots, 11$ en sentido horario, con Juan en $0$. La moneda hace una caminata aleatoria simple en el ciclo $\mathbb{Z}_{12}$.

Existe un resultado clásico: en una caminata aleatoria simple sobre $\{0, 1, \ldots, n\}$ con $0$ fijo (ya visitado), la probabilidad de que el nodo $k$ sea el *último* en ser visitado entre $\{1, \ldots, n\}$ es:

$$P(\text{último} = k) = \frac{1}{n-1} \cdot \frac{1}{\text{algo que depende de } k}$$

Más precisamente, se usa el siguiente resultado sobre la caminata en el ciclo. Etiquetar las personas $1, 2, \ldots, 11$ según su distancia a Juan (la persona $k$ está a $k$ pasos en sentido anti-horario o a $12-k$ pasos en sentido horario). La clave es:

> **Resultado:** En una caminata aleatoria sobre los enteros $\{0, 1, \ldots, n\}$ (o equivalentemente en un ciclo de $n+1$ nodos con origen en $0$), la probabilidad de que el nodo $k$ (con $1 \le k \le n-1$) sea el *último* nodo en ser visitado, dado que $0$ ya fue visitado, es:
> $$P_k = \frac{1}{n-1}, \quad k = 2, 3, \ldots, n-2$$
> mientras que los extremos tienen:
> $$P_1 = P_{n-1} = \frac{1}{2(n-1)}$$

**Resolución paso a paso**

Reinterpretamos la mesa redonda de 12 personas como un segmento lineal. Una vez que la moneda toca por primera vez a *alguno* de los dos vecinos de Juan (el de la derecha, posición $1$, o el de la izquierda, posición $11$), el problema se reduce a una caminata en un intervalo $[0, 12]$ con los extremos ya marcados.

La forma estándar de resolver este tipo de problemas es:

**Paso 1 — Reformulación en el segmento.**

Numerar las personas $0, 1, \ldots, 11$ en sentido anti-horario (Juan = $0$, su vecino derecho = $1$, su vecino izquierdo = $11$). La caminata va de $0$ a través del ciclo. El juego termina cuando todos $1, \ldots, 11$ fueron visitados.

**Paso 2 — Probabilidad de ser el último.**

Por el resultado clásico de caminatas aleatorias en el segmento $[0, n]$ con $n = 11$:

- Los nodos interiores $k = 2, 3, \ldots, 10$ tienen probabilidad:
$$P(\text{último} = k) = \frac{1}{n-1} = \frac{1}{10}$$

- Los nodos extremos $k = 1$ y $k = 11$ (vecinos inmediatos de Juan) tienen:
$$P(\text{último} = k) = \frac{1}{2(n-1)} = \frac{1}{20}$$

**Verificación:** $2 \cdot \frac{1}{20} + 9 \cdot \frac{1}{10} = \frac{1}{10} + \frac{9}{10} = 1$ ✓

**Paso 3 — Respuesta.**

El vecino inmediato a la derecha de Juan es el nodo $k = 1$, por lo tanto:

$$\boxed{P(\text{gana el vecino derecho de Juan}) = \frac{1}{20}}$$

**Resultado destacado**

$$P = \frac{1}{20} = 0.05$$

Los vecinos inmediatos de Juan tienen la mitad de probabilidad de ganar que cualquier otro participante, porque al estar más cerca, son los primeros en ser alcanzados y por ende los que tienen menor chance de quedar de últimos.

**Tabla de probabilidades**

| Posición (distancia a Juan) | Probabilidad de ganar |
|---|---|
| $k = 1$ (vecino derecho) | $\dfrac{1}{20}$ |
| $k = 2, 3, \ldots, 10$ | $\dfrac{1}{10}$ |
| $k = 11$ (vecino izquierdo) | $\dfrac{1}{20}$ |

**Generalización**

Para una mesa de $n$ personas (con Juan incluido), la probabilidad de que el vecino inmediato de Juan gane es:

$$P = \frac{1}{2(n-2)}$$

mientras que cada uno de los $n-3$ participantes restantes tiene probabilidad $\dfrac{1}{n-2}$, exactamente el doble. Esto refleja que los extremos de la caminata lineal equivalente son sistemáticamente desfavorecidos.

---

## Ejercicio 26.
Se tiene una urna con 2019 bolitas rojas. Se van sacando bolitas de la urna. Cuando se saca una bolita roja, se agregan tantas bolitas azules como bolitas quedan en la urna. Cuando se saca una bolita azul, se continúa sacando. ¿Cuál es la probabilidad de que la última bolita que se saque sea azul?

---

## Ejercicio 27.
Para cada entero positivo $n$, denotemos por $p_n$ la probabilidad de que Ana le gane a Beto en el siguiente juego cuando ambos juegan de manera óptima: Primero Ana elige una secuencia de caras y cecas de longitud $n$. A continuación Beto hace lo mismo, seleccionando una secuencia distinta de la de Ana. Una vez fijadas ambas secuencias, se tira una moneda reiteradamente hasta que en los resultados de las tiradas aparezca de manera consecutiva alguna de las secuencias seleccionadas. Gana quien haya elegido la secuencia que apareció. Demostrar que existe y calcular:

$$\lim_{n \to \infty} p_n$$
