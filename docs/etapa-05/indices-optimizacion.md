## INDICES

Para la siguiente etapa se implementa el mecanismo de los indices, para optimizar de mejor forma, la búsqueda de ciertos registros en la tabla de base de datos, y haremos una medición
precisa de los tiempos de respuesta antes y despues de aplicar indices, al igual que evaluaremos la mejora del rendimiento.
Para este caso en concreto, crearemos una tabla en la que documentaremos los datos y mediciones de tiempo de respuesta, debido a que insertar 1 millon de registros en una tabla, haria que
haya conflictos con la base de datos de la veterinaria

### 1. Creacion de la tabla e insercion de los 1 millon de registros

En este caso, aplicaremos el siguiente script la creación de la nueva tabla:



USE VETERINARIA;
GO

-- Esta parte verifica si existe la tabla con el nombre VENTA_TEST, si es asi, se elimina y crea otro
IF OBJECT_ID('VENTA_TEST', 'U') IS NOT NULL 
    DROP TABLE VENTA_TEST;
GO

-- Se crea la tabla VENTA_TEST
CREATE TABLE VENTA_TEST (
    id_venta INT IDENTITY(1,1) PRIMARY KEY,
    fecha_hora DATETIME,
    total DECIMAL(10,2)
);
GO

-- 3. Script automatizado para cargar 1,000,000 de registros por lotes
SET NOCOUNT ON;
PRINT 'Iniciando la carga masiva de 1,000,000 de registros...';

DECLARE @contador INT = 0;

-- Hacemos 10 iteraciones de 100,000 filas cada una para completar el millón de forma rápida
WHILE @contador < 10
BEGIN
    INSERT INTO VENTA_TEST (fecha_hora, total)
    SELECT TOP 100000
        -- Genera fechas aleatorias dentro de los últimos 3 años
        DATEADD(SECOND, -CAST(ABS(CHECKSUM(NEWID())) % 94608000 AS INT), GETDATE()) AS fecha_hora,
        -- Genera un monto total aleatorio entre 10 y 1000
        CAST((ABS(CHECKSUM(NEWID())) % 99000 + 1000) / 100.0 AS DECIMAL(10,2)) AS total
    FROM sys.all_objects o1
    CROSS JOIN sys.all_objects o2;

    SET @contador = @contador + 1;
    PRINT CONCAT('Lote ', @contador, ' de 10 completado (100,000 filas insertadas).');
END

PRINT '¡Carga masiva finalizada con éxito! Total de registros: 1,000,000.';
GO




### 2. Indice IX_Venta_Fecha

Es un indice que permite buscar a traves de un intervalo de 2 fechas, una venta en especifica, se lo usa de esta forma:

" SELECT * 
FROM VENTA 
WHERE fecha_hora >= '2026-09-08' AND fecha_hora < '2026-09-11'; "

### 3. Indice IX_Consulta_Fecha

Es un indice que, similar al indice anterior, permite buscar entre un intervalo de 2 fechas, una consulta especifica



### 4. Indice IX_Detalle_venta_idVenta

Es un indice que, similar al indice anterior, permite buscar detalle de una venta en concreta a traves de su ID





