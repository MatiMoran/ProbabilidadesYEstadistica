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

---

## Ejercicio 5

a) ¿Cuántos anagramas de BIBLIOTECARIA pueden formarse?

b) ¿Y con la condición de que la T esté a la derecha de la C (no necesariamente juntas)?

c) ¿Y con la condición de que la T esté a la derecha de la C y la C a la derecha de la R?

d) ¿Y con la condición de que las dos A no estén juntas?

e) ¿Y con la condición de que todas las vocales estén juntas?

---

## Ejercicio 6

De una caja que contiene 123 bolillas numeradas de 1 a 123 se extraen cinco bolillas. ¿Cuántos resultados posibles hay si:

a) las bolillas se extraen una a la vez y se descartan después de extraerlas?

b) las bolillas se extraen una a la vez y se devuelven a la caja después de extraerlas?

c) las bolillas se extraen todas juntas?

---

## Ejercicio 7

En el tablero de la figura, ¿cuántas formas hay de llegar desde $A$ hasta $B$ realizando movimientos hacia abajo y hacia la derecha siguiendo las líneas? ¿Cuántos de esos caminos pasan por $X$? Generalizar para un tablero de tamaño $n \times m$.

*(El tablero tiene a $A$ en la esquina superior izquierda, $B$ en la esquina inferior derecha, y $X$ en una posición intermedia.)*

---

## Ejercicio 8

a) Una panadería dispone de 17 variedades de facturas. ¿Cuántas docenas pueden formarse?

b) ¿De cuántas formas distintas pueden distribuirse 12 bolitas indistinguibles en 17 cajas distinguibles? ¿Y si las bolitas son distinguibles?

c) Generalizar el ítem anterior para $B$ bolitas y $C$ cajas.

---

## Ejercicio 9

Se extraen 23 bolitas de una caja que contiene 100 bolitas blancas, 100 bolitas azules, 100 bolitas negras y 100 bolitas rojas. ¿Cuántos resultados posibles hay?

---

## Ejercicio 10

Consideremos la ecuación $x_1 + x_2 + x_3 = 57$.

a) ¿Cuántas soluciones enteras no negativas tiene?

b) ¿Cuántas soluciones enteras positivas tiene?

---

## Ejercicio 11

Probar las siguientes identidades contando conjuntos de formas distintas.

a) $$\sum_{i=0}^{n} \binom{n}{i} = 2^n.$$

b) $$\sum_{i=1}^{n-1} i(n-i) = \sum_{i=2}^{n} \binom{i}{2} = \binom{n+1}{3}.$$

---

## Ejercicio 12

Probar que un conjunto no vacío tiene igual cantidad de subconjuntos de cardinal par que de cardinal impar. Deducir que si $n \neq 0$:

$$\sum_{i=0}^{n} (-1)^i \binom{n}{i} = 0.$$
