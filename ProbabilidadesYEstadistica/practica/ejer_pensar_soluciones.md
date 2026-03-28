# Soluciones — Ejercicios para Pensar

---

## Ejercicio 17

> Una enfermedad tiene una prevalencia del 1% en la población. Un test da positivo con una probabilidad del 99% si una persona está enferma y con una probabilidad del 1% si la persona no está enferma. Si a una persona al azar la testeamos y da positivo, ¿cuál es la probabilidad de que realmente esté enferma?

---

### 1. ¿Por qué es paradójico?

La intuición dice: *"el test acierta el 99% de las veces, así que si da positivo, casi seguro que estoy enfermo."*

El resultado real es **50%**. Un test con 99% de precisión, aplicado a alguien que dio positivo, solo garantiza que hay una chance de uno a dos de estar enfermo. Esto desconcierta a médicos, estudiantes y al público general por igual.

El error intuitivo es ignorar la **prevalencia**: la enfermedad es muy rara (solo 1 de cada 100 personas la tiene), entonces en la población hay muchísimos sanos que pueden dar falso positivo, y eso "contamina" el resultado positivo.

---

### 2. Idea clave

**Teorema de Bayes**: actualizar una probabilidad a priori ($P(E)$) con la evidencia del test para obtener la probabilidad a posteriori ($P(E \mid +)$).

$$P(E \mid +) = \frac{P(+ \mid E)\, P(E)}{P(+)}$$

donde $P(+)$ se calcula por **probabilidad total**, descomponiendo según si la persona está enferma o no.

---

### 3. Resolución paso a paso

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

### 4. Interpretación con frecuencias naturales

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

### 5. ¿Cuándo el test sería más informativo?

La paradoja surge porque $P(E)$ es muy baja. Si la prevalencia cambia, cambia todo:

| Prevalencia $P(E)$ | $P(E \mid +)$ |
|--------------------|---------------|
| $1\%$ | $50\%$ |
| $5\%$ | $84\%$ |
| $10\%$ | $92\%$ |
| $50\%$ | $99\%$ |

La conclusión práctica: **un test positivo es mucho más informativo cuando se aplica a poblaciones de alto riesgo** (prevalencia alta) que a la población general.

---

### 6. Generalización

Para un test con sensibilidad $s = P(+\mid E)$ y tasa de falso positivo $f = P(+\mid E^c)$, aplicado a una población con prevalencia $\pi = P(E)$:

$$P(E \mid +) = \frac{s\,\pi}{s\,\pi + f\,(1-\pi)}$$

En este ejercicio $s = f = 0{,}99 \cdot ... = 0{,}99$ y $f=0{,}01$. Pero como $\pi = 0{,}01$ y $1-\pi = 0{,}99$, los dos términos del denominador resultan idénticos, dando exactamente $1/2$.

La condición para que $P(E\mid+) = 1/2$ es precisamente $s\,\pi = f\,(1-\pi)$, es decir, cuando la prevalencia es tan baja que los verdaderos y falsos positivos se equilibran.

---

## Ejercicio 18

> Una placa de Petri contiene una bacteria. Cada un segundo esta bacteria se duplica con probabilidad $p$ o muere. ¿Cuál es la probabilidad de que la colonia viva para siempre?

---

### 1. ¿Por qué es paradójico?

La intuición dice: *"si la bacteria tiene más chances de duplicarse que de morir, la colonia debería sobrevivir con alta probabilidad."*

El resultado sorprendente es que **para $p \leq \frac{1}{2}$ la extinción es segura** — incluso si cada bacteria tiene exactamente 50% de chance de duplicarse, la colonia inevitablemente muere. Y para $p > \frac{1}{2}$, la probabilidad de sobrevivir no es $2p - 1$ de forma obvia, sino que requiere un cálculo cuidadoso.

El truco está en que la colonia se extingue si **todas** las ramas del árbol genealógico se extinguen, y eso ocurre con más frecuencia de lo que parece.

---

### 2. Idea clave

**Proceso de ramificación de Galton-Watson**: modelar la colonia como un árbol donde cada bacteria genera descendientes de forma independiente. La probabilidad de extinción $q$ satisface una **ecuación de punto fijo** obtenida condicionando en lo que hace la primera bacteria.

---

### 3. Resolución paso a paso

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

### 4. Verificación intuitiva

La progenie esperada de cada bacteria es $\mathbb{E}[\text{hijos}] = 0 \cdot (1-p) + 2 \cdot p = 2p$.

| Régimen | Condición | Extinción |
|---------|-----------|-----------|
| Subcrítico | $2p < 1 \;\Leftrightarrow\; p < \frac{1}{2}$ | Segura ($q=1$) |
| Crítico | $2p = 1 \;\Leftrightarrow\; p = \frac{1}{2}$ | Segura ($q=1$) |
| Supercrítico | $2p > 1 \;\Leftrightarrow\; p > \frac{1}{2}$ | Posible supervivencia |

El caso crítico ($p = \frac{1}{2}$) es el más sorprendente: aunque en promedio el número de bacterias se mantiene constante, la extinción es **inevitable**. Esto se debe a las fluctuaciones aleatorias que en algún momento llevan la colonia a cero.

---

### 5. Tabla de valores

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

### 6. Generalización

Este es el **proceso de Galton-Watson**, el modelo fundamental para poblaciones que se reproducen en generaciones discretas. El resultado general es:

> La probabilidad de extinción $q$ es el menor punto fijo en $[0,1]$ de la función generatriz de probabilidad $G(s) = \sum_k p_k s^k$, donde $p_k$ es la probabilidad de tener $k$ descendientes.
>
> La extinción es **segura** si y solo si $\mathbb{E}[\text{descendientes}] \leq 1$.

En este ejercicio $G(s) = (1-p) + p\,s^2$, con media $2p$. La condición $2p \leq 1$ reproduce exactamente el umbral $p \leq \frac{1}{2}$.

---

## Ejercicio 19

> En un cine hay 100 espectadores y 100 asientos. El primero en entrar decidió sentarse en un asiento al azar. El resto entran en fila y respetan su asiento asignado salvo que al llegar esté ocupado, en cuyo caso se sientan en un lugar libre al azar. ¿Cuál es la probabilidad de que el último encuentre su asiento ocupado?

---

### 1. ¿Por qué es paradójico?

La intuición dice: *"hay 100 asientos y el primero eligió al azar, así que hay solo un 1% de chance de que haya elegido justamente el asiento del último."* Parece que la respuesta debería estar cerca de 1%.

El resultado real es **50%**, independientemente de si hay 2 o 2 millones de espectadores. Esto sorprende porque parece que con más personas, las perturbaciones se "acumulan" y el caos crece — pero el resultado es siempre el mismo.

---

### 2. Idea clave

**Argumento de simetría**: los únicos dos asientos que importan para el resultado final son el **asiento 1** (del primer espectador) y el **asiento $n$** (del último). Ambos permanecen disponibles hasta que uno de ellos es elegido en alguna selección aleatoria, y por simetría cada uno tiene igual probabilidad de ser el primero en ser elegido.

---

### 3. Resolución paso a paso

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

### 4. Verificación con casos pequeños

**$n = 2$:** El espectador 1 elige al azar entre el asiento 1 y el asiento 2. Con prob $\frac{1}{2}$ elige el 1 (espectador 2 encuentra el suyo libre), con prob $\frac{1}{2}$ elige el 2 (espectador 2 lo encuentra ocupado). $P = \frac{1}{2}$. ✓

**$n = 3$:** El espectador 1 elige:
- Asiento 1 (prob $\frac{1}{3}$): todos bien, espectador 3 libre. Contribuye $0$.
- Asiento 3 (prob $\frac{1}{3}$): espectador 3 lo encuentra ocupado. Contribuye $1$.
- Asiento 2 (prob $\frac{1}{3}$): espectador 2 queda desplazado, elige entre {1, 3} con igual prob. Contribuye $\frac{1}{2}$.

$$P = \frac{1}{3} \cdot 0 + \frac{1}{3} \cdot 1 + \frac{1}{3} \cdot \frac{1}{2} = \frac{1}{3} + \frac{1}{6} = \frac{1}{2}$$ ✓

---

### 5. Generalización

El resultado es $\frac{1}{2}$ para **cualquier $n \geq 2$**, lo que puede demostrarse formalmente por inducción usando la recursión del caso $n = 3$.

Más aún, el resultado sigue siendo $\frac{1}{2}$ aunque el primer espectador elija su asiento con una distribución no uniforme (siempre que tenga probabilidad positiva de elegir cualquier asiento): lo único que importa es la simetría entre el asiento 1 y el asiento $n$ en los pasos aleatorios.

Este problema es conocido como el **problema del pasajero distraído en el avión** y es uno de los ejemplos más elegantes de cómo un argumento de simetría evita un cálculo engorroso.

---

## Ejercicio 20

> En Probalandia los bebés son varones con probabilidad $0{,}51$ y mujeres con probabilidad $0{,}49$. La tradición es tener hijos hasta que nazca la primera mujer. ¿Cuál es la proporción de bebés mujeres en la población?

---

### 1. ¿Por qué es paradójico?

La intuición dice: *"como las familias paran de tener hijos cuando nace una mujer, las mujeres deben ser menos comunes — están 'subrepresentadas' porque el proceso se detiene apenas aparecen."*

El resultado real es que la proporción de mujeres es exactamente **$0{,}49$** — idéntica a la probabilidad de nacimiento. La tradición no distorsiona nada.

El error intuitivo es confundir la **regla de parada** (cuándo dejar de tener hijos) con las **probabilidades de nacimiento** (qué tan probable es que cada hijo sea mujer). La regla de parada afecta el tamaño de las familias, pero no puede cambiar la probabilidad de cada nacimiento individual.

---

### 2. Idea clave

**Linealidad de la esperanza + ley de los grandes números**: la proporción de mujeres en la población es el cociente entre el número esperado de mujeres por familia y el número esperado de hijos por familia. Ambas cantidades se calculan con la distribución geométrica.

---

### 3. Resolución paso a paso

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

### 4. Argumento alternativo: cada nacimiento es independiente

Una forma aún más directa: considerá cualquier nacimiento en la población. No importa si es el primero, el segundo o el décimo hijo de una familia — **cada nacimiento es independientemente mujer con probabilidad $0{,}49$**, porque la biología no cambia según el orden de nacimiento.

La regla de parada solo determina cuántos nacimientos ocurren en total en cada familia, pero no puede "seleccionar" qué nacimientos son de mujeres. El último nacimiento de cada familia (el que detiene el proceso) es mujer, sí — pero también es mujer con probabilidad $p$ como cualquier otro, por lo que no hay sesgo.

---

### 5. ¿Y si la proporción biológica fuera 50/50?

Si $p = 0{,}5$, la proporción en la población sería también exactamente $0{,}5$. Esto refuta la idea de que esta tradición podría "balancear" una población con más varones: la tradición no altera la proporción natural.

| Prob. de mujer ($p$) | Proporción en población |
|----------------------|------------------------|
| $0{,}30$ | $0{,}30$ |
| $0{,}49$ | $0{,}49$ |
| $0{,}50$ | $0{,}50$ |
| $0{,}70$ | $0{,}70$ |

La proporción en la población siempre iguala $p$, sin importar la regla de parada.

---

### 6. Generalización

Este resultado vale para **cualquier regla de parada** que dependa solo de los nacimientos pasados (no del futuro), siempre que:
1. Cada nacimiento sea independiente con probabilidad fija $p$ de ser mujer.
2. La regla de parada garantice que cada familia tenga al menos un hijo.

En general, si cada familia tiene $N$ hijos (donde $N$ puede ser cualquier variable aleatoria independiente de los sexos), la proporción de mujeres es:

$$\frac{\mathbb{E}[\text{mujeres}]}{\mathbb{E}[N]} = \frac{p \cdot \mathbb{E}[N]}{\mathbb{E}[N]} = p$$

La regla de parada define la distribución de $N$, pero al cancelarse en el cociente, no afecta la proporción.

---

## Ejercicio 21

> En una elección, el candidato A obtuvo 60 votos y el candidato B obtuvo 40. Si los votos se cuentan de uno en uno, ¿cuál es la probabilidad de que, durante todo el escrutinio, el candidato A se mantenga siempre por delante del candidato B?

---

### 1. ¿Por qué es paradójico?

La intuición dice: *"A ganó 60 a 40, una diferencia cómoda. Debe ser bastante probable que haya estado adelante todo el tiempo."*

El resultado real es solo **20%**. A pesar de ganar por 20 votos, hay un 80% de chance de que en algún momento del conteo B haya empatado o superado a A. La ventaja final no garantiza liderazgo durante el proceso.

---

### 2. Idea clave

**Lema del ciclo** (Cycle Lemma, Dvoretzky–Motzkin 1947): entre todas las rotaciones circulares de una secuencia de $a$ votos A y $b$ votos B con $a > b$, exactamente $a - b$ de las $a + b$ rotaciones tienen a A estrictamente adelante en todo momento. Esto da la probabilidad directamente.

---

### 3. Resolución paso a paso

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

### 4. Demostración del lema del ciclo

Sea $(x_1, x_2, \ldots, x_n)$ una secuencia circular con $x_i \in \{+1, -1\}$, $n = a+b$, suma total $a - b > 0$. Para cada rotación $r$, definimos las sumas parciales:

$$S_k^{(r)} = x_{r+1} + x_{r+2} + \cdots + x_{r+k} \pmod{n}$$

La rotación $r$ es **buena** si $S_k^{(r)} > 0$ para todo $k = 1, \ldots, n$.

Equivalentemente, $r$ es buena si y solo si la posición $r+1$ es el **mínimo global único** de la secuencia circular acumulada. Como la suma total es $a - b > 0$, hay exactamente $a - b$ posiciones donde ocurren mínimos del tipo "nuevo mínimo estricto desde el inicio circular", lo que da exactamente $a - b$ rotaciones buenas.

---

### 5. Verificación con casos pequeños

**$a = 2, b = 1$:** Las $\binom{3}{1} = 3$ secuencias son AAB, ABA, BAA.

- **AAB**: sumas parciales $1, 2, 1$ → siempre positivo. ✓
- **ABA**: sumas parciales $1, 0, 1$ → toca 0. ✗
- **BAA**: sumas parciales $-1, 0, 1$ → baja a negativo. ✗

$P = \frac{1}{3} = \frac{a-b}{a+b} = \frac{2-1}{3}$. ✓

---

### 6. Generalización — Teorema de la Boleta

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
