**Tablas involucradas:**

* `VENTA`: contiene la información general de la operación, como el identificador, la fecha, el monto total, el cliente y el método de pago.
* `CLIENTE`: proporciona el nombre y apellido del cliente asociado a la venta.
* `METODO_PAGO`: permite identificar el medio de pago utilizado para realizar la operación.
* `DETALLE_VENTA`: contiene los productos incluidos en la venta, las cantidades vendidas, los precios unitarios y los subtotales correspondientes.
* 

**Funcionamiento:**

La consulta utiliza las cláusulas `JOIN` para combinar la información almacenada en las cuatro tablas involucradas. De esta manera, reúne los datos generales de la venta con la información del cliente, el método de pago y los productos adquiridos.

El filtro `WHERE VENTA.id_venta = 1` permite consultar únicamente la venta cuyo identificador es 1. Este valor puede modificarse para obtener el comprobante de otra operación registrada en la base de datos.

Como una venta puede incluir varios productos, la consulta devuelve una fila por cada producto incluido en el detalle. Por este motivo, los datos generales de la factura, incluido el total, se repiten en cada fila correspondiente a esa venta.

**Resultado esperado:**

Se obtiene un listado detallado de los productos que componen la venta seleccionada. Cada fila presenta el número de factura, la fecha, el cliente, el método de pago, el código del producto, la cantidad, el precio unitario y el subtotal del renglón, una ves mostrado todos los productos de la venta al final de la tabla se muestra ### Emitir comprobante de venta

**Objetivo:**

Obtener el comprobante de una venta específica, mostrando de manera detallada la información de la operación realizada. El comprobante incluye el número de factura, la fecha y hora de la venta, los datos del cliente, el método de pago utilizado y el detalle de los productos vendidos, junto con sus cantidades, precios unitarios, subtotales y el importe total de la factura.


el total general de la factura.

**Utilidad de la consulta:**

Esta consulta permite verificar los artículos incluidos en una operación, consultar los importes registrados y recuperar la información necesaria para elaborar una representación del comprobante de venta. También facilita la revisión de operaciones anteriores y contribuye al control de las transacciones comerciales de la veterinaria.

**Archivo de la consulta:** [comprobante_venta.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/comprobante_venta.sql)
