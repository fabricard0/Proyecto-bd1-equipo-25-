# Modelo Relacional (DER) - VETERINARIA

## Descripción General

El siguiente modelo relacional representa la estructura de la base de datos del sistema de gestión de la veterinaria, implementada en SQL Server. La estructura permite administrar clientes, mascotas, veterinarios, especialidades, consultas, tratamientos, medicamentos, productos, proveedores, stock, ventas y métodos de pago.

El diseño busca mantener la integridad de los datos, evitar redundancias innecesarias y representar adecuadamente las reglas de negocio del sistema.


## Entidades y Atributos

### Tabla: `CLIENTE`

Almacena los datos personales y de contacto de los propietarios de las mascotas.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_cliente`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `apellido` | VARCHAR(50) | NOT NULL |
| `nombre` | VARCHAR(50) | NOT NULL |
| `direccion` | VARCHAR(50) | NOT NULL |
| `telefono` | VARCHAR(20) | NOT NULL |
| `email` | VARCHAR(50) | NOT NULL, UNIQUE |

### Tabla: `VETERINARIO`

Almacena los datos personales y de contacto de los profesionales que trabajan en la veterinaria.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_veterinario`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `apellido` | VARCHAR(50) | NOT NULL |
| `nombre` | VARCHAR(50) | NOT NULL |
| `direccion` | VARCHAR(50) | NOT NULL |
| `telefono` | VARCHAR(20) | NOT NULL, UNIQUE |
| `email` | VARCHAR(50) | NOT NULL, UNIQUE |

### Tabla: `ESPECIALIDAD`

Contiene las especialidades profesionales de los veterinarios.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_especialidad`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `nombre` | VARCHAR(50) | NOT NULL |
| `descripcion` | VARCHAR(100) | NOT NULL |
| `categoria` | VARCHAR(50) | NOT NULL |

### Tabla: `METODO_PAGO`

Almacena los diferentes medios de pago utilizados en las operaciones comerciales.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_metodo_pago`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `tipo_nombre` | VARCHAR(50) | NOT NULL |

### Tabla: `PROVEEDOR`

Almacena la información de las personas o empresas que suministran productos a la veterinaria.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_proveedor`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `razon_social` | VARCHAR(100) | NOT NULL |
| `direccion` | VARCHAR(100) | NOT NULL |
| `telefono` | VARCHAR(20) | NOT NULL |
| `email` | VARCHAR(100) | NOT NULL, UNIQUE |

### Tabla: `PRODUCTO`

Almacena la información general de los artículos comercializados por la veterinaria, como medicamentos, alimentos, productos de higiene y accesorios.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_producto`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `nombre` | VARCHAR(100) | NOT NULL |
| `categoria` | VARCHAR(50) | NOT NULL |
| `precio` | DECIMAL(10,2) | NOT NULL, CHECK (precio >= 0) |

### Tabla: `MEDICAMENTO`

Almacena las características específicas de los medicamentos comercializados. Se relaciona con `PRODUCTO` para evitar duplicar la información general de los artículos.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_medicamento`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `nombre` | VARCHAR(50) | NOT NULL |
| `descripcion` | VARCHAR(100) | NOT NULL |
| `cantidad` | INT | NOT NULL, CHECK (cantidad > 0) |
| `tipo` | VARCHAR(20) | NOT NULL, CHECK (tipo IN ('Comprimido', 'Inyectable', 'Crema', 'Solucion')) |
| `id_producto` | INT | NOT NULL, UNIQUE, **Foreign Key (FK)** → `PRODUCTO(id_producto)` |

### Tabla: `MASCOTA`

Registra los animales pertenecientes a los clientes de la veterinaria.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_mascota`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `nombre` | VARCHAR(50) | NOT NULL |
| `especie` | VARCHAR(50) | NOT NULL |
| `raza` | VARCHAR(50) | NULL |
| `edad` | INT | NULL, CHECK (edad >= 0) |
| `peso` | DECIMAL(5,2) | NULL, CHECK (peso > 0) |
| `id_cliente` | INT | NOT NULL, **Foreign Key (FK)** → `CLIENTE(id_cliente)` |

### Tabla: `CONSULTA`

Registra las atenciones médicas realizadas a las mascotas, identificando al veterinario responsable y el motivo de la consulta.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_nroConsulta`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `fecha` | DATE | NOT NULL |
| `hora` | TIME(0) | NOT NULL |
| `motivo` | VARCHAR(50) | NOT NULL |
| `id_mascota` | INT | NOT NULL, **Foreign Key (FK)** → `MASCOTA(id_mascota)` |
| `id_veterinario` | INT | NOT NULL, **Foreign Key (FK)** → `VETERINARIO(id_veterinario)` |

### Tabla: `TRATAMIENTO`

Almacena los tratamientos indicados durante las consultas médicas.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_tratamiento`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `descripcion` | VARCHAR(50) | NOT NULL |
| `tipo_tratamiento` | VARCHAR(50) | NOT NULL |
| `sintomas` | VARCHAR(50) | NOT NULL |
| `duracion_tratamiento` | VARCHAR(50) | NULL |
| `nro_consulta` | INT | NOT NULL, CHECK (nro_consulta > 0), **Foreign Key (FK)** → `CONSULTA(id_nroConsulta)` |

### Tabla: `VENTA`

Registra las operaciones comerciales realizadas por los clientes de la veterinaria.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_venta`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `descripcion` | VARCHAR(50) | NOT NULL |
| `fecha_hora` | DATETIME | NOT NULL |
| `monto` | DECIMAL(10,2) | NOT NULL, CHECK (monto > 0) |
| `id_cliente` | INT | NOT NULL, **Foreign Key (FK)** → `CLIENTE(id_cliente)` |
| `id_metodo_pago` | INT | NOT NULL, **Foreign Key (FK)** → `METODO_PAGO(id_metodo_pago)` |

### Tabla: `DETALLE_VENTA`

Almacena los productos incluidos en cada venta, junto con sus cantidades, precios unitarios y subtotales.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| `cantidad` | INT | NOT NULL, CHECK (cantidad > 0) |
| `precio_unitario` | DECIMAL(10,2) | NOT NULL, CHECK (precio_unitario > 0) |
| `subtotal` | DECIMAL(10,2) | NOT NULL, CHECK (subtotal > 0 AND subtotal = cantidad * precio_unitario) |
| **`id_venta`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `VENTA(id_venta)` |
| **`id_producto`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `PRODUCTO(id_producto)` |

### Tabla: `DETALLE_TRATAMIENTO`

Representa la relación entre los tratamientos y los medicamentos indicados, almacenando información específica de cada medicamento aplicado.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| `cantidad` | INT | NOT NULL, CHECK (cantidad > 0) |
| `dosis` | VARCHAR(50) | NOT NULL |
| `duracion` | VARCHAR(20) | NOT NULL |
| **`id_medicamento`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `MEDICAMENTO(id_medicamento)` |
| **`id_tratamiento`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `TRATAMIENTO(id_tratamiento)` |

### Tabla: `VETERINARIO_ESPECIALIDAD`

Tabla intermedia que representa la relación de muchos a muchos entre los veterinarios y sus especialidades.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_veterinario`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `VETERINARIO(id_veterinario)` |
| **`id_especialidad`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `ESPECIALIDAD(id_especialidad)` |

### Tabla: `PRODUCTO_PROVEEDOR`

Tabla intermedia que representa la relación de muchos a muchos entre los productos y los proveedores.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_producto`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `PRODUCTO(id_producto)` |
| **`id_proveedor`** | INT | **Primary Key (PK)** compuesta, **Foreign Key (FK)** → `PROVEEDOR(id_proveedor)` |
| `precio_compra` | DECIMAL(10,2) | NOT NULL, CHECK (precio_compra > 0) |
| `cantidad` | INT | NOT NULL, CHECK (cantidad > 0) |

### Tabla: `STOCK`

Registra la cantidad disponible de cada producto comercializado por la veterinaria.

| **Campo** | **Tipo de dato** | **Restricciones** |
|---|---|---|
| **`id_stock`** | INT IDENTITY(1,1) | **Primary Key (PK)** |
| `id_producto` | INT | NOT NULL, UNIQUE, **Foreign Key (FK)** → `PRODUCTO(id_producto)` |
| `cantidad` | INT | NOT NULL, CHECK (cantidad >= 0) |



