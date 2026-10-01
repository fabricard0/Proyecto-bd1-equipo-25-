
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'VETERINARIA')
BEGIN
    ALTER DATABASE VETERINARIA SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE VETERINARIA;
END
CREATE DATABASE VETERINARIA;
GO

USE VETERINARIA;
GO

-- DDL: CREACION DE TABLAS PREVIAS
CREATE TABLE CLIENTE(
    id_cliente INT IDENTITY (1,1) PRIMARY KEY,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT uq_cliente_email UNIQUE(email)
);

CREATE TABLE VETERINARIO(
    id_veterinario INT IDENTITY (1,1) PRIMARY KEY,
    apellido VARCHAR(50) NOT NULL,
    nombre VARCHAR(50) NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    telefono VARCHAR (20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    CONSTRAINT uq_veterinario_telefono UNIQUE(telefono),
    CONSTRAINT uq_veterinario_email UNIQUE(email)
);

CREATE TABLE ESPECIALIDAD(
    id_especialidad INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL
);

CREATE TABLE MEDICAMENTO(
    id_medicamento INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    cantidad INT NOT NULL,
    tipo VARCHAR(20) NOT NULL,
    CONSTRAINT ck_medicamento_tipo CHECK (tipo IN ('Comprimido','Inyectable','Crema','Solucion')),
    CONSTRAINT ck_medicamento_cantidad CHECK (cantidad > 0)
);

CREATE TABLE METODO_PAGO (
    id_metodo_pago INT IDENTITY(1,1),
    tipo_nombre VARCHAR(50) NOT NULL,
    CONSTRAINT pk_metodo_pago PRIMARY KEY (id_metodo_pago)
);
GO

CREATE TABLE PROVEEDOR (
    id_proveedor INT IDENTITY(1,1),
    razon_social VARCHAR(100) NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    CONSTRAINT pk_proveedor PRIMARY KEY (id_proveedor),
    CONSTRAINT uq_proveedor_email UNIQUE (email)
);
GO

CREATE TABLE PRODUCTO (
    id_producto INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    CONSTRAINT pk_producto PRIMARY KEY (id_producto),
    CONSTRAINT chk_producto_precio CHECK (precio >= 0)
);
GO

CREATE TABLE MASCOTA (
    id_mascota INT IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50) DEFAULT 'Desconocida',
    edad VARCHAR(20) DEFAULT 'Desconocida',
    peso VARCHAR(20) DEFAULT 'No especificado',
    id_cliente INT NOT NULL,
    CONSTRAINT pk_mascota PRIMARY KEY (id_mascota),
    CONSTRAINT fk_mascota_cliente FOREIGN KEY (id_cliente) 
    REFERENCES CLIENTE(id_cliente)
);
GO

---

CREATE TABLE CONSULTA(
   id_nroConsulta INT IDENTITY(1,1) PRIMARY KEY,
   fecha DATE NOT NULL,
   hora TIME NOT NULL,
   motivo VARCHAR(50) NOT NULL,
   id_mascota INT NOT NULL, 
   id_veterinario INT NOT NULL,

   CONSTRAINT fk_consulta_mascota FOREIGN KEY (id_mascota)
   REFERENCES MASCOTA(Id_mascota),

   CONSTRAINT fk_consulta_veterinario FOREIGN KEY (id_veterinario)
   REFERENCES VETERINARIO(id_veterinario) 
);

CREATE TABLE TRATAMIENTO(
    id_tratamiento INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    tipo_tratamiento VARCHAR(50) NOT NULL,
    sintomas VARCHAR(50) NOT NULL, 
    duracion_tratamiento VARCHAR(20) NULL,

  CONSTRAINT fk_tratamiento_consulta 
        FOREIGN KEY (nro_consulta)
        REFERENCES CONSULTA(id_nroConsulta),

  CONSTRAINT ck_tratamiento_nro_consulta 
        CHECK (nro_consulta > 0)

  CONSTRAINT df_tratamiento_duracion DEFAULT 'Indefinido',
        nro_consulta INT NOT NULL, 
);

CREATE TABLE VENTA(
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    descripcion VARCHAR(50) NOT NULL,
    fecha_hora DATETIME NOT NULL,
    monto INT NOT NULL,
    id_cliente INT NOT NULL, 
    id_metodo_pago INT NOT NULL,

  CONSTRAINT fk_venta_cliente FOREIGN KEY (id_cliente)
  REFERENCES CLIENTE(id_cliente), 

  CONSTRAINT fk_venta_metodo_pago FOREIGN KEY (id_metodo_pago)
  REFERENCES METODO_PAGO(id_metodo_pago),
  CONSTRAINT ck_venta_importe CHECK (monto > 0)
);

CREATE TABLE DETALLE_VENTA(
   cantidad INT NOT NULL,
   precio_unitario INT NOT NULL,
   subtotal INT NOT NULL,
   id_venta INT NOT NULL, 
   id_producto INT NOT NULL,

   CONSTRAINT pk_detalle_venta 
   PRIMARY KEY(id_producto,id_venta),

   CONSTRAINT fk_detalle_venta_producto FOREIGN KEY (id_producto)
   REFERENCES PRODUCTO(id_producto),
   CONSTRAINT fk_detalle_venta_venta  FOREIGN KEY (id_venta)
   REFERENCES VENTA(id_venta),

   CONSTRAINT ck_detalle_venta_cantidad CHECK(cantidad > 0),
   CONSTRAINT ck_detalle_venta_precio CHECK(precio_unitario > 0),
   CONSTRAINT ck_detalle_venta_subtotal CHECK(subtotal > 0),
);

CREATE TABLE DETALLE_TRATAMIENTO (
    cantidad INT NOT NULL,
    dosis VARCHAR(50) NOT NULL,
    duracion VARCHAR(20) NOT NULL,
    id_medicamento INT NOT NULL, 
    id_tratamiento INT NOT NULL,

  CONSTRAINT pk_detalle_tratamiento
  PRIMARY KEY (id_medicamento, id_tratamiento),

  CONSTRAINT fk_detalle_tratamiento_medicamento FOREIGN KEY (id_medicamento)
  REFERENCES MEDICAMENTO(id_medicamento),
  CONSTRAINT fk_detalle_tratamiento_tratamiento FOREIGN KEY (id_tratamiento)
  REFERENCES TRATAMIENTO(id_tratamiento)
);
