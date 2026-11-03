--Indices de la base de datos

--Indice que busca la fecha_hora de una venta e incluye el monto y el id del cliente
CREATE NONCLUSTERED INDEX IX_Venta_Fecha_Include 
ON VENTA(fecha_hora) 
INCLUDE (monto, id_cliente);

-- Indice que busca la fecha de una consulta e incluye el motivo, el id de la mascota y el id del veterinario
CREATE NONCLUSTERED INDEX IX_Consulta_Fecha_Include 
ON CONSULTA(fecha) 
INCLUDE (motivo, id_mascota, id_veterinario);

--Indice para buscar numero de consulta del tratamiento que se le hizo a la mascota
CREATE NONCLUSTERED INDEX IX_Tratamiento_Consulta 
ON TRATAMIENTO(nro_consulta);

-- Indice para buscar el id de la mascota de la consulta
CREATE NONCLUSTERED INDEX IX_Consulta_Mascota 
ON CONSULTA(id_mascota);

--Indice para buscar el id del cliente, para saber quien es el dueño de dicha mascota
CREATE NONCLUSTERED INDEX IX_Mascota_Cliente 
ON MASCOTA(id_cliente);


--Todos estos indices facilitan de cierta forma al sistema a la hora de buscar ciertos datos de ciertas tablas
--En el siguiente caso, mostraremos 2 consultas y explicaremos como se usan con estos indices

-- Ejemplo para ver las ventas de una fecha con el nombre del cliente
SELECT V.id_venta, V.fecha_hora, V.monto, C.nombre AS nombre_cliente, C.apellido AS apellido_cliente
FROM VENTA V
INNER JOIN CLIENTE C ON V.id_cliente = C.id_cliente
WHERE V.fecha_hora >= '2025-01-10 00:00:00' 
  AND V.fecha_hora < '2025-01-11 00:00:00';


-- Ejemplo para ver todos los datos de la consulta de un cliente, segun el ID de un cliente
  SELECT 
    C.id_nroConsulta, 
    C.fecha, 
    C.hora, 
    C.motivo, 
    M.nombre AS nombre_mascota, 
    CL.nombre AS nombre_cliente, 
    CL.apellido AS apellido_cliente
FROM CONSULTA C
INNER JOIN MASCOTA M ON C.id_mascota = M.id_mascota
INNER JOIN CLIENTE CL ON M.id_cliente = CL.id_cliente
WHERE CL.id_cliente = 1; -- Aquí reemplazas el ID del cliente que quieres consultar
