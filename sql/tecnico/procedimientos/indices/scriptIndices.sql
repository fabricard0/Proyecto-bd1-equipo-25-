USE VETERINARIA;
GO

-- Se crea un indice para buscar el nombre de una mascota por su nombre
CREATE NONCLUSTERED INDEX IX_Mascota_Nombre 
ON MASCOTA(nombre);
GO

-- Se crea un indce para ver una venta segun la fecha
CREATE NONCLUSTERED INDEX IX_Venta_Fecha 
ON VENTA(fecha_hora);
GO
