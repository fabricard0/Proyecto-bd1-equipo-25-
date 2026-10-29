USE VETERINARIA;
GO

-- Índice para optimizar la búsqueda de consultas o historiales médicos por fecha
CREATE NONCLUSTERED INDEX IX_Consulta_Fecha 
ON CONSULTA(fecha); 
GO

-- Se crea un indce para ver una venta en un intervalo de 2 fechas
CREATE NONCLUSTERED INDEX IX_Venta_Fecha 
ON VENTA(fecha_hora);
GO

-- Se crea un indice para buscar una mascota en concreta segun su ID
CREATE NONCLUSTERED INDEX IX_Consulta_Mascota 
ON CONSULTA(id_mascota);
GO


CREATE NONCLUSTERED INDEX IX_Mascota_IdMascota
ON MASCOTA(id_mascota);
GO
