## Procedimientos Almacenados

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

Para esta etapa se implementaron las siguientes funciones para resolver necesidades relacionadas con la gestión de ventas, el control de stock de productos, el seguimiento de los gastos de los clientes y la consulta del historial médico de las mascotas.


### 1. Cálculo del total de una venta

La función `fn_totalVenta` recibe el identificador de una venta y calcula el importe total mediante la suma de los subtotales registrados en la tabla `DETALLE_VENTA`.

Esta función permite obtener el total de una venta sin tener que escribir nuevamente la consulta de suma cada vez que se necesita el resultado. Si la venta no tiene detalles registrados, devuelve cero.

### 2. Consulta del stock disponible

La función `fn_stockDisponible` recibe el identificador de un producto y consulta su cantidad registrada en la tabla `STOCK`.

Su finalidad es facilitar el acceso a la información de inventario de los productos comercializados por la veterinaria. Si no existe un registro de stock para el producto, la función devuelve `NULL`, lo que permite distinguir esa situación de un stock registrado con cantidad cero.

### 3. Cálculo del gasto total de un cliente

La función `fn_gastoTotalCliente` recibe el identificador de un cliente y suma los importes de sus ventas registradas en la tabla `VENTA`.

Esta función permite conocer el gasto acumulado de cada cliente y facilita la consulta de información relacionada con las operaciones comerciales. Si el cliente no tiene ventas registradas, devuelve cero.

### 4. Consulta de los motivos de atención de una mascota

La función `fn_consultasMascota` recibe el identificador de una mascota y devuelve los motivos de las consultas asociadas a ella en la tabla `CONSULTA`.

A diferencia de las funciones anteriores, esta función devuelve una tabla, ya que una mascota puede tener varias consultas registradas. De esta manera, permite recuperar información del historial de atenciones veterinarias mediante una única llamada.

## Beneficios de la implementación

La incorporación de estas funciones aporta los siguientes beneficios al sistema:

- **Reutilización del código:** permite ejecutar operaciones frecuentes sin repetir las mismas consultas SQL.
- **Organización:** concentra la lógica de determinadas operaciones dentro de objetos específicos de la base de datos.
- **Simplificación de consultas:** facilita la obtención de resultados relacionados con ventas, productos, clientes y mascotas.

Los scripts y evidencias de las funciones están en [procedimientos_funciones](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/tree/main/sql/tecnico/procedimientos/procedimientos_funciones)
