## Restricciones de Integridad - VETERINARIA

Este documento detalla las reglas de integridad implementadas físicamente en la base de datos `VETERINARIA`, asegurando la consistencia y validez de los datos según las reglas de negocio del sistema de gestión de la veterinaria.

### 1. Integridad de Entidad (Claves Primarias)

Las tablas principales del sistema utilizan campos de identificación única como claves primarias (*Primary Key*). En las tablas que emplean identificadores autoincrementales, se utiliza la propiedad `IDENTITY(1,1)`.

- **cliente**: `id_cliente`
- **mascota**: `id_mascota`
- **veterinario**: `id_veterinario`
- **especialidad**: `id_especialidad`
- **consulta**: `id_consulta`
- **tratamiento**: `id_tratamiento`
- **medicamento**: `id_medicamento`
- **producto**: `id_producto`
- **stock**: `id_producto`
- **proveedor**: `id_proveedor`
- **producto_proveedor**: clave primaria compuesta por `id_producto` e `id_proveedor`
- **venta**: `id_venta`
- **detalle_venta**: clave primaria compuesta por `id_venta` e `id_producto`

Las claves primarias garantizan que cada registro pueda identificarse de manera única y que no existan valores duplicados ni nulos en los campos que las componen.

### 2. Integridad Referencial (Claves Foráneas y Acciones)

Las relaciones entre las tablas se implementan mediante claves foráneas (*Foreign Key*), garantizando que los registros relacionados existan previamente.

- **mascota -> cliente**: Cada mascota pertenece a un cliente existente. No se permite registrar una mascota con un cliente inexistente. La eliminación de un cliente asociado a mascotas queda restringida mientras existan registros relacionados, salvo que se haya definido una acción en cascada.

- **consulta -> mascota**: Cada consulta médica debe estar asociada a una mascota existente. No se permite eliminar una mascota que tenga consultas registradas, debido a la necesidad de conservar su historial médico.

- **consulta -> veterinario**: Cada consulta debe estar vinculada a un veterinario existente. La eliminación de un veterinario asociado a consultas queda restringida mientras existan registros relacionados.

- **tratamiento -> consulta**: Los tratamientos deben estar asociados a una consulta médica existente. Se mantiene la relación entre la atención realizada y el tratamiento indicado.

- **detalle_tratamiento -> tratamiento / medicamento**: La tabla intermedia establece la relación muchos a muchos entre tratamientos y medicamentos. Sus claves foráneas garantizan que cada medicamento y tratamiento referenciado exista.

- **medicamento -> producto**: Los medicamentos se relacionan con los productos comercializados por la veterinaria. Esto permite mantener la información general del producto separada de sus características específicas como medicamento.

- **producto_proveedor -> producto / proveedor**: La tabla intermedia permite relacionar productos con proveedores. Las claves foráneas garantizan que los productos y proveedores asociados existan.

- **detalle_venta -> venta / producto**: Cada detalle de venta debe estar asociado a una venta existente y a un producto registrado. No se permite incorporar productos inexistentes a una venta.

- **venta -> cliente**: Cada venta debe estar asociada a un cliente existente. Esto permite mantener el historial de compras de los clientes.


### 3. Integridad de Dominio (Validaciones, Valores por Defecto y Unicidad)

Se aplican restricciones específicas a nivel de columna para garantizar que los datos ingresados sean válidos y respeten las reglas de negocio del sistema, a continuación se muestran algunos de las tablas.

#### Tabla `cliente`

- **Email:** El correo electrónico debe ser único (`UNIQUE`) para evitar que dos clientes sean registrados con el mismo email.
- **Datos personales:** Los campos obligatorios no permiten valores nulos (`NOT NULL`).
- **Identificación:** `id_cliente` permite identificar de manera única a cada cliente.

#### Tabla `veterinario`

- **Teléfono:** El número de teléfono debe ser único (`UNIQUE`).
- **Email:** El correo electrónico debe ser único (`UNIQUE`).
- **Datos personales:** Los campos obligatorios no admiten valores nulos.
- **Identificación:** `id_veterinario` identifica de manera única a cada veterinario.

#### Tabla `consulta`

- **Fecha y hora:** La consulta debe contar con una fecha y hora válidas.
- **Motivo:** El motivo de la consulta debe registrarse para identificar la razón de la atención médica.
- **Mascota y veterinario:** Los identificadores correspondientes son obligatorios y deben referenciar registros existentes.
- **Identificación:** `id_consulta` es la clave primaria.

#### Tabla `medicamento`

- **Tipo:** El campo `tipo` solo admite los siguientes valores:

  - `'Comprimido'`
  - `'Inyectable'`
  - `'Crema'`
  - `'Solucion'`

  Esta validación se implementa mediante una restricción `CHECK`.

- **Cantidad:** El campo `cantidad` debe ser estrictamente mayor a 0, evitando cantidades negativas o iguales a cero.

- **Identificación:** `id_medicamento` permite identificar de manera única a cada medicamento.

#### Tabla `producto`

- **Identificación:** Cada producto posee un identificador único.
- **Datos obligatorios:** Los campos definidos como `NOT NULL` no permiten valores nulos.
- **Categoría:** Si el producto se encuentra relacionado con una categoría, debe referenciar una categoría existente.
- **Precio:** Si se encuentra definida una restricción de dominio sobre el precio, este debe respetar el valor mínimo establecido por la regla de negocio.

#### Tabla `producto_proveedor`

- **Producto y proveedor:** Ambos identificadores son obligatorios y deben referenciar registros existentes.
- **Unicidad:** La clave primaria compuesta por `id_producto` e `id_proveedor` evita registrar más de una vez la misma relación entre un producto y un proveedor.
- **Precio de compra:** Si se encuentra definido un `CHECK`, el precio de compra debe ser mayor a 0.
- **Cantidad:** Si existe una validación sobre la cantidad suministrada, esta debe respetar los valores permitidos.

#### Tabla `venta`

- **Cliente:** El identificador del cliente debe ser obligatorio y referenciar un cliente existente.
- **Fecha:** La fecha de venta debe ser válida. Si se utiliza un valor por defecto, se registra automáticamente la fecha actual.
- **Monto:** El monto de la venta debe respetar las validaciones definidas por el sistema.
- **Método de pago:** Si se utiliza una clave foránea, el método de pago debe existir previamente.
- **Identificación:** `id_venta` identifica de manera única a cada venta.

#### Tabla `detalle_venta`

- **Cantidad:** La cantidad de productos vendidos debe ser mayor a 0.
- **Precio unitario:** El precio unitario debe ser mayor a 0.
- **Subtotal:** El subtotal debe ser mayor a 0 y corresponder al resultado de multiplicar la cantidad por el precio unitario.

  ```sql
  subtotal = cantidad * precio_unitario
  ```

- **Venta y producto:** Los identificadores son obligatorios y deben referenciar registros existentes.
- **Identificación:** La clave primaria compuesta por `id_venta` e `id_producto` evita que un mismo producto aparezca duplicado dentro de una venta, si esta es la estructura implementada.

## 4. Integridad y Reglas de Negocio

Las restricciones implementadas permiten mantener la consistencia de la información del sistema de gestión de la veterinaria.

Entre las principales reglas de negocio se encuentran:

- No se pueden registrar mascotas sin un cliente asociado.
- No se pueden registrar consultas médicas para mascotas inexistentes.
- Cada consulta debe estar asociada a un veterinario existente.
- Los tratamientos deben estar vinculados a consultas médicas.
- Los medicamentos deben respetar los tipos permitidos y las cantidades válidas.
- Los productos deben estar registrados antes de incorporarse a una venta.
- Las ventas deben estar asociadas a clientes existentes.
- Los detalles de venta deben contener cantidades y precios válidos.
- Los subtotales de los detalles de venta deben corresponder al cálculo de cantidad por precio unitario.
- Las relaciones entre productos y proveedores deben utilizar identificadores existentes.

## Conclusión

Las restricciones de integridad de la base de datos `VETERINARIA` permiten garantizar la consistencia, validez y confiabilidad de los datos almacenados.

Mediante el uso de claves primarias, claves foráneas, restricciones `NOT NULL`, `UNIQUE` y `CHECK`, se controlan las relaciones entre clientes, mascotas, veterinarios, consultas, tratamientos, medicamentos, productos y ventas.

Estas restricciones contribuyen a evitar registros duplicados, referencias inexistentes y valores que no cumplen con las reglas de negocio, permitiendo que el sistema mantenga un historial confiable de las atenciones médicas y las operaciones comerciales de la veterinaria.
