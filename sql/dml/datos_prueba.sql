
-- DML: CARGA DE DATOS PREVIOS
INSERT INTO CLIENTE(apellido,nombre,direccion,telefono,email)
VALUES
('Perez','Juan','Calle Junin 460','3794324567','juan12@gmail.com'),
('GOMEZ','MARIA','Calle MENDOZA 1320','3795562142','mariagomez@gmail.com'),
('FERNANDEZ','MARTIN','AV.MAIPU 2035','3794329456','martinf@gmail.com'),
('Diaz', 'Laura', 'Calle Junin 630', '3794456789', 'lauradiaz@gmail.com'),
('Ramirez', 'Valentina', 'Calle Rivadavia 410', '3794012345', 'valentinarz@gmail.com'),
('Lopez', 'Carlos', 'Av. 3 de Abril 1520', '3794345678', 'carloslopez@gmail.com'),
('Fernandez', 'Sofia', 'Calle Belgrano 1145', '3794678901', 'sofifernandez@gmail.com'),
('Rodriguez', 'Lucas', 'Av. Cazadores 780', '3794789012', 'lucasrodriguez@gmail.com');

--SELECT * FROM CLIENTE;

INSERT INTO VETERINARIO(apellido,nombre,direccion,telefono,email)
VALUES
('Perez','Natalia','Av. Chacabuco 1430','3794012345','natalia.perez@gmail.com'),
('Ramirez','Florencia','Av. Independencia 720','3794678901','florenciarz@gmail.com'),
('Martinez','Carolina','Av. Maipu 840','3794234567','carolinamaz@gmail.com'),
('Diaz','Valeria','Av. Cazadores 1180','3794890123','valeria.diaz@gmail.com'),
('Fernandez','Cristina','Av. Costanera','3795239123','cristinafk@gmail.com'),
('Acosta','Javier','Calle España 815','3794125678','javieracosta@gmail.com'),
('Romero','Fernando','Calle Salta 950','3794569012','fernandorom@gmail.com'),
('Alvarez','Camila','Av. Laprida 680','3794458901','camila.alvarez@gmail.com');

--SELECT * FROM VETERINARIO;

INSERT INTO ESPECIALIDAD(nombre,descripcion,categoria)
VALUES 
('Cirugia', 'Procedimientos quirurgicos para diferentes enfermedades y lesiones', 'Quirurgica'),
('Reproduccion', 'Atencion de problemas reproductivos y control de la reproduccion', 'Reproductiva'),
('Traumatologia', 'Tratamiento de lesiones y enfermedades del sistema musculoesqueletico', 'Quirurgica'),
('Etologia', 'Evaluacion y tratamiento de problemas de comportamiento animal', 'Clinica'),
('Dermatologia', 'Diagnostico y tratamiento de enfermedades de la piel', 'Clinica'),
('Medicina Interna', 'Diagnostico y tratamiento integral de enfermedades internas', 'Clinica');

--SELECT * FROM ESPECIALIDAD;

INSERT INTO MEDICAMENTO(nombre,descripcion,cantidad,tipo)
VALUES
('Amoxicilina', 'Antibiotico veterinario', 20, 'Comprimido'),
('Miconazol', 'Antifungico veterinario', 1, 'Crema'),
('Mupirocina', 'Antibiotico de uso topico', 1, 'Crema'),
('Cefalexina', 'Antibiotico veterinario', 30, 'Comprimido'),
('Ivermectina', 'Antiparasitario veterinario', 1, 'Inyectable'),
('Omeprazol', 'Protector gastrico veterinario', 20, 'Comprimido'),
('Carprofeno', 'Antiinflamatorio veterinario', 20, 'Comprimido'),
('Penicilina', 'Antibiotico veterinario', 1, 'Inyectable'),
('Electrolitos', 'Solucion de rehidratacion veterinaria', 1, 'Solucion'),
('Dexametasona', 'Antiinflamatorio corticosteroide', 1, 'Inyectable');

--SELECT * FROM MEDICAMENTO;

INSERT INTO METODO_PAGO(tipo_nombre)
VALUES
('Efectivo'),
('Tarjeta de Debito'),
('Tarjeta de Credito'),
('Transferencia Mercado Pago');

--SELECT * FROM METODO_PAGO;

INSERT INTO PROVEEDOR(razon_social,direccion,telefono,email)
VALUES
('Distribuidora Veterinaria del Litoral','Av. 3 de Abril 1200','3794112233','contacto@distrilitoral.com'),
('Insumos Mascotas S.A.','Calle Pellegrini 850','3794445566','ventas@insumosmascotas.com'),
('PharmaVet Argentina','Av. Gobernador Ruiz 2100','3794778899','pedidos@pharmavet.com'),
('Laboratorios Zoovet','Calle Córdoba 430','3794551122','ventas@zoovet.com'),
('Nutricion Animal Corrientes','Av. Maipú 3100','3794883344','contacto@nutricionanimal.com'),
('Distribuidora San Martin','Calle San Martin 1540','3794226677','info@distrisanmartin.com'),
('Insumos Sanitarios Veterinaria','Av. Italia 620','3794991100','pedidos@insumosvet.com'),
('Global Pharma Vet','Calle Bolivar 980','3794337788','ventas@globalpharmavet.com');

--SELECT * FROM PROVEEDOR;

INSERT INTO PRODUCTO(nombre,categoria,precio)
VALUES
('Alimento Balanceado Perro Adulto 15kg','Alimentos',35000.00),
('Alimento Balanceado Gato Cachorro 3kg','Alimentos',12500.00),
('Shampoo Antiparasitario 500ml','Higiene',4500.00),
('Collar Antipulgas Perro Mediano','Accesorios',8200.00),
('Juguete Hueso de Goma','Accesorios',2500.00),
('Pipeta Antipulgas Perro Grande','Farmacia',6800.00),
('Comedero Acero Inoxidable 1L','Accesorios',3800.00),
('Rascador para Gatos Multinivel','Accesorios',24500.00);

--SELECT * FROM PRODUCTO;
INSERT INTO MASCOTA(nombre,especie,raza,edad,peso,id_cliente)
VALUES
('Max','Perro','Labrador',4,28.50,1),
('Luna','Gato','Siames',2,3.80,2),
('Rocco','Perro','Caniche',6,6.20,3),
('Mimi','Gato','Mestizo',1,2.90,4),
('Thor','Perro','Ovejero Aleman',3,32.00,5),
('Lola','Perro','Golden Retriever',5,26.00,6),
('Felix','Gato','Persa',4,4.10,7),
('Boby','Perro','Boxer',2,22.40,8);

--SELECT * FROM MASCOTA;


--

INSERT INTO CONSULTA
(fecha, hora, motivo, id_mascota, id_veterinario)
VALUES
   ('2026-09-01', '09:00:00', 'Fiebre y falta de apetito', 1, 1),
   ('2026-09-02', '10:30:00', 'Picazon y perdida de pelo', 2, 2),
   ('2026-09-03', '11:00:00', 'Vomitos y decaimiento', 3, 3),
   ('2026-09-04', '14:00:00', 'Dolor en una pata', 4, 4),
   ('2026-09-05', '15:30:00', 'Tos y dificultad respiratoria', 5, 5),
   ('2026-09-06', '16:00:00', 'Herida en la piel', 6, 6),
   ('2026-09-07', '09:30:00', 'Problemas digestivos', 7, 7),
   ('2026-09-08', '12:00:00', 'Debilidad y deshidratacion', 8, 8);

INSERT INTO TRATAMIENTO
(descripcion, tipo_tratamiento, sintomas, duracion_tratamiento, nro_consulta)
VALUES
   ('Tratamiento para infeccion bacteriana', 'Antibiotico', 'Fiebre y secrecion nasal', '07:00:00', 1),
   ('Tratamiento para infeccion urinaria', 'Antibiotico', 'Dolor y dificultad al orinar', '07:00:00', 4),
   ('Tratamiento antiparasitario', 'Antiparasitario', 'Parasitos y perdida de peso', '03:00:00', 5),
   ('Tratamiento gastrico', 'Gastrointestinal', 'Vomitos y falta de apetito', '05:00:00', 6),
   ('Tratamiento antiinflamatorio', 'Antiinflamatorio', 'Dolor e inflamacion', '07:00:00', 7);


INSERT INTO TRATAMIENTO
(descripcion, tipo_tratamiento, sintomas, nro_consulta)
VALUES
    ('Tratamiento de rehidratacion', 'Hidratacion', 'Deshidratacion y debilidad',8),
    ('Tratamiento para infeccion cutanea', 'Topico', 'Heridas y enrojecimiento',3),
    ('Tratamiento contra hongos', 'Antifungico', 'Picazon y lesiones en la piel',2);

INSERT INTO VENTA
(descripcion, fecha_hora, monto, id_cliente, id_metodo_pago)
VALUES
    ('Compra de medicamentos', '2026-09-01 09:30:00', 15000, 1, 1),
    ('Compra de antibioticos', '2026-09-02 10:15:00', 22000, 2, 2),
    ('Compra de medicamentos veterinarios', '2026-09-03 11:45:00', 18500, 3, 3),
    ('Compra de tratamiento dermatologico', '2026-09-04 14:20:00', 12500, 4, 1),
    ('Compra de antiparasitarios', '2026-09-05 16:00:00', 9000, 5, 4),
    ('Compra de medicamentos', '2026-09-06 17:30:00', 27000, 6, 5),
    ('Compra de antiinflamatorios', '2026-09-07 13:10:00', 13500, 7, 2),
    ('Compra de medicamentos varios', '2026-09-08 18:45:00', 31000, 8, 6);


INSERT INTO DETALLE_VENTA
(cantidad, precio_unitario, subtotal, id_venta)
VALUES
    (2, 7500, 15000, 1),
    (4, 5500, 22000, 2),
    (5, 3700, 18500, 3),
    (1, 12500, 12500, 4),
    (3, 3000, 9000, 5),
    (2, 13500, 27000, 6),
    (3, 4500, 13500, 7),
    (2, 15500, 31000, 8);


INSERT INTO DETALLE_TRATAMIENTO
(CANTIDAD, DOSIS, DURACION, id_medicamento, id_tratamiento)
VALUES
    (2, '1 comprimido cada 8 horas', '7 dias', 1, 1),
    (1, 'Aplicar 2 veces al dia', '14 dias', 2, 2),
    (1, 'Aplicar sobre la herida', '10 dias', 3, 3),
    (3, '1 comprimido cada 8 horas', '7 dias', 4, 4),
    (1, 'Aplicacion unica', '1 dia', 5, 5),
    (2, '1 comprimido al dia', '5 dias', 6, 6),
    (2, '1 comprimido cada 12 horas', '7 dias', 7, 7),
    (1, 'Aplicar por via inyectable', '4 dias', 9, 8);

