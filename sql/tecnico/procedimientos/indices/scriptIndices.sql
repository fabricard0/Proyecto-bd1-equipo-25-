USE VETERINARIA;
GO

-- Se crea un indice para buscar el nombre de una mascota por su nombre
CREATE NONCLUSTERED INDEX IX_Mascota_Nombre 
ON MASCOTA(nombre);
GO

-- Se crea un indce para ver una venta en un intervalo de 2 fechas
CREATE NONCLUSTERED INDEX IX_Venta_Fecha 
ON VENTA(fecha_hora);
GO
