# Práctica 0: Repaso de combinatoria

**Probabilidades y Estadística — Primer Cuatrimestre de 2026**

> "A mathematician is a person who can find analogies between theorems;
> a better mathematician is one who can see analogies between proofs
> and the best mathematician can notice analogies between theories."
> — Stefan Banach.

---

## Ejercicio 1

a) Martín tiene pintura de 7 colores, va a pintar una mesa y una silla. ¿De cuántas maneras puede hacerlo?

b) Charly tiene que ubicar 7 pares de medias iguales en 2 cajones, uno rojo y otro azul. ¿De cuántas maneras puede hacerlo?

c) La nona tiene muchos caramelos, de naranja y de limón. Quiere regalarle uno a cada uno de sus 7 nietos. ¿De cuántas maneras puede hacerlo?

d) Beto tiene que decidir los resultados de un concurso, en el que participan 7 personas y hay premios para el primero y el segundo. ¿De cuántas maneras puede hacerlo?

e) Ana tiene 7 libros distintos y tiene que elegir 2 libros para llevárselos de viaje. ¿De cuántas maneras puede hacerlo?

### Resolución — Ejercicio 1

Todos los ítems son variaciones del **principio multiplicativo**: si una decisión tiene $p$ opciones y otra tiene $q$ opciones independientes, la cantidad total de formas de tomar ambas decisiones es $p \cdot q$.

La clave está en identificar si el orden importa y si se puede repetir.

---

**a) Mesa y silla — producto simple**

¿Por qué es interesante? Puede parecer que hay "7 opciones" en total, pero mesa y silla son objetos distintos y cada uno se pinta independientemente.

**Idea clave:** principio multiplicativo. Hay 7 opciones para la mesa y 7 para la silla (se puede repetir color).

$$7 \times 7 = 7^2 = \boxed{49}$$

---

**b) 7 pares de medias en 2 cajones**

Cada par de medias va al cajón rojo o al cajón azul: 2 opciones por par, de forma independiente.

$$\underbrace{2 \times 2 \times \cdots \times 2}_{7} = 2^7 = \boxed{128}$$

---

**c) Caramelos para 7 nietos**

Cada nieto recibe un caramelo de naranja o de limón: 2 opciones por nieto.

$$2^7 = \boxed{128}$$

> Nota: es exactamente la misma estructura que b). Ambos son "asignar una de 2 opciones a cada uno de 7 elementos".

---

**d) Primer y segundo puesto entre 7 personas**

**Idea clave:** variaciones sin repetición. El primero puede ser cualquiera de las 7 personas; el segundo, cualquiera de las 6 restantes. El **orden importa** (primero ≠ segundo).

$$7 \times 6 = \boxed{42}$$

Esto es un caso de variaciones sin repetición: $V(n, k) = \frac{n!}{(n-k)!}$, aquí con $n=7, k=2$.

---

**e) Elegir 2 libros de 7 para el viaje**

**Idea clave:** combinaciones. A diferencia de d), aquí el orden **no importa** (llevar el libro A y el B es lo mismo que llevar B y A).

$$\binom{7}{2} = \frac{7!}{2!\,5!} = \frac{7 \times 6}{2} = \boxed{21}$$

---

**Tabla resumen — comparación de los cinco ítems**

| Ítem | ¿Orden importa? | ¿Repetición? | Fórmula | Resultado |
|------|----------------|--------------|---------|-----------|
| a)   | Sí (mesa ≠ silla) | Sí | $7^2$ | 49 |
| b)   | No (medias iguales) | Sí | $2^7$ | 128 |
| c)   | Sí (nieto 1 ≠ nieto 2) | Sí | $2^7$ | 128 |
| d)   | Sí (1° ≠ 2°) | No | $7 \times 6$ | 42 |
| e)   | No | No | $\binom{7}{2}$ | 21 |

**Generalización:** estos cinco ítems cubren los cuatro casos fundamentales de conteo:

| | Sin repetición | Con repetición |
|---|---|---|
| **Orden importa** | $\frac{n!}{(n-k)!}$ | $n^k$ |
| **Orden no importa** | $\binom{n}{k}$ | $\binom{n+k-1}{k}$ |

---

## Ejercicio 2

¿De cuántas formas distintas pueden acomodarse 13 personas en una fila? ¿Y en una ronda?

### Resolución — Ejercicio 2

**¿Por qué es interesante?** La fila parece sencilla, pero la ronda genera una trampa: en un círculo no hay "primera posición", entonces muchos arreglos que parecen distintos son en realidad el mismo.

---

**Fila**

**Idea clave:** permutaciones. Hay 13 lugares distinguibles (el primero, el segundo, ..., el último). El primer lugar puede ocuparlo cualquiera de las 13 personas, el segundo cualquiera de las 12 restantes, y así sucesivamente.

$$13 \times 12 \times 11 \times \cdots \times 1 = 13! = \boxed{6{,}227{,}020{,}800}$$

---

**Ronda**

**Idea clave:** permutaciones circulares. En una ronda, rotar a todos una posición produce el mismo arreglo. Por lo tanto, fijamos a una persona como referencia y permutamos a las 12 restantes.

$$\frac{13!}{13} = 12! = \boxed{479{,}001{,}600}$$

**¿Por qué dividimos por 13?** Cada arreglo circular corresponde a exactamente 13 arreglos lineales distintos (las 13 rotaciones posibles). Al dividir eliminamos esas repeticiones.

---

**Generalización**

Para $n$ personas:

| Disposición | Fórmula | Intuición |
|---|---|---|
| Fila | $n!$ | $n$ posiciones distinguibles |
| Ronda | $(n-1)!$ | Se fija 1 persona; se permutan las $n-1$ restantes |

$$\text{Ronda}(n) = \frac{n!}{n} = (n-1)!$$

---

## Ejercicio 3

a) De un grupo de 35 deportistas se necesita elegir 5 para participar de una competencia. ¿De cuántas formas distintas puede hacerse? ¿Qué cambia si esos cinco representantes a su vez cumplen cinco funciones distintas?

b) Generalizar el ítem anterior para el caso de $n$ deportistas y $k$ representantes.

### Resolución — Ejercicio 3

**¿Por qué es interesante?** La trampa clásica: ¿importa el orden en que elegimos? Elegir al equipo {Ana, Bruno, Carlos, Diana, Eva} es lo mismo sin importar el orden de selección — pero si cada uno tiene un rol distinto, de repente sí importa quién ocupa cada función.

---

**a) Sin funciones distintas — combinaciones**

**Idea clave:** combinaciones. Solo importa *quiénes* van, no el orden.

De 35 deportistas elegimos 5 sin importar el orden:

$$\binom{35}{5} = \frac{35!}{5!\,30!} = \frac{35 \times 34 \times 33 \times 32 \times 31}{5!} = \frac{33{,}891{,}840}{120} = \boxed{324{,}632}$$

**Con funciones distintas — variaciones sin repetición**

Ahora sí importa el orden: hay que asignar 5 roles distintos a 5 personas distintas. Esto es una permutación de 5 entre 35.

$$V(35, 5) = \frac{35!}{30!} = 35 \times 34 \times 33 \times 32 \times 31 = \boxed{33{,}891{,}840}$$

Notar que $V(35,5) = \binom{35}{5} \times 5!$: primero elegimos quiénes van ($\binom{35}{5}$) y luego asignamos los 5 roles entre ellos ($5!$).

---

**b) Generalización para $n$ deportistas y $k$ representantes**

| Caso | Fórmula | Nombre |
|---|---|---|
| Sin roles distintos (orden no importa) | $\dbinom{n}{k} = \dfrac{n!}{k!\,(n-k)!}$ | Combinaciones |
| Con $k$ roles distintos (orden importa) | $V(n,k) = \dfrac{n!}{(n-k)!}$ | Variaciones sin repetición |

La relación entre ambas:

$$V(n,k) = \binom{n}{k} \cdot k!$$

**Intuición:** para construir una variación, primero elegimos el subconjunto de $k$ elementos ($\binom{n}{k}$ formas) y luego los ordenamos ($k!$ formas).

---

## Ejercicio 4

a) Se deben pintar los frentes de 10 casas y se dispone de 23 colores distintos de pintura. ¿De cuántas formas puede hacerse? ¿De cuántas formas puede hacerse si cada casa debe tener un color distinto?

b) Generalizar el ítem anterior para el caso de $k$ casas y $n$ colores.

c) Dados dos conjuntos finitos $A$ y $B$, dar fórmulas para los cardinales de los conjuntos:

$$\{f : A \to B\} \quad \text{y} \quad \{f : A \to B \mid f \text{ es inyectiva}\}.$$

### Resolución — Ejercicio 4

**¿Por qué es interesante?** Pintar casas con o sin restricción de color distinto es exactamente la diferencia entre funciones cualquiera e inyectivas — el ítem c) lo formaliza.

---

**a) 10 casas, 23 colores**

*Sin restricción:* cada casa elige libremente entre 23 colores (con repetición permitida).

$$23^{10} = \boxed{41{,}426{,}511{,}213{,}649}$$

*Con colores distintos:* la primera casa tiene 23 opciones, la segunda 22, ..., la décima 14. El orden importa (casa 1 ≠ casa 2).

$$V(23,10) = \frac{23!}{13!} = 23 \times 22 \times 21 \times 20 \times 19 \times 18 \times 17 \times 16 \times 15 \times 14 = \boxed{4{,}151{,}586{,}700{,}800}$$

---

**b) Generalización: $k$ casas y $n$ colores**

| Caso | Fórmula |
|---|---|
| Colores pueden repetirse | $n^k$ |
| Colores todos distintos | $V(n,k) = \dfrac{n!}{(n-k)!}$ |

Requisito para el segundo caso: $n \geq k$ (debe haber al menos tantos colores como casas).

---

**c) Funciones entre conjuntos finitos**

Sea $|A| = k$ y $|B| = n$.

**Todas las funciones $f: A \to B$:**

Cada elemento de $A$ puede mapearse a cualquiera de los $n$ elementos de $B$, independientemente. Hay $k$ elementos en $A$, cada uno con $n$ opciones:

$$|\{f : A \to B\}| = n^k$$

Esto es exactamente el caso "casas con repetición": cada elemento de $A$ es una "casa" y cada elemento de $B$ es un "color".

**Funciones inyectivas $f: A \to B$:**

Cada elemento de $A$ debe mapearse a un elemento *distinto* de $B$. El primero tiene $n$ opciones, el segundo $n-1$, ..., el $k$-ésimo tiene $n-k+1$:

$$|\{f : A \to B \mid f \text{ es inyectiva}\}| = \frac{n!}{(n-k)!} = V(n,k)$$

Requiere $n \geq k$; si $n < k$ no existen funciones inyectivas.

**Resumen unificado:**

$$|\{f : A \to B\}| = |B|^{|A|} \qquad |\{f : A \to B \mid f \text{ inyectiva}\}| = \frac{|B|!}{(|B|-|A|)!}$$

---

## Ejercicio 5

a) ¿Cuántos anagramas de BIBLIOTECARIA pueden formarse?

b) ¿Y con la condición de que la T esté a la derecha de la C (no necesariamente juntas)?

c) ¿Y con la condición de que la T esté a la derecha de la C y la C a la derecha de la R?

d) ¿Y con la condición de que las dos A no estén juntas?

e) ¿Y con la condición de que todas las vocales estén juntas?

### Resolución — Ejercicio 5

**Análisis de BIBLIOTECARIA**

Primero contamos las letras (13 en total):

| Letra | Cantidad |
|---|---|
| B | 2 |
| I | 3 |
| L | 1 |
| O | 1 |
| T | 1 |
| E | 1 |
| C | 1 |
| A | 2 |
| R | 1 |
| **Total** | **13** |

Vocales: I(3), O(1), E(1), A(2) → 7 vocales. Consonantes: B(2), L, T, C, R → 6 consonantes.

---

**a) Total de anagramas**

**Idea clave:** permutaciones con elementos repetidos. Si todas las letras fueran distintas habría $13!$ anagramas, pero hay letras repetidas (B×2, I×3, A×2) que generan arreglos idénticos.

$$\frac{13!}{2! \cdot 3! \cdot 2!} = \frac{6{,}227{,}020{,}800}{2 \cdot 6 \cdot 2} = \frac{6{,}227{,}020{,}800}{24} = \boxed{259{,}459{,}200}$$

---

**b) T a la derecha de C**

**Idea clave:** simetría. En cualquier anagrama, T y C ocupan 2 posiciones. Por simetría exactamente la mitad de los arreglos tiene T a la derecha de C (y la otra mitad a la izquierda). Como T y C son letras únicas, no hay casos de empate.

$$\frac{259{,}459{,}200}{2} = \boxed{129{,}729{,}600}$$

---

**c) T a la derecha de C, y C a la derecha de R**

**Idea clave:** misma simetría extendida. Las 3 letras T, C, R tienen $3! = 6$ ordenamientos relativos posibles, todos igualmente probables. Solo 1 de esos 6 cumple R < C < T (en posición de izquierda a derecha).

$$\frac{259{,}459{,}200}{6} = \boxed{43{,}243{,}200}$$

---

**d) Las dos A no estén juntas**

**Idea clave:** complemento. Es más fácil contar los anagramas donde las dos A *sí* están juntas y restarlos del total.

*Anagramas con las dos A juntas:* tratamos "AA" como un único bloque. Quedan 12 elementos: el bloque AA + B,B,I,I,I,L,O,T,E,C,R.

$$\text{Con AA juntas} = \frac{12!}{2! \cdot 3!} = \frac{479{,}001{,}600}{12} = 39{,}916{,}800$$

$$\text{Con A separadas} = 259{,}459{,}200 - 39{,}916{,}800 = \boxed{219{,}542{,}400}$$

---

**e) Todas las vocales juntas**

**Idea clave:** bloque de vocales. Agrupamos las 7 vocales (I,I,I,O,E,A,A) en un único bloque. Entonces tenemos 7 elementos para permutar: el bloque + B,B,L,T,C,R.

*Arreglos del bloque externo* (7 elementos, B repetida 2 veces):

$$\frac{7!}{2!} = \frac{5040}{2} = 2520$$

*Arreglos internos del bloque de vocales* (7 vocales: I×3, O×1, E×1, A×2):

$$\frac{7!}{3! \cdot 2!} = \frac{5040}{12} = 420$$

*Total:*

$$2520 \times 420 = \boxed{1{,}058{,}400}$$

---

**Tabla resumen**

| Ítem | Condición | Resultado |
|---|---|---|
| a) | Sin restricción | 259,459,200 |
| b) | T a la derecha de C | 129,729,600 |
| c) | R < C < T (izq. a der.) | 43,243,200 |
| d) | Las dos A separadas | 219,542,400 |
| e) | Todas las vocales juntas | 1,058,400 |

---

## Ejercicio 6

De una caja que contiene 123 bolillas numeradas de 1 a 123 se extraen cinco bolillas. ¿Cuántos resultados posibles hay si:

a) las bolillas se extraen una a la vez y se descartan después de extraerlas?

b) las bolillas se extraen una a la vez y se devuelven a la caja después de extraerlas?

c) las bolillas se extraen todas juntas?

### Resolución — Ejercicio 6

**¿Por qué es interesante?** Los tres ítems son variaciones del mismo experimento pero con distintas reglas sobre orden y repetición — exactamente la tabla del Ejercicio 1.

---

**a) Una a la vez, sin devolución — variaciones sin repetición**

El orden importa (la secuencia de extracción es el resultado) y no hay repetición (la bolilla descartada no vuelve).

$$V(123, 5) = \frac{123!}{118!} = 123 \times 122 \times 121 \times 120 \times 119 = \boxed{25{,}563{,}645{,}480}$$

---

**b) Una a la vez, con devolución — variaciones con repetición**

El orden importa y hay repetición (la misma bolilla puede salir más de una vez).

$$123^5 = \boxed{28{,}153{,}056{,}843}$$

---

**c) Todas juntas — combinaciones**

El orden no importa (sacar {3, 17, 42, 80, 99} es el mismo resultado sin importar el orden). Sin repetición.

$$\binom{123}{5} = \frac{123!}{5!\,118!} = \frac{25{,}563{,}645{,}480}{120} = \boxed{213{,}030{,}379}$$

---

**Tabla resumen**

| Ítem | ¿Orden importa? | ¿Repetición? | Fórmula | Resultado |
|---|---|---|---|---|
| a) | Sí | No | $V(123,5) = \frac{123!}{118!}$ | 25,563,645,480 |
| b) | Sí | Sí | $123^5$ | 28,153,056,843 |
| c) | No | No | $\binom{123}{5}$ | 213,030,379 |

Notar que $\binom{123}{5} = \frac{V(123,5)}{5!}$: las combinaciones surgen de tomar las variaciones sin repetición y eliminar los $5!$ ordenamientos de cada grupo.

---

## Ejercicio 7

En el tablero de la figura, ¿cuántas formas hay de llegar desde $A$ hasta $B$ realizando movimientos hacia abajo y hacia la derecha siguiendo las líneas? ¿Cuántos de esos caminos pasan por $X$? Generalizar para un tablero de tamaño $n \times m$.

*(El tablero tiene a $A$ en la esquina superior izquierda, $B$ en la esquina inferior derecha, y $X$ en una posición intermedia.)*

### Resolución — Ejercicio 7

**¿Por qué es interesante?** A primera vista parece un problema de caminos, pero la clave es que cada camino es exactamente una secuencia de movimientos D (derecha) y B (abajo) — y contar esas secuencias es un problema de combinatoria pura.

---

**Caminos de A a B en un tablero $n \times m$**

Un tablero de $n \times m$ casillas tiene $(n+1)$ filas y $(m+1)$ columnas de intersecciones. Para ir de la esquina superior izquierda a la inferior derecha moviéndose solo hacia abajo o hacia la derecha, todo camino consiste en exactamente:

- $n$ movimientos hacia abajo (**↓**)
- $m$ movimientos hacia la derecha (**→**)

en algún orden, para un total de $n + m$ movimientos.

**Idea clave:** cada camino es una secuencia de $n+m$ pasos donde elegimos cuáles $n$ son "abajo" (los $m$ restantes son "derecha" automáticamente).

$$\text{Caminos}(A \to B) = \binom{n+m}{n} = \binom{n+m}{m}$$

---

**Caminos que pasan por X**

Sea $X$ una intersección ubicada a $i$ pasos abajo y $j$ pasos a la derecha de $A$. Entonces $X$ está a $n-i$ pasos abajo y $m-j$ pasos a la derecha de $B$.

**Idea clave:** multiplicar caminos independientes. Todo camino $A \to B$ que pasa por $X$ se descompone en un camino $A \to X$ seguido de un camino $X \to B$.

$$\text{Caminos}(A \to X) = \binom{i+j}{i}, \qquad \text{Caminos}(X \to B) = \binom{(n-i)+(m-j)}{n-i}$$

$$\text{Caminos que pasan por } X = \binom{i+j}{i} \cdot \binom{(n-i)+(m-j)}{n-i}$$

---

**Ejemplo concreto con la figura del enunciado**

Del PDF, el tablero es de $4 \times 7$ casillas ($4$ filas, $7$ columnas), y $X$ está a $2$ pasos abajo y $3$ a la derecha de $A$:

$$\text{Total } A \to B = \binom{4+7}{4} = \binom{11}{4} = 330$$

$$\text{Caminos por } X = \binom{2+3}{2} \cdot \binom{2+4}{2} = \binom{5}{2} \cdot \binom{6}{2} = 10 \cdot 15 = 150$$

---

**Generalización**

Para un tablero de $n \times m$ casillas con $X$ en la posición $(i, j)$ desde $A$:

$$\boxed{\text{Total} = \binom{n+m}{n}, \qquad \text{Por } X = \binom{i+j}{i}\cdot\binom{(n-i)+(m-j)}{n-i}}$$

---

## Ejercicio 8

a) Una panadería dispone de 17 variedades de facturas. ¿Cuántas docenas pueden formarse?

b) ¿De cuántas formas distintas pueden distribuirse 12 bolitas indistinguibles en 17 cajas distinguibles? ¿Y si las bolitas son distinguibles?

c) Generalizar el ítem anterior para $B$ bolitas y $C$ cajas.

### Resolución — Ejercicio 8

**¿Por qué es interesante?** Este ejercicio introduce las **combinaciones con repetición** (el cuarto caso de la tabla de conteo), que es el más contraintuitivo: elegir sin orden y con repetición.

---

**Idea clave: estrellas y barras**

Distribuir $B$ objetos indistinguibles en $C$ cajas distinguibles es equivalente a colocar $B$ estrellas (★) separadas por $C-1$ barras (|). Cada configuración de estrellas y barras representa una distribución.

Ejemplo con 5 bolitas en 3 cajas: `★★|★|★★` significa 2 en caja 1, 1 en caja 2, 2 en caja 3.

Hay $B + C - 1$ símbolos en total, y hay que elegir cuáles $C-1$ son barras (o equivalentemente, cuáles $B$ son estrellas):

$$\binom{B + C - 1}{C - 1} = \binom{B + C - 1}{B}$$

---

**a) Docenas en una panadería con 17 variedades**

Elegir 12 facturas de 17 variedades, sin importar el orden y con repetición permitida (podés elegir varias de la misma variedad). Es el caso "orden no importa, con repetición":

$$\binom{12 + 17 - 1}{17 - 1} = \binom{28}{16} = \binom{28}{12} = \boxed{3{,}108{,}105}$$

---

**b) 12 bolitas en 17 cajas**

*Bolitas indistinguibles:* igual que las docenas — distribuir 12 objetos iguales en 17 cajas distintas.

$$\binom{12 + 17 - 1}{17 - 1} = \binom{28}{16} = \boxed{3{,}108{,}105}$$

*Bolitas distinguibles:* ahora cada bolita elige independientemente en cuál de las 17 cajas va. Son 12 decisiones independientes con 17 opciones cada una.

$$17^{12} = \boxed{582{,}622{,}237{,}229{,}761}$$

---

**c) Generalización: $B$ bolitas y $C$ cajas**

| Bolitas | Fórmula | Nombre |
|---|---|---|
| Indistinguibles | $\dbinom{B+C-1}{C-1}$ | Combinaciones con repetición |
| Distinguibles | $C^B$ | Variaciones con repetición |

$$\boxed{\binom{B+C-1}{B} \quad \text{(indistinguibles)} \qquad C^B \quad \text{(distinguibles)}}$$

---

**Tabla de los 4 casos de conteo — completa**

| | Sin repetición | Con repetición |
|---|---|---|
| **Orden importa** | $\dfrac{n!}{(n-k)!}$ | $n^k$ |
| **Orden no importa** | $\dbinom{n}{k}$ | $\dbinom{n+k-1}{k}$ |

El ítem b) con bolitas distinguibles completa la celda (orden importa, con repetición) del Ejercicio 1.

---

## Ejercicio 9

Se extraen 23 bolitas de una caja que contiene 100 bolitas blancas, 100 bolitas azules, 100 bolitas negras y 100 bolitas rojas. ¿Cuántos resultados posibles hay?

### Resolución — Ejercicio 9

**¿Por qué es interesante?** La trampa está en que hay 400 bolitas en total, pero todas las del mismo color son indistinguibles entre sí. El resultado no es "qué bolitas exactas salieron" sino "cuántas de cada color salieron".

---

**Idea clave:** el resultado de la extracción queda completamente determinado por cuántas bolitas de cada color se obtuvieron. Si salen $b$ blancas, $a$ azules, $n$ negras y $r$ rojas, entonces:

$$b + a + n + r = 23, \qquad b, a, n, r \geq 0$$

Contar los resultados posibles es exactamente contar las soluciones enteras no negativas de esta ecuación — un problema de estrellas y barras con 23 "unidades" distribuidas en 4 "cajas" (colores).

$$\binom{23 + 4 - 1}{4 - 1} = \binom{26}{3} = \frac{26 \times 25 \times 24}{6} = \boxed{2{,}600}$$

---

**¿Por qué no importa que haya 100 de cada color?**

Porque $23 \leq 100$: nunca podemos agotar un color, así que la restricción de 100 por color nunca se activa. Si hubiera, por ejemplo, solo 5 bolitas rojas, habría que restar los casos con $r > 5$ (inclusión-exclusión).

---

**Generalización**

Extraer $k$ bolitas de una urna con $C$ colores (suficientes de cada uno):

$$\binom{k + C - 1}{C - 1}$$

---

## Ejercicio 10

Consideremos la ecuación $x_1 + x_2 + x_3 = 57$.

a) ¿Cuántas soluciones enteras no negativas tiene?

b) ¿Cuántas soluciones enteras positivas tiene?

### Resolución — Ejercicio 10

**Idea clave:** estrellas y barras. Contar soluciones enteras de $x_1 + x_2 + x_3 = 57$ es exactamente distribuir 57 unidades en 3 variables.

---

**a) Soluciones enteras no negativas ($x_i \geq 0$)**

Distribuir 57 unidades en 3 cajas sin restricción de mínimo:

$$\binom{57 + 3 - 1}{3 - 1} = \binom{59}{2} = \frac{59 \times 58}{2} = \boxed{1{,}711}$$

---

**b) Soluciones enteras positivas ($x_i \geq 1$)**

**Idea clave:** cambio de variable. Si cada $x_i \geq 1$, definimos $y_i = x_i - 1 \geq 0$. La ecuación se convierte en:

$$(y_1 + 1) + (y_2 + 1) + (y_3 + 1) = 57 \implies y_1 + y_2 + y_3 = 54$$

Ahora aplicamos estrellas y barras con $y_i \geq 0$:

$$\binom{54 + 3 - 1}{3 - 1} = \binom{56}{2} = \frac{56 \times 55}{2} = \boxed{1{,}540}$$

---

**Generalización**

Para $x_1 + x_2 + \cdots + x_k = n$:

| Restricción | Sustitución | Fórmula |
|---|---|---|
| $x_i \geq 0$ | — | $\dbinom{n+k-1}{k-1}$ |
| $x_i \geq 1$ | $y_i = x_i - 1$ | $\dbinom{n-1}{k-1}$ |
| $x_i \geq c$ | $y_i = x_i - c$ | $\dbinom{n - ck + k - 1}{k-1}$ |

---

## Ejercicio 11

Probar las siguientes identidades contando conjuntos de formas distintas.

a) $$\sum_{i=0}^{n} \binom{n}{i} = 2^n.$$

b) $$\sum_{i=1}^{n-1} i(n-i) = \sum_{i=2}^{n} \binom{i}{2} = \binom{n+1}{3}.$$

### Resolución — Ejercicio 11

El método es **contar el mismo conjunto de dos maneras** y concluir que las dos expresiones son iguales.

---

**a) $\displaystyle\sum_{i=0}^{n} \binom{n}{i} = 2^n$**

**Conjunto a contar:** todos los subconjuntos de un conjunto $S$ con $n$ elementos.

**Manera 1 — por tamaño:** los subconjuntos de tamaño $i$ son $\binom{n}{i}$. Sumando sobre todos los tamaños posibles:

$$\sum_{i=0}^{n} \binom{n}{i}$$

**Manera 2 — elemento por elemento:** para construir un subconjunto, cada uno de los $n$ elementos tiene 2 opciones independientes: está o no está. En total:

$$2^n$$

Como ambas cuentan lo mismo: $\displaystyle\sum_{i=0}^{n} \binom{n}{i} = 2^n$. $\blacksquare$

---

**b) $\displaystyle\sum_{i=1}^{n-1} i(n-i) = \sum_{i=2}^{n} \binom{i}{2} = \binom{n+1}{3}$**

Probamos cada igualdad contando el mismo conjunto.

**Conjunto a contar:** subconjuntos de 3 elementos de $\{1, 2, \ldots, n+1\}$. Hay $\binom{n+1}{3}$ de ellos.

---

**$\binom{n+1}{3} = \displaystyle\sum_{i=2}^{n} \binom{i}{2}$**

**Idea:** fijar el elemento mayor del subconjunto. Si el mayor es $k+1$ (con $k$ entre 2 y $n$), los otros 2 elementos se eligen libremente de $\{1, \ldots, k\}$:

$$\binom{n+1}{3} = \sum_{k=2}^{n} \binom{k}{2}$$

que es exactamente $\sum_{i=2}^{n} \binom{i}{2}$ renombrando $k = i$. $\blacksquare$

Esta es la **identidad del palo de hockey** (hockey stick identity):

$$\sum_{i=r}^{n} \binom{i}{r} = \binom{n+1}{r+1}$$

---

**$\displaystyle\sum_{i=1}^{n-1} i(n-i) = \binom{n+1}{3}$**

**Idea:** contar subconjuntos $\{a, b, c\} \subseteq \{1,\ldots,n+1\}$ con $a < b < c$ fijando el elemento del medio $b$.

Si $b = i+1$ (con $i$ entre 1 y $n-1$):
- $a$ puede ser cualquiera de los $i$ elementos menores que $b$: $i$ opciones.
- $c$ puede ser cualquiera de los $n+1-(i+1) = n-i$ elementos mayores que $b$: $n-i$ opciones.

$$\binom{n+1}{3} = \sum_{i=1}^{n-1} i(n-i) \qquad \blacksquare$$

---

**Verificación numérica con $n = 4$**

$$\binom{5}{3} = 10$$

$$\sum_{i=1}^{3} i(4-i) = 1\cdot3 + 2\cdot2 + 3\cdot1 = 3+4+3 = 10 \checkmark$$

$$\sum_{i=2}^{4} \binom{i}{2} = \binom{2}{2}+\binom{3}{2}+\binom{4}{2} = 1+3+6 = 10 \checkmark$$

---

## Ejercicio 12

Probar que un conjunto no vacío tiene igual cantidad de subconjuntos de cardinal par que de cardinal impar. Deducir que si $n \neq 0$:

$$\sum_{i=0}^{n} (-1)^i \binom{n}{i} = 0.$$

### Resolución — Ejercicio 12

**¿Por qué es interesante?** La sumatoria $\sum(-1)^i\binom{n}{i}$ parece algebraica, pero se puede probar combinatoriamente sin manipular polinomios, entendiendo qué significa el signo $(-1)^i$.

---

**Parte 1: igual cantidad de subconjuntos pares e impares**

Sea $S$ un conjunto no vacío con $n \geq 1$ elementos. Fijemos un elemento distinguido $s \in S$.

**Idea clave:** construir una biyección entre subconjuntos de cardinal par y subconjuntos de cardinal impar. La biyección es: dado cualquier subconjunto $A \subseteq S$, definimos

$$f(A) = \begin{cases} A \setminus \{s\} & \text{si } s \in A \\ A \cup \{s\} & \text{si } s \notin A \end{cases}$$

Es decir, $f$ agrega $s$ si no está, o lo quita si está. Esta operación:
- Es una involución: $f(f(A)) = A$.
- Cambia la paridad del cardinal: si $|A|$ es par, $|f(A)|$ es impar, y viceversa.

Como $f$ es una biyección entre los dos conjuntos, tienen el mismo cardinal. $\blacksquare$

---

**Parte 2: deducir $\displaystyle\sum_{i=0}^{n}(-1)^i\binom{n}{i} = 0$**

Los subconjuntos de cardinal par son los de tamaño $0, 2, 4, \ldots$, que suman:

$$\#\{\text{subconj. pares}\} = \sum_{\substack{i=0 \\ i \text{ par}}}^{n} \binom{n}{i}$$

Los de cardinal impar:

$$\#\{\text{subconj. impares}\} = \sum_{\substack{i=0 \\ i \text{ impar}}}^{n} \binom{n}{i}$$

Como son iguales, su diferencia es cero:

$$\sum_{\substack{i \text{ par}}} \binom{n}{i} - \sum_{\substack{i \text{ impar}}} \binom{n}{i} = 0$$

Esto es exactamente $\displaystyle\sum_{i=0}^{n} (-1)^i \binom{n}{i} = 0$, ya que $(-1)^i = +1$ para $i$ par y $(-1)^i = -1$ para $i$ impar. $\blacksquare$

---

**Verificación numérica con $n = 3$**

Subconjuntos de $\{1,2,3\}$:

| Cardinal | Subconjuntos | Cantidad |
|---|---|---|
| 0 (par) | $\emptyset$ | 1 |
| 1 (impar) | $\{1\},\{2\},\{3\}$ | 3 |
| 2 (par) | $\{1,2\},\{1,3\},\{2,3\}$ | 3 |
| 3 (impar) | $\{1,2,3\}$ | 1 |

Pares: $1+3=4$. Impares: $3+1=4$. Iguales. $\checkmark$

$$\sum_{i=0}^{3}(-1)^i\binom{3}{i} = \binom{3}{0} - \binom{3}{1} + \binom{3}{2} - \binom{3}{3} = 1 - 3 + 3 - 1 = 0 \checkmark$$

---

**Conexión con el Binomio de Newton**

Este resultado es un caso particular del binomio de Newton con $x = -1$, $y = 1$:

$$(1 + x)^n = \sum_{i=0}^{n} \binom{n}{i} x^i \implies (1-1)^n = \sum_{i=0}^{n}(-1)^i\binom{n}{i} = 0 \quad (n \geq 1)$$

La prueba combinatoria del ejercicio es más profunda: explica *por qué* se cancelan, no solo que se cancelan.
