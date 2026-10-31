## INDICES

Para la siguiente etapa se implementa el mecanismo de los indices, para optimizar de mejor forma, la búsqueda de ciertos registros en la tabla de base de datos, y haremos una medición
precisa de los tiempos de respuesta antes y despues de aplicar indices, al igual que evaluaremos la mejora del rendimiento.
Para este caso en concreto, crearemos una tabla en la que documentaremos los datos y mediciones de tiempo de respuesta, debido a que insertar 1 millon de registros en una tabla, haria que
haya conflictos con la base de datos de la veterinaria

### 1. Creacion de la tabla e insercion de los 1 millon de registros

En este caso, aplicaremos el siguiente script la creación de la nueva tabla `VENTA_TEST`:

```sql
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
    total DECIMAL(10,2) --almacena maximo un numero de 10 digitos con 2 decimales
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

-- Verificamos que se hayan cargado correctamente
SELECT COUNT(*) AS TotalRegistros FROM VENTA_TEST;


```
### 2. Comprobar resultados y rendimiento sin indice

Ahora buscaremos uno de los registros de la tabla sin usar el indice, también activaremos "estadistics" para ver con mayor precisión dichos resultados:

```sql
USE VETERINARIA;
GO

-- 1. Activamos las estadísticas de tiempo para ver cuanto tiempo procesamiento le tomo la consulta
-- y E/S (Entrada/Salida), para ver 
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

-- 2. Ejecutamos la búsqueda por periodo (ej: todo el mes de enero de un año de prueba)
SELECT * 
FROM VENTA_TEST 
WHERE fecha_hora >= '2025-01-01' 
  AND fecha_hora < '2025-02-01';
GO
```
Al usar este código, nos mostrara, los siguientes resultados:

<img width="1197" height="111" alt="Captura de pantalla 2026-10-31 121254" src="https://github.com/user-attachments/assets/aa72c089-b874-439a-89de-6725243b2332" />

<img width="426" height="104" alt="Captura de pantalla 2026-10-31 121432" src="https://github.com/user-attachments/assets/99ea3a11-caf4-4d75-896a-df9d95bc736b" />

Como se puede apreciar en ambas imágenes, al no existir un índice secundario sobre fecha_hora, SQL Server se vio obligado a leer 3.733 páginas de datos de la tabla VENTA_TEST para evaluar el millón de registros, consumiendo un tiempo transcurrido de 276 ms, ademas que, uso un 100% del CPU para ver estos registros


### 3. Comprobar resultados y rendimiento CON indice

Para este caso, crearemos un indice en el que busque a traves de la "fecha_hora" de la tabla  `VENTA_TEST`, luego mostraremos sus resultados y rendimiento, utilizaremos el siguiente codigo

```sql
USE VETERINARIA;
GO

-- Creamos el índice correcto sobre la columna de fecha
CREATE NONCLUSTERED INDEX IX_Venta_Test_Fecha 
ON VENTA_TEST(fecha_hora);
GO

SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

-- Ejecutamos esta consulta para buscar un intervalo de fecha
SELECT * 
FROM VENTA_TEST 
WHERE fecha_hora >= '2025-01-01' 
  AND fecha_hora < '2025-02-01';
GO
```
Luego de usar ese script, los resultados serian los siguientes:


