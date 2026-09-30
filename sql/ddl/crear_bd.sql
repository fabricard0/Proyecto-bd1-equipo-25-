
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
    raza VARCHAR(50) NULL,
    edad INT NULL,
    peso DECIMAL(5,2) NULL,
    id_cliente INT NOT NULL,
    CONSTRAINT pk_mascota PRIMARY KEY (id_mascota),
    CONSTRAINT fk_mascota_cliente FOREIGN KEY (id_cliente) 
        REFERENCES CLIENTE(id_cliente)
);
GO
