--Ejecutar DESPUES del DDL

USE VETERINARIA;
GO


INSERT INTO CLIENTE(apellido,nombre,direccion,telefono,email)
VALUES
('Perez','Juan','Calle Junin 460','3794324567','juan12@gmail.com'),
('Gomez','Maria','Calle Mendoza 1320','3795562142','mariagomez@gmail.com'),
('Fernandez','Martin','Av. Maipu 2035','3794329456','martinf@gmail.com'),
('Diaz','Laura','Calle Junin 630','3794456789','lauradiaz@gmail.com'),
('Ramirez','Valentina','Calle Rivadavia 410','3794012388','valentinarz@gmail.com'),
('Lopez','Carlos','Av. 3 de Abril 1520','3794345678','carloslopez@gmail.com'),
('Fernandez','Sofia','Calle Belgrano 1145','3794678955','sofifernandez@gmail.com'),
('Rodriguez','Lucas','Av. Cazadores 780','3794789012','lucasrodriguez@gmail.com');
GO

-- CORREGIDO: la direccion de Cristina ahora tiene numero.
INSERT INTO VETERINARIO(apellido,nombre,direccion,telefono,email)
VALUES
('Perez','Natalia','Av. Chacabuco 1430','3794012345','natalia.perez@gmail.com'),
('Ramirez','Florencia','Av. Independencia 720','3794678901','florenciarz@gmail.com'),
('Martinez','Carolina','Av. Maipu 840','3794234567','carolinamaz@gmail.com'),
('Diaz','Valeria','Av. Cazadores 1180','3794890123','valeria.diaz@gmail.com'),
('Fernandez','Cristina','Av. Costanera 1250','3795239123','cristinafk@gmail.com'),
('Acosta','Javier','Calle Espana 815','3794125678','javieracosta@gmail.com');
GO

INSERT INTO ESPECIALIDAD(nombre,descripcion,categoria)
VALUES
('Cirugia','Procedimientos quirurgicos para diferentes enfermedades y lesiones','Quirurgica'),
('Reproduccion','Atencion de problemas reproductivos y control de la reproduccion','Reproductiva'),
('Traumatologia','Tratamiento de lesiones y enfermedades del sistema musculoesqueletico','Quirurgica'),
('Etologia','Evaluacion y tratamiento de problemas de comportamiento animal','Clinica'),
('Dermatologia','Diagnostico y tratamiento de enfermedades de la piel','Clinica'),
('Medicina Interna','Diagnostico y tratamiento integral de enfermedades internas','Clinica');
GO

INSERT INTO PRODUCTO(nombre,categoria,precio)
VALUES
('Alimento Balanceado Perro Adulto 15kg','Alimentos',35000.00),
('Alimento Balanceado Gato Cachorro 3kg','Alimentos',12500.00),
('Shampoo Antiparasitario 500ml','Higiene',4500.00),
('Collar Antipulgas Perro Mediano','Accesorios',8200.00),
('Juguete Hueso de Goma','Accesorios',2500.00),
('Alimento Balanceado Gato Adulto 7kg','Alimentos',22000.00),
('Arena Sanitaria para Gatos 10kg','Higiene',9500.00),
('Transportadora para Mascotas','Accesorios',28000.00),
('Amoxicilina','Medicamentos',8000.00),
('Cefalexina','Medicamentos',6500.00),
('Ivermectina','Medicamentos',9000.00),
('Omeprazol','Medicamentos',5000.00),
('Penicilina','Medicamentos',8500.00),
('Electrolitos','Medicamentos',6000.00),
('Dexametasona','Medicamentos',7000.00),
('Miconazol','Medicamentos',6800.00);
GO

INSERT INTO MEDICAMENTO(nombre,descripcion,cantidad,tipo,id_producto)
VALUES
('Amoxicilina','Antibiotico veterinario',20,'Comprimido',9),
('Cefalexina','Antibiotico veterinario',30,'Comprimido',10),
('Ivermectina','Antiparasitario veterinario',1,'Inyectable',11),
('Omeprazol','Protector gastrico veterinario',20,'Comprimido',12),
('Penicilina','Antibiotico veterinario',1,'Inyectable',13),
('Electrolitos','Solucion de rehidratacion veterinaria',1,'Solucion',14),
('Dexametasona','Antiinflamatorio veterinario',1,'Inyectable',15),
('Miconazol','Antifungico veterinario',1,'Crema',16);
GO

INSERT INTO METODO_PAGO(tipo_nombre)
VALUES
('Efectivo'),
('Tarjeta de Debito'),
('Tarjeta de Credito'),
('Transferencia Mercado Pago');
GO

INSERT INTO PROVEEDOR(razon_social,direccion,telefono,email)
VALUES
('Distribuidora Veterinaria del Litoral','Av. 3 de Abril 1200','3794112233','contacto@distrilitoral.com'),
('Insumos Mascotas S.A.','Calle Pellegrini 850','3794445566','ventas@insumosmascotas.com'),
('PharmaVet Argentina','Av. Gobernador Ruiz 2100','3794778899','pedidos@pharmavet.com'),
('Laboratorios Zoovet','Calle Cordoba 430','3794551122','ventas@zoovet.com'),
('Nutricion Animal Corrientes','Av. Maipu 3100','3794883344','contacto@nutricionanimal.com'),
('Distribuidora San Martin','Calle San Martin 1540','3794226677','info@distrisanmartin.com');
GO


INSERT INTO MASCOTA(nombre,especie,raza,edad,peso,id_cliente)
VALUES
('Max','Perro','Labrador',4,28.50,1),
('Luna','Gato','Siames',2,3.80,2),
('Rocco','Perro','Caniche',6,6.20,3),
('Mimi','Gato',NULL,1,2.90,4),
('Thor','Perro','Ovejero Aleman',3,32.00,5),
('Lola','Perro','Golden Retriever',5,26.00,6),
('Toby','Perro','Beagle',4,12.50,7),
('Nina','Gato','Persa',3,4.20,8),
('Rocky','Perro','Bulldog',6,22.00,1),
('Kira','Perro','Labrador',8,28.00,1),
('Simba','Gato','Siames',3,4.00,5);
GO

INSERT INTO CONSULTA(fecha,hora,motivo,id_mascota,id_veterinario)
VALUES
('2026-09-01','09:00:00','Fiebre y falta de apetito',1,1),
('2026-09-02','10:30:00','Picazon y perdida de pelo',2,1),
('2026-09-03','11:00:00','Vomitos y decaimiento',3,6),
('2026-09-04','14:00:00','Dolor en una pata',4,4),
('2026-09-05','15:30:00','Tos y dificultad respiratoria',5,6),
('2026-09-06','16:00:00','Herida en la piel',6,6),
('2026-09-07','09:30:00','Problemas digestivos',7,6),
('2026-09-08','12:00:00','Debilidad y deshidratacion',8,6),
('2026-09-16','09:00:00','Control general de Rocky',9,1),
('2026-09-18','11:00:00','Picazon e irritacion de la piel de Kira',10,5),
('2026-09-19','14:00:00','Revision preventiva de Simba',11,3),
('2026-09-20','16:00:00','Control general de Max',1,4);
GO

INSERT INTO TRATAMIENTO(descripcion,tipo_tratamiento,sintomas,duracion_tratamiento,nro_consulta)
VALUES
('Seguimiento por fiebre y falta de apetito','Antibiotico','Fiebre y falta de apetito','7 dias',1),
('Evaluacion de problema dermatologico','Antifungico','Picazon y perdida de pelo','14 dias',2),
('Seguimiento de vomitos y decaimiento','Gastrointestinal','Vomitos y decaimiento','5 dias',3),
('Evaluacion de dolor en una pata','Antiinflamatorio','Dolor en una pata','7 dias',4),
('Evaluacion de tos y dificultad respiratoria','Control clinico','Tos y dificultad respiratoria','3 dias',5),
('Cuidado de herida en la piel','Curativo','Herida en la piel','10 dias',6),
('Seguimiento de problemas digestivos','Gastrointestinal','Problemas digestivos','5 dias',7),
('Seguimiento de deshidratacion','Hidratacion','Debilidad y deshidratacion','4 dias',8),
('Control general y recomendaciones preventivas','Preventivo','Sin sintomas relevantes','1 dia',9),
('Evaluacion de irritacion de la piel','Antifungico','Picazon e irritacion de la piel','14 dias',10),
('Revision preventiva','Preventivo','Sin sintomas relevantes','7 dias',11),
('Control general','Control','Sin sintomas relevantes','3 dias',12);
GO

INSERT INTO VENTA(descripcion,fecha_hora,monto,id_cliente,id_metodo_pago)
VALUES
('Compra de alimento para perros','2026-09-10T09:30:00',70000,1,1),
('Compra de accesorios para mascotas','2026-09-10T10:15:00',21400,2,2),
('Compra de productos de higiene','2026-09-11T11:45:00',13500,3,3),
('Compra de medicamentos veterinarios','2026-09-11T14:20:00',25000,4,4),
('Compra de alimento para gatos','2026-09-12T16:00:00',44000,5,1),
('Compra de medicamentos veterinarios','2026-09-12T17:30:00',17000,6,2),
('Compra de accesorios','2026-09-13T13:10:00',56000,7,3),
('Compra de medicamentos veterinarios','2026-09-13T18:45:00',31000,8,4),
('Compra de alimento y arena sanitaria','2026-09-14T09:00:00',53500,1,1),
('Compra de productos de higiene','2026-09-14T10:30:00',23000,2,2),
('Compra de medicamentos veterinarios','2026-09-15T12:00:00',32000,3,3),
('Compra de juguetes y accesorios','2026-09-15T16:30:00',21400,4,4);
GO

INSERT INTO DETALLE_VENTA(cantidad,precio_unitario,subtotal,id_venta,id_producto)
VALUES
(2,35000,70000,1,1),
(2,8200,16400,2,4),
(2,2500,5000,2,5),
(3,4500,13500,3,3),
(2,8000,16000,4,9),
(1,9000,9000,4,11),
(2,22000,44000,5,6),
(2,8500,17000,6,13),
(2,28000,56000,7,8),
(2,8500,17000,8,13),
(2,7000,14000,8,15),
(2,22000,44000,9,6),
(1,9500,9500,9,7),
(3,4500,13500,10,3),
(1,9500,9500,10,7),
(4,8000,32000,11,9),
(2,8200,16400,12,4),
(2,2500,5000,12,5);
GO


INSERT INTO DETALLE_TRATAMIENTO(cantidad,dosis,duracion,id_medicamento,id_tratamiento)
VALUES
(1,'Cada 8 horas','7 dias',1,1),
(1,'Cada 12 horas','14 dias',8,2),
(1,'Cada 24 horas','5 dias',4,3),
(1,'Cada 24 horas','7 dias',7,4),
(1,'Cada 12 horas','10 dias',2,6),
(1,'Cada 8 horas','5 dias',4,7),
(1,'Cada 24 horas','4 dias',6,8),
(1,'Cada 12 horas','14 dias',8,10);
GO

INSERT INTO STOCK(id_producto,cantidad)
VALUES
(1,25),
(2,18),
(3,12),
(4,20),
(5,30),
(6,15),
(7,8),
(8,22),
(9,22),
(10,15),
(11,20),
(12,35),
(13,10),
(14,25),
(15,18),
(16,12);
GO


INSERT INTO PRODUCTO_PROVEEDOR(id_producto,id_proveedor,precio_compra,cantidad)
VALUES
(1,5,26000,25),
(1,1,27000,20),
(2,2,9000,20),
(6,5,16000,18),
(3,6,3000,15),
(3,2,3200,20),
(4,1,5500,30),
(5,2,1300,40),
(7,2,6200,20),
(8,6,20000,25),
(9,3,5200,40),
(10,4,4200,15),
(11,3,4900,20),
(12,4,3100,40),
(13,3,8000,20),
(14,4,5400,30),
(15,4,5200,25),
(16,4,4500,20);
GO

INSERT INTO VETERINARIO_ESPECIALIDAD(id_veterinario,id_especialidad)
VALUES
(1,1),
(1,5),
(2,2),
(2,4),
(3,1),
(4,3),
(5,5),
(6,6),
(6,1);
GO
