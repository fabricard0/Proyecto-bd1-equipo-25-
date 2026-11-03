## Manejo de permisos a nivel de usuarios de base de datos

En esta etapa, se implementara el mecanismo de permisos a usuarios, en el que entenderemos el manejo de permisos y roles de bases de datos, junto la aplicación de
dichos permisos de lectura, escritura y ejecución para diferentes roles y usuarios, veremos su correcta implementación, pruebas de restricción de acceso y documentaremos
detalladamente el comportamiento de los usuario según el permiso que se les haya otorgado


### 1. Creación de usuarios con sus respectivos logins

En este caso, aplicaremos el siguiente script para crear los logins y asignar esos dichos logins, a los respectivos usuarios, con el siguiente script lo realizaremos:

```sql

USE VETERINARIA;
GO

-- 1. Creamos los logins en el servidor
CREATE LOGIN LgnAdmin WITH PASSWORD = 'Contrasena1234';
CREATE LOGIN LgnLectura WITH PASSWORD = 'Contrasena1234';
GO

-- 2. Creamos los usuarios asociados a esos logins dentro de la base de datos
CREATE USER usr_admin FOR LOGIN LgnAdmin;
CREATE USER usr_lectura FOR LOGIN LgnLectura;
GO

```

### 2. Asignación de roles a diferentes usuarios y asignar permiso de ejecución al usuario con permiso de solo lectura

Luego de haber creado dichos usuarios, les asignaremos los roles correspondientes, uno le asignaremos el rol de admin y otro de solo lectura:

```sql

-- 3. Al usuario usr_admin, le damos el control total de la base de datos (el rol de owner)
ALTER ROLE db_owner ADD MEMBER usr_admin;
GO

-- 4. Al usuario usr_lectura, el damos el permiso de lectura (rol db_datareader)
ALTER ROLE db_datareader ADD MEMBER usr_lectura;
GO

```

Una vez asignado los roles, le asignaremos al usuario de lectura (usr_lectura) el permiso para ejecutar uno de los procedimientos de nuestra base de datos, que es la siguiente:

```sql
--Procedimiento para consultar el historial clinico completo de una mascota y en el que se lo asignaremos al usuario usr_lectura
CREATE PROCEDURE dbo.sp_historialClinicoMascota
(
    @id_mascota INT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        m.id_mascota,
        m.nombre AS mascota,
        m.especie,
        c.fecha_consulta,
        c.diagnostico,
        v.apellido + ', ' + v.nombre AS veterinario,
        ISNULL(t.descripcion, 'Sin tratamiento') AS tratamiento,
        ISNULL(t.medicamento, 'N/A') AS medicamento
    FROM MASCOTA m
    INNER JOIN CONSULTA_MEDICA c ON c.id_mascota = m.id_mascota
    INNER JOIN VETERINARIO v ON v.id_veterinario = c.id_veterinario
    LEFT JOIN TRATAMIENTO t ON t.id_consulta = c.id_consulta
    WHERE m.id_mascota = @id_mascota
    ORDER BY c.fecha_consulta DESC;
END;
GO

```
Y este es el script que usaremos para asignar dicho procedimiento:

```sql
-- Otorgamos permiso de ejecución al usuario sobre el procedimiento almacenado
GRANT EXECUTE ON dbo.sp_historialClinicoMascota TO usr_lectura;
GO
```







