### Consultas Avanzadas


Para esta parte contamos con 4 consultas que son las siguientes:

**01 – Identificar productos con más de 10 unidades vendidas**

**Objetivo:** Identificar los productos que superaron las 10 unidades vendidas durante septiembre de 2026, mostrando también su categoría y el importe total vendido.


**Tablas involucradas:**

* `PRODUCTO`
* `DETALLE_VENTA`
* `VENTA`


**Funcionamiento:**

La consulta relaciona los productos con los detalles de venta y las ventas correspondientes. Después, filtra las operaciones comprendidas entre el 1 y el 30 de septiembre de 2026, agrupa los resultados por producto y categoría y calcula las unidades vendidas y el importe acumulado.

La cláusula `HAVING SUM(dv.cantidad) > 10` conserva únicamente los productos cuya cantidad total vendida supera las 10 unidades.

**Resultado esperado:**

Una lista de productos que cumplen la condición, ordenados de mayor a menor según las unidades vendidas.

**Archivo consulta:** [consulta_avanzada.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/consulta_avanzada.sql)


 **02 – Consultar mascotas con más de un tratamiento**


**Objetivo:** Identificar las mascotas que recibieron más de un tratamiento registrado, mostrando el nombre de la mascota, los datos de su propietario y la cantidad de tratamientos asociados.


**Tablas involucradas:**

* `MASCOTA`
* `CLIENTE`
* `CONSULTA`
* `TRATAMIENTO`


**Funcionamiento:**

La consulta relaciona cada mascota con su propietario, sus consultas y los tratamientos asociados a esas consultas. Luego agrupa los resultados por mascota y propietario y utiliza `COUNT(t.id_tratamiento)` para contar los tratamientos registrados.

La cláusula `HAVING COUNT(t.id_tratamiento) > 1` muestra solamente las mascotas que tienen más de un tratamiento asociado.

**Resultado esperado:**

Una lista de mascotas que cumplen la condición, junto con el nombre y apellido de su propietario y la cantidad de tratamientos registrados.

**Archivo consulta:** [consulta_avanzada.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/consulta_avanzada.sql)

 **03 – Identificar categorías con más de $100.000 en ventas**

**Objetivo:** Identificar las categorías de productos que acumularon más de $100.000 en ventas durante septiembre de 2026 y que participaron en al menos tres ventas diferentes.


**Tablas involucradas:**

* `PRODUCTO`
* `DETALLE_VENTA`
* `VENTA`


**Funcionamiento:**

La consulta agrupa los registros por categoría y calcula el importe total vendido mediante `SUM(dv.subtotal)`. Además, cuenta las ventas diferentes en las que participó cada categoría mediante `COUNT(DISTINCT v.id_venta)`.

Se aplican dos condiciones mediante `HAVING`:

* El importe total vendido debe superar los $100.000.
* La categoría debe aparecer en al menos tres ventas diferentes.
Finalmente, los resultados se ordenan de mayor a menor importe vendido.

estas condiciones pueden ser modificadas en la consulta

**Resultado esperado:**

Una lista de categorías que cumplen ambas condiciones, junto con el importe total acumulado y la cantidad de ventas diferentes en las que participaron.

**Archivo consulta:** [consulta_avanzada.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/consulta_avanzada.sql)

 **04 – Consultar tratamientos realizados a las mascotas por veterinario**

**Objetivo:** Consultar los tratamientos registrados para las mascotas, indicando qué veterinario intervino y cuál fue la duración del tratamiento.


**Tablas involucradas:**

* `MASCOTA`
* `CONSULTA`
* `VETERINARIO`
* `TRATAMIENTO`


**Funcionamiento:**

La consulta relaciona las mascotas con sus consultas, los veterinarios que participaron en ellas y los tratamientos registrados. Devuelve el nombre de la mascota, el nombre y apellido del veterinario, la descripción del tratamiento y su duración.

La cláusula `ORDER BY m.nombre` ordena los resultados alfabéticamente por el nombre de la mascota.

**Resultado esperado:**

Un listado de los tratamientos registrados, asociados a cada mascota y al veterinario correspondiente, con la duración informada en la tabla `TRATAMIENTO`.

**Archivo consulta:** [consulta_avanzada.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/consulta_avanzada.sql)





