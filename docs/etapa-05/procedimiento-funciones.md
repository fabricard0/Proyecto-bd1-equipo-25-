## Procedimientos 

Para esta etapa se implementaron los siguientes procedimientos almacenados para resolver necesidades operativas relacionadas con la registración integral de ventas con validación de inventario, la consulta del historial clínico completo de las mascotas y la búsqueda optimizada de productos por categoría.


### 1. Registro integral de ventas

El procedimiento `sp_registrarVenta` recibe como parámetros el identificador del cliente, del método de pago, del producto y la cantidad a comprar. Realiza la verificación previa del stock disponible mediante la función `fn_stockDisponible`, calcula los importes correspondientes y ejecuta una transacción que inserta los registros en las tablas `VENTA` y `DETALLE_VENTA`, actualizando automáticamente las existencias en `STOCK`.

Este procedimiento garantiza la atomicidad de la operación: si no existe stock suficiente o falla alguna inserción, se interrumpe la ejecución evitando inconsistencias en los datos.

### 2. Historial clínico de mascotas

El procedimiento `sp_historialClinicoMascota` recibe el identificador de una mascota y devuelve su historial médico detallado mediante el cruzamiento de las tablas `MASCOTA`, `CONSULTA_MEDICA`, `VETERINARIO` y `TRATAMIENTO`, ordenado cronológicamente desde la consulta más reciente.

Su finalidad es permitir al personal veterinario acceder de forma rápida y centralizada a los diagnósticos, profesionales responsables, tratamientos y medicamentos aplicados a un paciente.

### 3. Consulta de productos por categoría

El procedimiento `sp_consultarProductosCategoria` recibe una categoría de producto como parámetro y devuelve todos los artículos pertenecientes a ella, mostrando su identificador, nombre, precio y cantidad disponible en stock.

Este procedimiento facilita el control de inventario y la atención comercial al concentrar la información del catálogo filtrada y ordenada alfabéticamente.

## Beneficios de la implementación

La incorporación de estos procedimientos almacenados aporta los siguientes beneficios al sistema:

- **Integridad y seguridad operativamente garantizada:** asegura que operaciones sensibles, como el registro de ventas y descuento de inventarios, se ejecuten dentro de una transacción coherente.
- **Centralización de la lógica de negocio:** permite ejecutar operaciones complejas desde el motor de base de datos sin duplicar sentencias SQL en la capa de aplicación.
- **Facilidad de mantenimiento y consulta:** estandariza las búsquedas frecuentes sobre el historial clínico y el catálogo de productos para el consumo directo del equipo.
  
## Funciones 

### 1. Definición y objetivo

Las funciones definidas por el usuario (UDF, *User-Defined Functions*) en SQL Server son objetos de la base de datos que permiten encapsular una serie de instrucciones SQL para realizar una operación específica y devolver un resultado.

Su objetivo principal es reutilizar lógica de consulta o cálculo, evitando repetir código en distintas partes del sistema.

En el sistema de gestión de la veterinaria, las funciones permiten realizar cálculos relacionados con las ventas, consultar el stock disponible y obtener información sobre los clientes y sus mascotas.

SQL Server permite crear diferentes tipos de funciones:

- **Funciones escalares:** devuelven un único valor, como un número, una cadena de texto o una fecha.
- **Funciones con valor de tabla:** devuelven un conjunto de filas y columnas que pueden utilizarse en consultas SQL.

### 2. Ventajas y aplicaciones

Las funciones definidas por el usuario presentan las siguientes ventajas:

- **Reutilización de código:** permiten utilizar una misma operación en diferentes consultas.
- **Modularidad:** dividen la lógica del sistema en componentes independientes.
- **Mantenimiento:** facilitan la modificación de cálculos sin tener que cambiar todas las consultas que los utilizan.
- **Consistencia:** aseguran que un mismo cálculo se realice de la misma manera en distintas partes del sistema.
- **Simplificación de consultas:** permiten reducir la complejidad de las instrucciones SQL.

#### Aplicaciones en el sistema de la veterinaria

| Función | Aplicación |
|---|---|
| `fn_totalVenta` | Calcula el importe total de una venta. |
| `fn_stockDisponible` | Consulta la cantidad disponible de un producto. |
| `fn_gastoTotalCliente` | Calcula el gasto acumulado de un cliente. |
| `fn_consultasMascota` | Obtiene las consultas médicas realizadas a una mascota. |


### 3. Caso concreto aplicado al sistema de ventas del equipo

En el sistema de gestión de la veterinaria se implementaron funciones para facilitar la obtención de información relevante relacionada con las ventas y la atención médica de las mascotas.

#### A) Función `fn_totalVenta`

Esta función recibe como parámetro el identificador de una venta y calcula el importe total sumando los subtotales de los productos registrados en `DETALLE_VENTA`.

Su aplicación permite conocer el total de una venta sin tener que escribir nuevamente la consulta de suma.

#### B) Función `fn_stockDisponible`

Esta función recibe el identificador de un producto y devuelve la cantidad disponible registrada en la tabla `STOCK`.

Permite consultar el stock de los productos comercializados por la veterinaria, como medicamentos, alimentos y artículos de higiene.

#### C) Función `fn_gastoTotalCliente`

Esta función recibe el identificador de un cliente y calcula el importe total de sus compras, sumando los montos registrados en la tabla `VENTA`.

Permite conocer cuánto dinero ha gastado un cliente en el establecimiento.

#### D) Función `fn_consultasMascota`

Esta función recibe el identificador de una mascota y devuelve una tabla con las consultas médicas realizadas.

La información obtenida incluye:

- Fecha de la consulta.
- Hora de la consulta.
- Motivo de la consulta.

Esta función facilita la consulta del historial médico de cada mascota.

### 4. Script de demostración y resultados obtenidos

los scripts de creación y utilización de las funciones implementadas en la base de datos de la veterinaria se encuentran en [scripts.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/tecnico/procedimientos/procedimientos_funciones/scripts.sql).

#### Función para calcular el total de una venta

**Consulta de demostración:**

```sql
SELECT dbo.fn_totalVenta(4) AS totalVenta;
```
**Resultado esperado:**

| totalVenta |
|---:|
| 25000.00 |


#### Función para consultar el stock disponible

**Consulta de demostración:**

```sql
SELECT dbo.fn_stockDisponible(4) AS STOCK;
```
**Resultado esperado:**

| STOCK |
|---:|
| 20 |



#### Función para calcular el gasto total de un cliente

**Consulta de demostración:**

```sql
SELECT dbo.fn_gastoTotalCliente(5) AS gastoTotal;
```

**Resultado esperado:**

| gastoTotal |
|---:|
| 44000.00 |

#### Función para obtener las consultas de una mascota

**Consulta de demostración:**

```sql
SELECT *
FROM dbo.fn_consultasMascota(1);
```
**Resultado esperado:**

| fecha | hora | motivo |
|---|---|---|
| 2026-09-01 | 09:00 | Fiebre y Falta de apetito |
| 2026-09-20 | 16:00 | Control General|


### Conclusión

Las funciones definidas por el usuario en SQL Server Express constituyen una herramienta útil para mejorar la organización, reutilización y mantenimiento del código SQL.

En el sistema de gestión de la veterinaria, su implementación permite automatizar cálculos relacionados con las ventas, consultar el stock disponible, obtener el gasto acumulado de los clientes y recuperar el historial de consultas de las mascotas.

De esta manera, las funciones contribuyen a simplificar las consultas y centralizar la lógica de determinadas operaciones, facilitando el desarrollo y mantenimiento del sistema de base de datos.
