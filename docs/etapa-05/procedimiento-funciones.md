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
