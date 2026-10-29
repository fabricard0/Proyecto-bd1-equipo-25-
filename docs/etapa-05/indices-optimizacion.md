## INDICES

Para la siguiente etapa se implementa el mecanismo de los indices, para optimizar de mejor forma, la búsqueda de ciertos registros en la tabla de base de datos, y haremos una medición
precisa de los tiempos de respuesta antes y despues de aplicar indices, al igual que evaluaremos la mejora del rendimiento.
Para este caso en concreto, crearemos una tabla en la que documentaremos los datos y mediciones de tiempo de respuesta, debido a que insertar 1 millon de registros en una tabla, haria que
haya conflictos con la base de datos de la veterinaria

### 1. Creacion de la tabla e insercion de los 1 millon de registros

En este caso, aplicaremos el siguiente script la creación de la nueva tabla `VENTA_TEST`:

```sql
-- Aquí va todo tu código SQL...
USE VETERINARIA;
GO
-- ... y las últimas líneas de tu código ...
PRINT '¡Carga masiva finalizada!';
GO ´´´

Hola soy fabri

