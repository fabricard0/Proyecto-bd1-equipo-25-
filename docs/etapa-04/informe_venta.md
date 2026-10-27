### Informe de ventas por categoría

**Objetivo:**

Obtener un informe de ventas agrupado por categoría de producto dentro de un período determinado. La consulta permite conocer la cantidad total de unidades vendidas, el importe total recaudado y la cantidad de ventas diferentes en las que participó cada categoría.


**Tablas involucradas:**

* `VENTA`: contiene la información general de las operaciones comerciales, incluyendo la fecha y hora de cada venta.
* `DETALLE_VENTA`: registra los productos incluidos en cada operación, junto con las cantidades vendidas y los subtotales correspondientes.
* `PRODUCTO`: proporciona el nombre y la categoría a la que pertenece cada producto.


**Funcionamiento:**


La consulta utiliza `INNER JOIN` para relacionar las tablas `VENTA`, `DETALLE_VENTA` y `PRODUCTO`. Esto permite asociar cada operación con los productos vendidos y sus respectivas categorías.

La cláusula `WHERE` limita los resultados a las ventas realizadas desde el 10 de septiembre de 2026 hasta antes del 18 de septiembre de 2026. De esta manera, se incluyen las operaciones del 10 al 17 de septiembre, ambos inclusive.

Finalmente, `ORDER BY total_vendido DESC` ordena los resultados de mayor a menor según el importe total vendido, permitiendo identificar rápidamente las categorías que generaron mayores ingresos durante el período analizado.

**Resultado esperado:**

Se obtiene una tabla con una fila por cada categoría que tenga productos vendidos durante el período seleccionado. Para cada categoría se muestran las unidades vendidas, el importe total acumulado y la cantidad de ventas diferentes en las que participó.

**Utilidad de la consulta:**

Este informe permite analizar el comportamiento comercial de la veterinaria, comparar las ventas entre categorías y reconocer cuáles generaron mayores ingresos. También proporciona información útil para evaluar la demanda de los productos y planificar futuras compras de mercadería.

**Archivo de la consulta:** [informe_venta.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/informe_ventas.sql)
