--Ejecutar Primero 

USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'VETERINARIA')
BEGIN
    ALTER DATABASE VETERINARIA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE VETERINARIA;
END
GO

CREATE DATABASE VETERINARIA;
GO

USE VETERINARIA;
GO


--1
CREATE TABLE CLIENTE(
id_cliente INT IDENTITY(1,1),
apellido   VARCHAR(50) NOT NULL,
nombre     VARCHAR(50) NOT NULL,
direccion  VARCHAR(50) NOT NULL,
telefono   VARCHAR(20) NOT NULL,
email      VARCHAR(50) NOT NULL,
CONSTRAINT pk_cliente          PRIMARY KEY (id_cliente),
CONSTRAINT uq_cliente_telefono UNIQUE (telefono),  
CONSTRAINT uq_cliente_email    UNIQUE (email)
);
GO

--2
CREATE TABLE VETERINARIO(
id_veterinario INT IDENTITY(1,1),
apellido       VARCHAR(50) NOT NULL,
nombre         VARCHAR(50) NOT NULL,
direccion      VARCHAR(50) NOT NULL,
telefono       VARCHAR(20) NOT NULL,
email          VARCHAR(50) NOT NULL,
CONSTRAINT pk_veterinario          PRIMARY KEY (id_veterinario),
CONSTRAINT uq_veterinario_telefono UNIQUE (telefono),
CONSTRAINT uq_veterinario_email    UNIQUE (email)
);
GO

--3
CREATE TABLE ESPECIALIDAD(
id_especialidad INT IDENTITY(1,1),
nombre          VARCHAR(50)  NOT NULL,
descripcion     VARCHAR(100) NOT NULL,
categoria       VARCHAR(50)  NOT NULL,
CONSTRAINT pk_especialidad        PRIMARY KEY (id_especialidad),
CONSTRAINT uq_especialidad_nombre UNIQUE (nombre)   
);
GO

--4
CREATE TABLE METODO_PAGO(
id_metodo_pago INT IDENTITY(1,1),
tipo_nombre    VARCHAR(50) NOT NULL,
CONSTRAINT pk_metodo_pago      PRIMARY KEY (id_metodo_pago),
CONSTRAINT uq_metodo_pago_tipo UNIQUE (tipo_nombre)  -- NUEVO
);
GO

--5
CREATE TABLE PROVEEDOR(
id_proveedor INT IDENTITY(1,1),
razon_social VARCHAR(100) NOT NULL,
direccion    VARCHAR(100) NOT NULL,
telefono     VARCHAR(20)  NOT NULL,
email        VARCHAR(100) NOT NULL,
CONSTRAINT pk_proveedor          PRIMARY KEY (id_proveedor),
CONSTRAINT uq_proveedor_razon    UNIQUE (razon_social),  
CONSTRAINT uq_proveedor_telefono UNIQUE (telefono),     
CONSTRAINT uq_proveedor_email    UNIQUE (email)
);
GO

--6
CREATE TABLE PRODUCTO(
id_producto INT IDENTITY(1,1),
nombre      VARCHAR(100)  NOT NULL,
categoria   VARCHAR(50)   NOT NULL,
precio      DECIMAL(10,2) NOT NULL,
CONSTRAINT pk_producto        PRIMARY KEY (id_producto),
CONSTRAINT uq_producto_nombre UNIQUE (nombre),           
CONSTRAINT ck_producto_precio CHECK (precio > 0)         
);
GO

--7
CREATE TABLE MEDICAMENTO(
id_medicamento INT IDENTITY(1,1),
nombre         VARCHAR(50)  NOT NULL,
descripcion    VARCHAR(100) NOT NULL,
cantidad       INT          NOT NULL,
tipo           VARCHAR(20)  NOT NULL,
id_producto    INT          NOT NULL,
CONSTRAINT pk_medicamento          PRIMARY KEY (id_medicamento),
CONSTRAINT uq_medicamento_producto UNIQUE (id_producto),
CONSTRAINT fk_medicamento_producto FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto),
CONSTRAINT ck_medicamento_tipo     CHECK (tipo IN ('Comprimido','Inyectable','Crema','Solucion')),
CONSTRAINT ck_medicamento_cantidad CHECK (cantidad > 0)
);
GO

--8
CREATE TABLE MASCOTA(
id_mascota INT IDENTITY(1,1),
nombre     VARCHAR(50)  NOT NULL,
especie    VARCHAR(50)  NOT NULL,
raza       VARCHAR(50)  NULL,
edad       INT          NULL,
peso       DECIMAL(5,2) NULL,
id_cliente INT          NOT NULL,
CONSTRAINT pk_mascota         PRIMARY KEY (id_mascota),
CONSTRAINT fk_mascota_cliente FOREIGN KEY (id_cliente)
REFERENCES CLIENTE(id_cliente),
CONSTRAINT ck_mascota_edad    CHECK (edad >= 0),
CONSTRAINT ck_mascota_peso    CHECK (peso > 0)
);
GO



--9
CREATE TABLE CONSULTA(
id_nroConsulta INT IDENTITY(1,1),
fecha          DATE        NOT NULL,
hora           TIME(0)     NOT NULL,
motivo         VARCHAR(50) NOT NULL,
id_mascota     INT         NOT NULL,
id_veterinario INT         NOT NULL,
CONSTRAINT pk_consulta             PRIMARY KEY (id_nroConsulta),
CONSTRAINT fk_consulta_mascota     FOREIGN KEY (id_mascota)
REFERENCES MASCOTA(id_mascota),
CONSTRAINT fk_consulta_veterinario FOREIGN KEY (id_veterinario)
REFERENCES VETERINARIO(id_veterinario),
CONSTRAINT uq_consulta_vet_fecha_hora     UNIQUE (id_veterinario, fecha, hora),
CONSTRAINT uq_consulta_mascota_fecha_hora UNIQUE (id_mascota, fecha, hora)
);
GO

--10

CREATE TABLE TRATAMIENTO(
id_tratamiento       INT IDENTITY(1,1),
descripcion          VARCHAR(50) NOT NULL,
tipo_tratamiento     VARCHAR(50) NOT NULL,
sintomas             VARCHAR(50) NOT NULL,
duracion_tratamiento VARCHAR(50) NULL,
nro_consulta         INT         NOT NULL,
CONSTRAINT pk_tratamiento          PRIMARY KEY (id_tratamiento),
CONSTRAINT fk_tratamiento_consulta FOREIGN KEY (nro_consulta)
REFERENCES CONSULTA(id_nroConsulta)
);
GO


--GO

--11
CREATE TABLE VENTA(
id_venta       INT IDENTITY(1,1),
descripcion    VARCHAR(50)   NOT NULL,
fecha_hora     DATETIME      NOT NULL,
monto          DECIMAL(10,2) NOT NULL,
id_cliente     INT           NOT NULL,
id_metodo_pago INT           NOT NULL,
CONSTRAINT pk_venta             PRIMARY KEY (id_venta),
CONSTRAINT fk_venta_cliente     FOREIGN KEY (id_cliente)
REFERENCES CLIENTE(id_cliente),
CONSTRAINT fk_venta_metodo_pago FOREIGN KEY (id_metodo_pago)
REFERENCES METODO_PAGO(id_metodo_pago),
CONSTRAINT ck_venta_monto       CHECK (monto > 0)
);
GO


--12.
CREATE TABLE DETALLE_VENTA(
cantidad        INT           NOT NULL,
precio_unitario DECIMAL(10,2) NOT NULL,
subtotal        DECIMAL(10,2) NOT NULL,
id_venta        INT           NOT NULL,
id_producto     INT           NOT NULL,
CONSTRAINT pk_detalle_venta          PRIMARY KEY (id_venta, id_producto),
CONSTRAINT fk_detalle_venta_venta    FOREIGN KEY (id_venta)
REFERENCES VENTA(id_venta),
CONSTRAINT fk_detalle_venta_producto FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto),
CONSTRAINT ck_detalle_venta_cantidad CHECK (cantidad > 0),
CONSTRAINT ck_detalle_venta_precio   CHECK (precio_unitario > 0),
CONSTRAINT ck_detalle_venta_subtotal CHECK (subtotal > 0 AND subtotal = cantidad * precio_unitario)
);
GO

--13
CREATE TABLE DETALLE_TRATAMIENTO(
cantidad       INT         NOT NULL,
dosis          VARCHAR(50) NOT NULL,
duracion       VARCHAR(20) NOT NULL,
id_medicamento INT         NOT NULL,
id_tratamiento INT         NOT NULL,
CONSTRAINT pk_detalle_tratamiento PRIMARY KEY (id_tratamiento, id_medicamento),
CONSTRAINT fk_detalle_tratamiento_tratamiento FOREIGN KEY (id_tratamiento)
REFERENCES TRATAMIENTO(id_tratamiento),
CONSTRAINT fk_detalle_tratamiento_medicamento FOREIGN KEY (id_medicamento)
REFERENCES MEDICAMENTO(id_medicamento),
CONSTRAINT ck_detalle_tratamiento_cantidad CHECK (cantidad > 0)
);
GO


--14
CREATE TABLE VETERINARIO_ESPECIALIDAD(
id_veterinario  INT NOT NULL,
id_especialidad INT NOT NULL,
CONSTRAINT pk_veterinario_especialidad PRIMARY KEY (id_veterinario, id_especialidad),
CONSTRAINT fk_ve_veterinario  FOREIGN KEY (id_veterinario)
REFERENCES VETERINARIO(id_veterinario),
CONSTRAINT fk_ve_especialidad FOREIGN KEY (id_especialidad)
REFERENCES ESPECIALIDAD(id_especialidad)
);
GO


--15
CREATE TABLE PRODUCTO_PROVEEDOR(
id_producto   INT           NOT NULL,
id_proveedor  INT           NOT NULL,
precio_compra DECIMAL(10,2) NOT NULL,
cantidad      INT           NOT NULL,
CONSTRAINT pk_producto_proveedor PRIMARY KEY (id_producto, id_proveedor),
CONSTRAINT fk_pp_producto  FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto),
CONSTRAINT fk_pp_proveedor FOREIGN KEY (id_proveedor)
REFERENCES PROVEEDOR(id_proveedor),
CONSTRAINT ck_pp_precio_compra CHECK (precio_compra > 0),
CONSTRAINT ck_pp_cantidad      CHECK (cantidad > 0)
);
GO


--16
CREATE TABLE STOCK(
id_stock    INT IDENTITY(1,1),
id_producto INT NOT NULL,
cantidad    INT NOT NULL,
CONSTRAINT pk_stock          PRIMARY KEY (id_stock),
CONSTRAINT uq_stock_producto UNIQUE (id_producto),
CONSTRAINT fk_stock_producto FOREIGN KEY (id_producto)
REFERENCES PRODUCTO(id_producto),
CONSTRAINT ck_stock_cantidad CHECK (cantidad >= 0)
);
GO



