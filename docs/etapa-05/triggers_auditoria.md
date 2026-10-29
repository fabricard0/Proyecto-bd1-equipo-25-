# Triggers en SQL Server

En este archivo se encuentran los casos 10, 11 y 12, en los que se utilizan triggers para controlar determinadas operaciones dentro de la base de datos Veterinaria.

Se implementa un trigger que actualiza automáticamente el stock cuando se registra una venta y evita que se vendan productos cuando no hay cantidad suficiente. También se incluyen triggers de auditoría para guardar los datos anteriores a una modificación o eliminación, junto con la fecha, la hora y el usuario de la base de datos que realizó la operación.

Por último, se agrega un trigger que impide eliminar productos que todavía están relacionados con otros registros o que tienen stock disponible.

Los casos de prueba están incluidos en el mismo script `scripts-triggers.sql`. Estos permiten comprobar la actualización del stock, el registro de las operaciones en la tabla de auditoría y el bloqueo de eliminaciones que no corresponden.

## Ventajas de implementación

- Ayuda a mantener actualizado el stock sin tener que modificarlo manualmente.
- Permite controlar ciertas operaciones y evitar errores en los datos.
- Facilita el seguimiento de modificaciones y eliminaciones mediante la auditoría.
- Permite comprobar el funcionamiento de los triggers con los casos de prueba incluidos.
