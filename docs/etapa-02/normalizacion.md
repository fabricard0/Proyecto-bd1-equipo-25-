# Proceso de Normalización

En el modelo relacional de la veterinaria se pueden identificar diferentes entidades, como clientes, mascotas, veterinarios, productos, medicamentos, proveedores, consultas, tratamientos y ventas.

El proceso de normalización se analiza mediante las tres primeras formas normales:

* Primera Forma Normal (1FN).
* Segunda Forma Normal (2FN).
* Tercera Forma Normal (3FN).

## Primera Forma Normal (1FN)

La Primera Forma Normal establece que cada atributo debe contener un valor atómico, es decir, un único valor por registro. Además, no deben existir grupos repetitivos de atributos dentro de una misma tabla.

Si llevamos este concepto al modelo relacional de la veterinaria, podemos observar que la información se encuentra organizada y separada en diferentes tablas, de acuerdo con las entidades y relaciones que forman parte del sistema.

### Tabla CLIENTE

La información correspondiente a los clientes se encuentra almacenada en la tabla `CLIENTE`:

| id_cliente | nombre | apellido | teléfono | dirección | email |
| ---------- | ------ | -------- | -------- | --------- | ----- |

En este caso, cada atributo almacena un único valor correspondiente a un cliente. El teléfono se mantiene como un único atributo, ya que, de acuerdo con la regla de negocio establecida, cada cliente registra un único número de teléfono.

### Tabla MASCOTA

La información propia de las mascotas se encuentra almacenada en la tabla `MASCOTA`:

| id_mascota | nombre | peso | edad | raza | especie | id_cliente |
| ---------- | ------ | ---- | ---- | ---- | ------- | ---------- |

Decidimos modelar a `CLIENTE` y `MASCOTA` como entidades distintas, ya que representan objetos diferentes dentro del sistema. De esta manera, los datos propios de una mascota no se almacenan repetidamente dentro de la información del cliente.

Además, un cliente puede tener más de una mascota. Por este motivo, la relación se representa mediante `id_cliente` dentro de la tabla `MASCOTA`, que funciona como clave foránea hacia `CLIENTE`.

Así, cada mascota queda asociada con su correspondiente cliente sin necesidad de repetir los datos del cliente para cada mascota.

### Tablas VENTA y DETALLE_VENTA

Otro caso importante se presenta con las ventas. Una venta puede contener uno o varios productos, por lo que existe una relación de muchos a muchos entre `VENTA` y `PRODUCTO`.

Para representar esta relación, separamos la información general de la venta de la información correspondiente a los productos incluidos en ella.

La tabla `VENTA` contiene los datos generales:

| id_venta | descripción | fecha_hora | monto | id_cliente | id_metodo_pago |
| -------- | ----------- | ---------- | ----- | ---------- | -------------- |

Mientras que la tabla `DETALLE_VENTA` contiene los productos que forman parte de cada venta:

| id_venta | id_producto | cantidad | precio_unitario | subtotal |
| -------- | ----------- | -------- | --------------- | -------- |

De esta manera, cada fila de `DETALLE_VENTA` representa un producto determinado dentro de una venta. Esto permite almacenar una cantidad variable de productos sin tener que agregar columnas nuevas a la tabla `VENTA`.

Por ejemplo, si una venta tiene tres productos, se almacenan tres registros en `DETALLE_VENTA`. Si otra venta tiene diez productos, se almacenan diez registros.

La estructura de la tabla no necesita modificarse, ya que se agregan nuevos registros y no nuevos atributos.

Esto permite evitar una estructura incorrecta como:

```text
producto1, cantidad1, producto2, cantidad2, producto3, cantidad3
```

Esa estructura tendría grupos repetitivos y, además, limitaría la cantidad de productos que podrían registrarse en una venta.

### Tablas TRATAMIENTO y DETALLE_TRATAMIENTO

Para los tratamientos se realiza un procedimiento similar. Un tratamiento puede incluir diferentes medicamentos, por lo que existe una relación de muchos a muchos entre `TRATAMIENTO` y `MEDICAMENTO`.

La información general del tratamiento se encuentra en la tabla `TRATAMIENTO`:

| id_tratamiento | descripción | tipo_tratamiento | síntomas | duración_tratamiento | nro_consulta |
| -------------- | ----------- | ---------------- | -------- | -------------------- | ------------ |

Mientras que la relación con los medicamentos se almacena en `DETALLE_TRATAMIENTO`:

| id_tratamiento | id_medicamento | cantidad | dosis | duración |
| -------------- | -------------- | -------- | ----- | -------- |

La utilización de esta tabla permite registrar diferentes medicamentos para un mismo tratamiento. Cada medicamento se almacena en una fila diferente junto con la cantidad, dosis y duración correspondiente.

De esta manera, evitamos tener dentro de `TRATAMIENTO` atributos como `medicamento1`, `medicamento2`, `medicamento3`, etc. En lugar de repetir columnas, se agregan registros en `DETALLE_TRATAMIENTO`.

### Otras tablas intermedias

Este mismo criterio se aplica a otras relaciones de muchos a muchos que existen en el sistema. Por ejemplo, las tablas `PRODUCTO_PROVEEDOR`, `MEDICAMENTO_PROVEEDOR` y `VETERINARIO_ESPECIALIDAD` cumplen una función similar a las tablas de detalle.

En `PRODUCTO_PROVEEDOR` se registra qué productos son proporcionados por cada proveedor, junto con información propia de esa relación, como el precio de compra y la cantidad.

| id_proveedor | id_producto | precio_compra | cantidad |
| ------------ | ----------- | ------------- | -------- |

Por último, `VETERINARIO_ESPECIALIDAD` permite representar que un veterinario puede tener varias especialidades y que una especialidad puede corresponder a varios veterinarios.

| id_veterinario | id_especialidad |
| -------------- | --------------- |

Estas tablas intermedias permiten representar correctamente las relaciones de muchos a muchos mediante registros individuales, evitando almacenar listas o grupos de valores dentro de un mismo atributo.

De esta manera, cada atributo mantiene un único valor, las cantidades variables de elementos se representan mediante diferentes registros y se evita la repetición innecesaria de información.

## Segunda Forma Normal (2FN)

La Segunda Forma Normal establece que una tabla debe encontrarse previamente en Primera Forma Normal y, además, todos los atributos que no forman parte de la clave primaria deben depender de la totalidad de la clave primaria.

El objetivo de esta forma normal es evitar las dependencias parciales, es decir, situaciones donde un atributo depende solamente de una parte de una clave primaria compuesta y no de la clave completa.

En nuestro modelo relacional, este análisis es especialmente importante en las tablas que utilizan claves primarias compuestas, ya que están formadas por más de un atributo.

### Tabla DETALLE_VENTA

En la tabla `DETALLE_VENTA` tenemos:

| id_venta | id_producto | cantidad | precio_unitario | subtotal |
| -------- | ----------- | -------- | --------------- | -------- |

La clave primaria está formada por la combinación:

```text
PK = (id_venta, id_producto)
```

Esto significa que un registro del detalle queda identificado de manera única por la combinación de la venta y el producto.

Los atributos `cantidad`, `precio_unitario` y `subtotal` corresponden específicamente a la participación de ese producto dentro de esa venta. Por lo tanto, no dependen solamente de `id_venta` ni solamente de `id_producto`, sino de la combinación de ambos atributos.

La dependencia funcional se expresa de la siguiente manera:

```text
(id_venta, id_producto) → cantidad, precio_unitario, subtotal
```

De esta manera, los atributos no clave dependen de la clave primaria completa y no de una parte de ella, cumpliendo con el principio de la Segunda Forma Normal.

### Tabla PRODUCTO_PROVEEDOR

También se aplica el mismo análisis en `PRODUCTO_PROVEEDOR`:

| id_proveedor | id_producto | precio_compra | cantidad |
| ------------ | ----------- | ------------- | -------- |

La clave primaria está formada por:

```text
PK = (id_proveedor, id_producto)
```

En este caso, `precio_compra` y `cantidad` corresponden a la relación específica entre un determinado proveedor y un determinado producto.

El precio de compra puede ser diferente según el proveedor que suministre el producto. Por este motivo, estos datos no dependen solamente del producto ni solamente del proveedor, sino de la combinación de ambos.

Entonces, la dependencia funcional es:

```text
(id_proveedor, id_producto) → precio_compra, cantidad
```

Por lo tanto, los atributos dependen de la clave completa.

### Otras tablas con claves primarias compuestas

Estos mismos criterios se aplicaron para las demás tablas con claves primarias compuestas.

**DETALLE_TRATAMIENTO**

| id_tratamiento | id_medicamento | cantidad | dosis | duración |
| -------------- | -------------- | -------- | ----- | -------- |

Su clave primaria está formada por:

```text
PK = (id_tratamiento, id_medicamento)
```

Los atributos `cantidad`, `dosis` y `duración` corresponden a la utilización de un medicamento específico dentro de un tratamiento determinado.


**VETERINARIO_ESPECIALIDAD**

| id_veterinario | id_especialidad |
| -------------- | --------------- |

Su clave primaria está formada por:

```text
PK = (id_veterinario, id_especialidad)
```

Esta tabla representa la asociación entre veterinarios y especialidades. Al no incluir otros atributos no clave, no presenta dependencias parciales que deban analizarse.

### Conclusión de la 2FN

En nuestro modelo, este análisis permite mantener separados los datos propios de cada entidad y evitar la repetición de información.

De esta forma, se eliminan las dependencias parciales en las tablas que poseen claves primarias compuestas y se cumplen los principios correspondientes a la Segunda Forma Normal.

## Tercera Forma Normal (3FN)

La Tercera Forma Normal establece que una tabla debe encontrarse previamente en Segunda Forma Normal y que los atributos que no forman parte de una clave no deben depender transitivamente de la clave primaria.

Una dependencia transitiva ocurre cuando un atributo no clave depende de otro atributo no clave, en lugar de depender directamente de la clave primaria.

En nuestro modelo, la separación de entidades como `CLIENTE`, `MASCOTA`, `PRODUCTO`, `PROVEEDOR`, `VETERINARIO` y `METODO_PAGO` permite mantener los datos propios de cada entidad en su correspondiente tabla.

Por ejemplo, en `VENTA` se almacena `id_cliente` como clave foránea, en lugar de repetir el nombre, apellido, teléfono y dirección del cliente. Los datos personales se mantienen en `CLIENTE`, mientras que `VENTA` contiene la información propia de la operación comercial.

De manera similar, la tabla `MASCOTA` contiene `id_cliente` para identificar a su propietario, sin repetir los datos personales de este. La tabla `CONSULTA` registra las claves foráneas de la mascota y del veterinario, mientras que los datos completos de cada entidad se conservan en sus respectivas tablas.

En el caso de los métodos de pago, `VENTA` almacena `id_metodo_pago` y la descripción del método se conserva en `METODO_PAGO`. Así, si se modifica la descripción de un método de pago, no es necesario actualizar cada venta registrada.

Estas decisiones reducen la redundancia y evitan anomalías de actualización, inserción y eliminación.

### Conclusión de la 3FN

La separación de los datos propios de cada entidad y el uso de claves foráneas permiten reducir las dependencias transitivas y mantener la consistencia de la información.

Para afirmar que todo el modelo cumple con la Tercera Forma Normal, es necesario verificar las dependencias funcionales de cada tabla, incluyendo las restricciones `UNIQUE` y las claves alternativas que puedan existir.

## Conclusión general

El proceso de normalización permite organizar la información de la veterinaria en tablas relacionadas, evitando la repetición innecesaria de datos y facilitando su mantenimiento.

* **Primera Forma Normal (1FN):** cada atributo contiene valores atómicos y las relaciones de muchos a muchos se representan mediante tablas intermedias.
* **Segunda Forma Normal (2FN):** los atributos no clave de las tablas con claves primarias compuestas dependen de la totalidad de la clave.
* **Tercera Forma Normal (3FN):** se procura que los atributos no clave dependan directamente de las claves de sus respectivas tablas, evitando dependencias transitivas.

La aplicación de estas formas normales contribuye a mejorar la integridad, consistencia y organización de la base de datos relacional de la veterinaria.
