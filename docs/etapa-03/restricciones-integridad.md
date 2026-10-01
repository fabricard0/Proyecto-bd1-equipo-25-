
# Restricciones e integridad

Durante la implementación de la base de datos se definieron diferentes restricciones para garantizar la integridad, consistencia y validez de los datos almacenados.

## 1. Claves primarias

Cada tabla principal posee una clave primaria (`PRIMARY KEY`) que permite identificar de manera única cada registro.

Por ejemplo:

- `CLIENTE`: `id_cliente`
- `VETERINARIO`: `id_veterinario`
- `ESPECIALIDAD`: `id_especialidad`
- `MEDICAMENTO`: `id_medicamento`
- `PRODUCTO`: `id_producto`
- `MASCOTA`: `id_mascota`
- `CONSULTA`: `id_nroConsulta`
- `TRATAMIENTO`: `id_tratamiento`
- `VENTA`: `id_venta`

En las tablas que representan relaciones de muchos a muchos se utilizaron claves primarias compuestas. Por ejemplo, `DETALLE_VENTA` utiliza `(id_producto, id_venta)` y `DETALLE_TRATAMIENTO` utiliza `(id_medicamento, id_tratamiento)`.

## 2. Claves foráneas

Se definieron claves foráneas (`FOREIGN KEY`) para mantener la integridad referencial entre las tablas.

Algunos ejemplos son:

- `MASCOTA.id_cliente` referencia a `CLIENTE.id_cliente`.
- `CONSULTA.id_mascota` referencia a `MASCOTA.id_mascota`.
- `CONSULTA.id_veterinario` referencia a `VETERINARIO.id_veterinario`.
- `TRATAMIENTO.nro_consulta` referencia a `CONSULTA.id_nroConsulta`.
- `VENTA.id_cliente` referencia a `CLIENTE.id_cliente`.
- `DETALLE_VENTA.id_producto` referencia a `PRODUCTO.id_producto`.
- `DETALLE_VENTA.id_venta` referencia a `VENTA.id_venta`.

De esta manera, no se pueden establecer relaciones con registros que no existan en las tablas referenciadas.

## 3. Restricciones UNIQUE

Se utilizaron restricciones `UNIQUE` para evitar la duplicación de determinados datos.

En `CLIENTE` se estableció que el correo electrónico debe ser único:

```sql
CONSTRAINT uq_cliente_email UNIQUE(email)
