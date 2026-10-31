## INDICES

Para la siguiente etapa se implementa el mecanismo de los indices, para optimizar de mejor forma, la búsqueda de ciertos registros en la tabla de base de datos, y haremos una medición
precisa de los tiempos de respuesta antes y después de aplicar indices, al igual que evaluaremos la mejora del rendimiento.
Para este caso en concreto, crearemos una tabla en la que documentaremos los datos y mediciones de tiempo de respuesta, debido a que insertar 1 millón de registros en una tabla, haría que
haya conflictos con la base de datos de la veterinaria

### 1. Creación de la tabla e inserción de los 1 millón de registros

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

-- 1. Activamos las estadísticas para medir tiempo y E/S (Lecturas lógicas)
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

-- 2. Búsqueda por periodo (un día específico dentro del rango de los últimos 3 años)
SELECT * 
FROM VENTA_TEST 
WHERE fecha_hora >= '2025-01-10 00:00:00' 
  AND fecha_hora < '2025-01-11 00:00:00';
GO
```

Los resultados son los siguientes luego de usar ese script:

<img width="1038" height="86" alt="Captura de pantalla 2026-10-31 145323" src="https://github.com/user-attachments/assets/a97cf56d-f27b-4051-b70a-344533297d57" />
<img width="393" height="99" alt="Captura de pantalla 2026-10-31 145231" src="https://github.com/user-attachments/assets/12b332f3-8982-4a31-b202-670fa397aad0" />

Por lo que se puede ver, se hizo un recorrido completo de toda la tabla examinando las páginas de datos una por una hasta llegar al millón de registros, el costo fue de
3733 paginas (lecturas lógicas) y su tiempo respuesta fue 135 milisegundos 


### 3. Comprobar resultados y rendimiento CON indice

Para el siguiente paso, ejecutaremos la misma consulta para comparar los números con un indice no agrupado sobre la columna fecha, con el siguiente script realizaremos:

```sql
-- 1. Creamos el índice en la columna fecha_hora
CREATE NONCLUSTERED INDEX IX_Venta_Test_Fecha 
ON VENTA_TEST(fecha_hora);
GO

-- 2. Activamos las estadísticas para medir tiempo y E/S
SET STATISTICS TIME ON;
SET STATISTICS IO ON;
GO

-- 3. EL MISMO CÓDIGO DE BÚSQUEDA DE ANTES (Idéntico)
SELECT * 
FROM VENTA_TEST 
WHERE fecha_hora >= '2025-01-10 00:00:00' 
  AND fecha_hora < '2025-01-11 00:00:00';
GO
```
Los resultados, son los siguientes luego de usar ese script:

<img width="612" height="175" alt="Captura de pantalla 2026-10-31 163052" src="https://github.com/user-attachments/assets/e6eb03ce-4661-409a-9376-fadd6fdcbaff" />
<img width="1092" height="79" alt="Captura de pantalla 2026-10-31 163810" src="https://github.com/user-attachments/assets/d0ea6895-a239-4159-9708-c8bd6d808e73" />

Al crear un índice simple no agrupado sobre la columna fecha_hora, el motor de la base de datos utilizó inicialmente el índice para ubicar los registros de forma directa (el Index Seek). Sin embargo, debido a que la consulta solicitaba todas las columnas mediante un SELECT y el índice no contenía el resto de los datos, el motor se vio obligado a realizar una Búsqueda de claves por cada uno de los 980 registros encontrados para ir a buscarlos a la tabla principal.
Esto demuestra el fenómeno del costo por saltos múltiples: el esfuerzo y los recursos invertidos en realizar 980 accesos individuales a la tabla principal anularon la ventaja del índice, elevando las lecturas lógicas a 4.821.

### 4. Borrar el indice anterior y agregar el nuevo indice no agrupado con columnas incluidas

En este caso, se borrara el indice anterior y se creara uno nuevo con columnas incluidas para que el motor no tenga que ir a buscar los datos en la tabla, con el siguiente script, hacemos lo siguiente:






