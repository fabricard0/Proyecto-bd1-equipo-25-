
# Implementación - Base de Datos VETERINARIA

## 1. Creación de la base de datos

Se implementó la base de datos `VETERINARIA` utilizando Microsoft SQL Server.

Antes de realizar la creación, se verifica si existe una base de datos con el mismo nombre mediante una consulta al catálogo del sistema (`sys.databases`). En caso de existir, se establece temporalmente en modo `SINGLE_USER` utilizando la opción `WITH ROLLBACK IMMEDIATE`, lo que permite finalizar las conexiones activas y revertir las transacciones pendientes.

Posteriormente, se elimina la base de datos existente mediante `DROP DATABASE` y se crea nuevamente utilizando `CREATE DATABASE`.

Finalmente, se selecciona la base de datos mediante la instrucción `USE VETERINARIA`, para que las operaciones posteriores se ejecuten sobre ella.


## 2. Creación de tablas

Se crearon 16 tablas para representar las diferentes áreas de funcionamiento de la veterinaria. Estas permiten administrar la información de clientes, mascotas, veterinarios, consultas médicas, tratamientos, medicamentos, productos, proveedores, stock y ventas.

Las tablas implementadas son:

- `CLIENTE`
- `VETERINARIO`
- `ESPECIALIDAD`
- `METODO_PAGO`
- `PROVEEDOR`
- `PRODUCTO`
- `MEDICAMENTO`
- `MASCOTA`
- `CONSULTA`
- `TRATAMIENTO`
- `VENTA`
- `DETALLE_VENTA`
- `DETALLE_TRATAMIENTO`
- `VETERINARIO_ESPECIALIDAD`
- `PRODUCTO_PROVEEDOR`
- `STOCK`

Archivo utilizado para la creación de la base de datos: [crear_bd.sql](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/ddl/crear_bd.sql)


## 3. Relaciones entre las tablas

Las relaciones entre las entidades se implementaron mediante claves foráneas (`FOREIGN KEY`), garantizando la integridad referencial y evitando que se registren referencias a identificadores inexistentes.

También se utilizaron tablas intermedias para representar las relaciones de muchos a muchos.

### 3.1. Relaciones de clientes y mascotas

- Un cliente puede tener varias mascotas.
- Cada mascota pertenece a un único cliente.

La relación se implementa mediante la clave foránea `MASCOTA.id_cliente`, que referencia a `CLIENTE.id_cliente`.

### 3.2. Relaciones de veterinarios y especialidades

- Un veterinario puede tener varias especialidades.
- Una especialidad puede estar asociada a varios veterinarios.

La relación se representa mediante la tabla intermedia `VETERINARIO_ESPECIALIDAD`, cuya clave primaria está compuesta por `id_veterinario` e `id_especialidad`.

### 3.3. Relaciones de consultas y tratamientos

- Una mascota puede tener varias consultas.
- Cada consulta corresponde a una única mascota.
- Un veterinario puede realizar varias consultas.
- Cada consulta está asociada a un único veterinario.
- Una consulta puede tener varios tratamientos.
- Cada tratamiento está asociado a una única consulta.

Estas relaciones se implementan mediante las claves foráneas de `CONSULTA` y `TRATAMIENTO`.

### 3.4. Relaciones de tratamientos y medicamentos

- Un tratamiento puede incluir varios medicamentos.
- Un medicamento puede formar parte de distintos tratamientos.

La relación se representa mediante `DETALLE_TRATAMIENTO`, cuya clave primaria compuesta está formada por `id_medicamento` e `id_tratamiento`.

Esta tabla también almacena información particular de cada medicamento indicado, como cantidad, dosis y duración.

### 3.5. Relaciones de medicamentos y productos

Cada medicamento se relaciona con un producto mediante el campo `id_producto` de la tabla `MEDICAMENTO`.

La restricción `UNIQUE` sobre este campo garantiza que un mismo producto no pueda estar asociado a varios registros de medicamento. Además, la clave foránea asegura que el producto relacionado exista previamente.

### 3.6. Relaciones de productos y proveedores

- Un producto puede ser suministrado por varios proveedores.
- Un proveedor puede suministrar varios productos.

Esta relación se implementa mediante la tabla intermedia `PRODUCTO_PROVEEDOR`, cuya clave primaria compuesta está formada por `id_producto` e `id_proveedor`.

También se almacenan el precio de compra y la cantidad correspondiente a cada relación.

### 3.7. Relaciones de productos y stock

Cada producto puede tener un registro de stock asociado.

La relación se establece mediante `STOCK.id_producto`, que referencia a `PRODUCTO.id_producto`. La restricción `UNIQUE` garantiza que no existan varios registros de stock para un mismo producto.

### 3.8. Relaciones de ventas

- Un cliente puede realizar varias ventas.
- Cada venta pertenece a un único cliente.
- Una venta puede incluir varios productos.
- Un producto puede aparecer en diferentes ventas.
- Cada venta utiliza un método de pago.

La relación entre `VENTA` y `PRODUCTO` se representa mediante `DETALLE_VENTA`, que contiene las cantidades, los precios unitarios y los subtotales de los artículos comercializados.

La relación entre `VENTA` y `METODO_PAGO` permite identificar el medio utilizado para realizar cada operación.


## 4. Restricciones de integridad implementadas

Durante la creación de las tablas se establecieron diferentes restricciones para garantizar la consistencia de los datos y respetar las reglas de negocio de la veterinaria.

### 4.1. Integridad de entidad

Se definieron claves primarias en todas las tablas.

Las tablas principales utilizan identificadores autoincrementales mediante `IDENTITY(1,1)`, mientras que las tablas intermedias utilizan claves primarias compuestas para identificar cada relación.

### 4.2. Integridad referencial

Se implementaron claves foráneas para garantizar que los registros relacionados existan previamente.

Entre las principales relaciones se encuentran:

- `MASCOTA` con `CLIENTE`.
- `CONSULTA` con `MASCOTA` y `VETERINARIO`.
- `TRATAMIENTO` con `CONSULTA`.
- `MEDICAMENTO` con `PRODUCTO`.
- `DETALLE_TRATAMIENTO` con `MEDICAMENTO` y `TRATAMIENTO`.
- `VETERINARIO_ESPECIALIDAD` con `VETERINARIO` y `ESPECIALIDAD`.
- `PRODUCTO_PROVEEDOR` con `PRODUCTO` y `PROVEEDOR`.
- 

### 4.3. Integridad de dominio

Se incorporaron restricciones `UNIQUE` y `CHECK` para controlar los valores permitidos.

Entre las validaciones implementadas se encuentran:

- El email de los clientes debe ser único.
- El teléfono y el email de los veterinarios deben ser únicos.
- El email de los proveedores debe ser único.
- El precio de los productos debe ser mayor o igual a cero.
- El tipo de medicamento debe pertenecer a los valores permitidos.
- La cantidad de los medicamentos debe ser mayor a cero.
- La edad de las mascotas no puede ser negativa.

Estas restricciones permiten evitar valores inválidos y mantener la coherencia de las operaciones registradas.

## 5. Carga de datos de prueba

Una vez finalizada la creación de las tablas y sus relaciones, se realizó la carga de datos mediante instrucciones `INSERT INTO`.

Se incorporaron registros correspondientes a clientes, veterinarios, especialidades, mascotas, consultas, tratamientos, medicamentos, productos, proveedores, métodos de pago, ventas y sus respectivos detalles.

Esta etapa permitió comprobar el funcionamiento de las relaciones y las restricciones implementadas, además de disponer de información para realizar consultas y probar las funcionalidades del sistema.

Archivo utilizado para el poblado de la base de datos: [datos_prueba.sqll](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/dml/datos_prueba.sql)

## 6. Conclusión

La implementación de la base de datos `VETERINARIA` permitió construir una estructura organizada para administrar las principales actividades del establecimiento, integrando tanto el área de atención médica como el sector comercial.

La utilización de claves primarias, claves foráneas, restricciones de unicidad y validaciones de dominio permite mantener la consistencia de la información y reducir la posibilidad de registrar datos incorrectos.

Asimismo, la incorporación de tablas intermedias permite representar adecuadamente las relaciones de muchos a muchos, mientras que la separación de la información general de los productos y los datos específicos de los medicamentos contribuye a organizar mejor la estructura.

Finalmente, la carga de datos de prueba, el desarrollo de consultas SQL y la implementación de funciones definidas por el usuario permitieron comprobar las posibilidades de la base de datos y disponer de una estructura que responde a las necesidades de gestión de la veterinaria.
