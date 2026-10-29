# Transacciones

En este archivo se encuentran los casos 7, 8 y 9, donde se trabaja con transacciones en SQL Server. Se realizan operaciones de inserción, actualización y eliminación de datos, utilizando transacciones simples y anidadas para comprobar que los cambios se realicen correctamente.

También se incluye un caso de prueba que genera un error de manera intencional para verificar que, ante un problema, se deshagan los cambios realizados y no queden datos guardados de forma incompleta.

Los casos de prueba están incluidos en el mismo script `scripts-transaccion.sql`, después de las operaciones correspondientes, para comprobar su funcionamiento y verificar los resultados.

## Ventajas de implementación

- Permite mantener la información consistente cuando se realizan varias operaciones relacionadas.
- Evita que queden cambios guardados si ocurre un error durante una transacción.
- Facilita la comprobación del funcionamiento de las transacciones mediante los casos de prueba incluidos.
