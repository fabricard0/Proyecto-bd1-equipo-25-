
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
