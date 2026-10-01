
### `pruebas-validacion.md`

```md
# Informe de pruebas y validación

Se realizaron pruebas sobre las restricciones definidas en la base de datos con el objetivo de comprobar que las reglas establecidas sean respetadas por SQL Server.

## 1. Validación de claves

Se verificó que las claves primarias permitan identificar los registros de forma única y que las claves foráneas solamente permitan establecer relaciones con registros existentes.

Por ejemplo, no debe ser posible insertar una `MASCOTA` utilizando un `id_cliente` que no exista en la tabla `CLIENTE`.

También se validaron las claves compuestas utilizadas en `DETALLE_VENTA`, `DETALLE_TRATAMIENTO` y en las tablas intermedias.

## 2. Validación de restricciones

Se probaron las restricciones `UNIQUE` intentando ingresar valores duplicados en atributos como `email`.

También se verificaron las restricciones `CHECK`. Por ejemplo, un medicamento con un tipo diferente de los valores permitidos debe ser rechazado.

Algunos valores que deben ser rechazados son:

```sql
-- Tipo de medicamento no permitido
'Jarabe'

-- Cantidad de medicamento inválida
0

-- Precio de producto inválido
-100


