# Etapa IV – Consultas y Casos de Uso


## 1. Consideraciones generales


Esta etapa tiene como objetivo implementar consultas SQL que permitan obtener información relevante para la gestión de una veterinaria, incluyendo las ventas de productos, los tratamientos realizados a las mascotas y la emisión de comprobantes de venta.
Para realizar las consultas utilizamos operaciones de:

* `INNER JOIN` para relacionar información de distintas tablas.
* `SUM()` para calcular importes y cantidades acumuladas.
* `COUNT()` y `COUNT(DISTINCT ...)` para realizar recuentos.
* `GROUP BY` para agrupar resultados.
* `HAVING` para filtrar grupos según condiciones agregadas.
* `WHERE` para limitar los registros según fechas o identificadores.
* `ORDER BY` para ordenar los resultados.

Las consultas están desarrolladas para ejecutarse en SQL Server y utilizan las tablas existentes en la base de datos `VETERINARIA`.
Como condición necesaria para el funcionamiento de las consultas es necesario que los archivos [crear_bd.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/ddl/crear_bd.sql) y [datos_prueba.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/dml/datos_bd.sql) hallan sido ejecutados previamente en SQL server



## 3. Índice de casos de uso



| N.º | Caso de uso | Consulta | Archivo |
|:---:|---|---|---|
| 01 | Emitir comprobante de venta | Factura o comprobante de venta | [comprobante_venta.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/comprobante_venta.md) |
| 02 | Conocer cuánto se vendió por cada categoría dentro de un rango de fechas | Informe de ventas por categoría | [informe_venta.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/informe_venta.md) |
| 03 | Identificar productos con más de 10 unidades vendidas | Productos vendidos por encima de 10 unidades | [consultas_avanzadas.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/consultas_avanzadas.md) |
| 04 | Consultar mascotas con más de un tratamiento | Mascotas que recibieron más de un tratamiento | [consultas_avanzadas.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/consultas_avanzadas.md) |
| 05 | Identificar categorías con más de $100.000 en ventas | Categorías con ventas superiores al importe establecido | [consultas_avanzadas.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/consultas_avanzadas.md) |
| 06 | Consultar tratamientos realizados por veterinario | Tratamientos realizados a las mascotas por veterinario | [consultas_avanzadas.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/consultas_avanzadas.md) |


En cada archivo correspondiente a cada caso de uso se podrá encontrar información mas detallada sobre cada consulta


## 4. Estructura de archivos etapa-04


Los archivos para esta etapa están ordenados de la siguiente manera:

```text
Proyecto-Veterinaria/
├── docs/
│   └── etapa-04/
│       ├── casos-uso.md
│       ├── comprobante_venta.md
│       ├── informe_venta.md
│       └── consultas_avanzadas.md  
└── sql/
    └── consultas/
        ├── comprobante_venta.sql
        ├── informe_venta.sql
        └── consultas_avanzadas.sql
```

## 5. Conclusión


Las consultas implementadas permiten obtener información útil para la gestión de la veterinaria. A través de ellas se pueden consultar comprobantes, identificar productos de mayor volumen de venta, analizar el rendimiento comercial por categoría y consultar el historial de tratamientos de las mascotas.



