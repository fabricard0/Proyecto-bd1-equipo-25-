--Script DDL en el que se crean las tablas 

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
