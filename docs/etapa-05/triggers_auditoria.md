# Triggers y auditoría

En este archivo se encuentran los casos que se utilizan triggers para controlar determinadas operaciones dentro de la base de datos Veterinaria. Estos permiten automatizar acciones, registrar cambios y evitar operaciones que puedan afectar la integridad de los datos.

### Casos implementados

**1. Caso 10: Control y actualización automática del stock**

Se implementa un trigger que actualiza automáticamente el stock cuando se registra una venta. Además, verifica que exista stock suficiente para la cantidad solicitada y evita que se complete la operación cuando no hay unidades disponibles.

**2. Caso 11: Auditoría de modificaciones y eliminaciones**

Se implementan triggers que registran las modificaciones realizadas en los productos y las eliminaciones de ventas. La información se guarda en una tabla de auditoría, incluyendo los valores anteriores, la fecha, la hora y el usuario de la base de datos que realizó la operación.

**3. Caso 12: Control de eliminación de productos**

Se implementa un trigger que impide eliminar productos que todavía están relacionados con otros registros o que tienen stock disponible. De esta manera, se evita eliminar información que todavía se utiliza dentro de la base de datos.

Los casos de prueba están incluidos en el mismo script SQL y permiten verificar el funcionamiento de los triggers, comprobar el registro de las operaciones en la tabla de auditoría y confirmar que se bloqueen las eliminaciones que no corresponden.

### Ventajas de implementación

- Permite actualizar el stock automáticamente y reducir errores en su administración.
- Ayuda a mantener la integridad de los datos mediante controles sobre las operaciones.
- Facilita el seguimiento de las modificaciones y eliminaciones realizadas.
- Permite comprobar el funcionamiento de los triggers mediante los casos de prueba incluidos.

Todas estas funciones se encuentran en la carpeta [triggers-auditoria](sql/tecnico/procedimientos/triggers-auditoria).



