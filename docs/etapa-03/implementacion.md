
# Informe de implementación

## 1. Creación de la base de datos

Se implementó la base de datos `VETERINARIA` utilizando SQL Server. Antes de crearla, se verifica si existe una base de datos con el mismo nombre y, en caso de existir, se establece temporalmente en modo `SINGLE_USER` y se elimina para realizar una nueva implementación.

## 2. Creación de tablas

Se crearon las tablas necesarias para representar la información de la veterinaria:

- `CLIENTE`
- `VETERINARIO`
- `ESPECIALIDAD`
- `MEDICAMENTO`
- `METODO_PAGO`
- `PROVEEDOR`
- `PRODUCTO`
- `MASCOTA`
- `CONSULTA`
- `TRATAMIENTO`
- `VENTA`
- `DETALLE_VENTA`
- `DETALLE_TRATAMIENTO`
- `VETERINARIO_ESPECIALIDAD`
- `MEDICAMENTO_PROVEEDOR`
- `PRODUCTO_PROVEEDOR`
- `STOCK`

Cada tabla posee una clave primaria para identificar de manera única sus registros.

## 3. Relaciones

Se implementaron las relaciones entre las tablas mediante claves foráneas.

También se utilizaron tablas intermedias para representar relaciones de muchos a muchos, como `VETERINARIO_ESPECIALIDAD`, `MEDICAMENTO_PROVEEDOR` y `PRODUCTO_PROVEEDOR`.

Las tablas `DETALLE_VENTA` y `DETALLE_TRATAMIENTO` permiten almacenar los elementos asociados a cada venta y tratamiento respectivamente.

Se utilizaron diferentes tipos de datos según la información almacenada, entre ellos `VARCHAR`, `INT`, `DECIMAL`, `DATE`, `TIME` y `DATETIME`.
