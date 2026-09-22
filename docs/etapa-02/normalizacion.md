Proceso de Normalización:

En el modelo relacional de la veterinaria se pueden identificar diferentes entidades como clientes, mascotas, veterinarios, productos, medicamentos, proveedores, consultas, tratamientos y ventas
El proceso de normalización se analiza mediante las tres primeras formas normales:
Primera Forma Normal 1FN
Segunda Forma Normal 2FN
Tercera Forma Normal 3FN
Primera Forma Normal 1FN
La primera forma normal establece que cada atributo debe contener un valor atómico, es decir, un único valor por registro. Además, no deben existir grupos repetitivos de atributos dentro de una misma tabla.
Si llevamos este concepto al modelo relacional de la veterinaria, podemos observar que la información se encuentra organizada y separada en diferentes tablas, de acuerdo con las entidades y relaciones que forman parte del sistema.
Por ejemplo, la información correspondiente a los clientes se encuentra almacenada en la tabla CLIENTE:
CLIENTE:
id_cliente | nombre | apellido | teléfono | dirección | email
En este caso, cada atributo almacena un único valor correspondiente a un cliente. El teléfono se mantiene como un único atributo, ya que, de acuerdo con la regla de negocio establecida, cada cliente registra un único número de teléfono.
De la misma manera, la información propia de las mascotas se encuentra almacenada en la tabla MASCOTA:
MASCOTA:
id_mascota | nombre | peso | edad | raza | especie | id_cliente
Decidimos modelar a CLIENTE y MASCOTA como entidades distintas, ya que representan objetos diferentes dentro del sistema. De esta manera, los datos propios de una mascota no se almacenan repetidamente dentro de la información del cliente.
Además, un cliente puede tener más de una mascota. Por este motivo, la relación se representa mediante id_cliente dentro de la tabla MASCOTA, que funciona como clave foránea hacia CLIENTE. Así, cada mascota queda asociada con su correspondiente cliente sin necesidad de repetir los datos del cliente para cada mascota.
Otro caso importante se presenta con las ventas. Una venta puede contener uno o varios productos, por lo que existe una relación de muchos a muchos entre VENTA y PRODUCTO. Para representar esta relación separamos la información general de la venta de la información correspondiente a los productos incluidos en ella.

La tabla VENTA contiene los datos generales:
VENTA:
id_venta | descripción | fecha_hora | monto | id_cliente | id_metodo_pago
Mientras que la tabla DETALLE_VENTA contiene los productos que forman parte de cada venta:
DETALLE_VENTA:
id_venta | id_producto | cantidad | precio_unitario | subtotal
De esta manera, cada fila de DETALLE_VENTA representa un producto determinado dentro de una venta. Esto permite almacenar una cantidad variable de productos sin tener que agregar columnas nuevas a la tabla VENTA.
Por ejemplo, si una venta tiene tres productos, se almacenan tres registros en DETALLE_VENTA. Si otra venta tiene diez productos, se almacenan diez registros. La estructura de la tabla no necesita modificarse, ya que se agregan nuevos registros y no nuevos atributos.
Esto permite evitar una estructura incorrecta como:
producto1, cantidad1, producto2, cantidad2, producto3, cantidad3
porque esa estructura tendría grupos repetitivos y además limitaría la cantidad de productos que podrían registrarse en una venta.
Para los tratamientos se realiza un procedimiento similar. Un tratamiento puede incluir diferentes medicamentos, por lo que existe una relación de muchos a muchos entre TRATAMIENTO y MEDICAMENTO.
La información general del tratamiento se encuentra en:
TRATAMIENTO:
id_tratamiento | descripción | tipo_tratamiento | síntomas | duración_tratamiento | nro_consulta
Mientras que la relación con los medicamentos se almacena en DETALLE_TRATAMIENTO:
DETALLE_TRATAMIENTO:
id_tratamiento | id_medicamento | cantidad | dosis | duración
La utilización de esta tabla permite registrar diferentes medicamentos para un mismo tratamiento. Cada medicamento se almacena en una fila diferente junto con la cantidad, dosis y duración correspondiente.
De esta manera, evitamos tener dentro de TRATAMIENTO atributos como medicamento1, medicamento2, medicamento3, etc. En lugar de repetir columnas, se agregan registros en DETALLE_TRATAMIENTO.
Este mismo criterio se aplica a otras relaciones de muchos a muchos que existen en el sistema. Por ejemplo, las tablas PRODUCTO_PROVEEDOR, MEDICAMENTO_PROVEEDOR y VETERINARIO_ESPECIALIDAD cumplen una función similar a las tablas de detalle.
En PRODUCTO_PROVEEDOR se registra qué productos son proporcionados por cada proveedor, junto con información propia de esa relación, como el precio de compra y la cantidad.
PRODUCTO_PROVEEDOR:
id_proveedor | id_producto | precio_compra | cantidad
En MEDICAMENTO_PROVEEDOR se representa la relación entre los medicamentos y sus proveedores:
MEDICAMENTO_PROVEEDOR:
id_medicamento | id_proveedor | precio_compra | cantidad
Por último, VETERINARIO_ESPECIALIDAD permite representar que un veterinario puede tener varias especialidades y que una especialidad puede corresponder a varios veterinarios:
VETERINARIO_ESPECIALIDAD:
id_veterinario | id_ especialidad | nombre
Estas tablas intermedias permiten representar correctamente las relaciones N mediante registros individuales, evitando almacenar listas o grupos de valores dentro de un mismo atributo. De esta manera, cada atributo mantiene un único valor, las cantidades variables de elementos se representan mediante diferentes registros y se evita la repetición innecesaria de información.

Segunda Forma Normal 2FN 
La Segunda Forma Normal establece que una tabla debe encontrarse previamente en Primera Forma Normal y, además, todos los atributos que no forman parte de la clave primaria deben depender de la totalidad de la clave primaria.
El objetivo de esta forma normal es evitar las dependencias parciales, es decir, situaciones donde un atributo depende solamente de una parte de una clave primaria compuesta y no de la clave completa. En nuestro modelo relacional, este análisis es especialmente importante en las tablas que utilizan claves primarias compuestas, ya que están formadas por más de un atributo.
Por ejemplo, en la tabla DETALLE_VENTA tenemos:
DETALLE_VENTA:
id_venta | id_producto | cantidad | precio_unitario | subtotal
La clave primaria está formada por la combinación:		PK = (id_venta, id_producto)
Esto significa que un registro del detalle queda identificado de manera única por la combinación de la venta y el producto.
Los atributos cantidad, precio_unitario y subtotal corresponden específicamente a la participación de ese producto dentro de esa venta. Por lo tanto, no dependen solamente de id_venta ni solamente de id_producto, sino de la combinación de ambos atributos.
Por lo tanto:
(id_venta, id_producto) → cantidad, precio_unitario, subtotal
De esta manera, los atributos no clave dependen de la clave primaria completa y no de una parte de ella, cumpliendo con el principio de la Segunda Forma Normal.
También se aplica el mismo análisis en PRODUCTO_PROVEEDOR:
PRODUCTO_PROVEEDOR:
id_proveedor | id_producto | precio_compra | cantidad
La clave primaria está formada por:		PK = (id_proveedor, id_producto)
En este caso, precio_compra y cantidad corresponden a la relación específica entre un determinado proveedor y un determinado producto.
El precio de compra puede ser diferente según el proveedor que suministre el producto. Por este motivo, estos datos no dependen solamente del producto ni solamente del proveedor, sino de la combinación de ambos.
Entonces:	(id_proveedor, id_producto) → precio_compra, cantidad
Por lo tanto, los atributos dependen de la clave completa.
estos mismos criterios se aplicaron para las demás tablas con PK compuesta:
DETALLE_TRATAMIENTO:
id_tratamiento | id_medicamento | cantidad | dosis | duración
Su clave primaria está formada por:	PK = (id_tratamiento, id_medicamento)
MEDICAMENTO_PROVEEDOR:
id_medicamento | id_proveedor | precio_compra | cantidad
Su clave primaria es:	PK = (id_medicamento, id_proveedor)
VETERINARIO_ESPECIALIDAD:
id_veterinario | id_especialidad | nombre
Su clave primaria está formada por:	PK = (id_veterinario, id_especialidad)
En nuestro modelo, este análisis permite mantener separados los datos propios de cada entidad y evitar la repetición de información. De esta forma, se eliminan las dependencias parciales y el modelo cumple con los principios correspondientes a la Segunda Forma Normal 
