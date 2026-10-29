# Transacciones

En este archivo se encuentran los casos 7, 8 y 9, en los que se trabaja con transacciones. Se realizan operaciones de inserción, actualización y eliminación de datos, utilizando transacciones simples y anidadas para comprobar que los cambios se realicen correctamente.

### Casos implementados

**1. Caso 7: Transacciones anidadas y control de errores**

Se realiza el registro de una venta y su detalle mediante transacciones anidadas. También se incluye una prueba que genera un error de manera intencional para comprobar que los cambios se deshagan y no queden datos guardados de forma incompleta.

**2. Caso 8: Actualización de productos y proveedores**

Se realizan operaciones de inserción o actualización en la relación entre productos y proveedores, junto con la actualización del stock. Las operaciones se encuentran dentro de una transacción para mantener la consistencia de los datos ante posibles errores.

**3. Caso 9: Eliminación de una venta de prueba**

Se elimina una venta creada durante las pruebas, junto con su detalle, y se devuelve al stock la cantidad de productos que se habían descontado. Las operaciones se realizan dentro de una transacción para evitar que los datos queden inconsistentes.

Los casos de prueba están incluidos en el mismo script SQL, después de las operaciones correspondientes, para comprobar su funcionamiento y verificar los resultados.

### Ventajas de implementación

- Permite mantener la información consistente cuando se realizan varias operaciones relacionadas.
- Evita que queden cambios guardados si ocurre un error durante una transacción.
- Facilita la recuperación de los datos cuando una operación no se completa correctamente.
- Permite comprobar el funcionamiento de las transacciones mediante los casos de prueba incluidos.

Todas estas funciones se encuentran en el siguiente archivo: [ scripts_transaccion.sql](sql/tecnico/procedimientos/transacciones/scripts_transaccion.sql)


[Ver script de transacciones en GitHub](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/tecnico/procedimientos/transacciones/scripts_transaccion.sql)
