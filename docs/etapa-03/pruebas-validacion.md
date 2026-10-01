--Script DML para cargar los registros en las tablas correspondientes

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



