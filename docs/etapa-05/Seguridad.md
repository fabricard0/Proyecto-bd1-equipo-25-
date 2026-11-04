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
-- 1. Crear el procedimiento con los nombres de columnas correctos
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
        c.fecha AS fecha_consulta,
        c.motivo AS diagnostico, -- Usamos 'motivo' como diagnóstico ya que es la columna disponible
        v.apellido + ', ' + v.nombre AS veterinario,
        ISNULL(t.descripcion, 'Sin tratamiento') AS tratamiento,
        ISNULL(t.tipo_tratamiento, 'N/A') AS medicamento -- Adaptado al campo real de tratamiento
    FROM MASCOTA m
    INNER JOIN CONSULTA c ON c.id_mascota = m.id_mascota
    INNER JOIN VETERINARIO v ON v.id_veterinario = c.id_veterinario
    LEFT JOIN TRATAMIENTO t ON t.nro_consulta = c.id_nroConsulta
    WHERE m.id_mascota = @id_mascota
    ORDER BY c.fecha DESC;
END;
GO

```
Y este es el script que usaremos para asignar dicho procedimiento:

```sql
-- 2. Otorgar el permiso de ejecución al usuario de lectura
GRANT EXECUTE ON dbo.sp_historialClinicoMascota TO [usr_lectura];
GO

```

### 3. Pruebas del insert y el procedimiento con ambos usuarios

Realizaremos una serie de pruebas para verificar el funcionamiento de los permisos y restricciones de acceso, al ejecutar el siguiente script luego de haber creado los usuarios 


```sql
USE VETERINARIA;
GO

----------------------------------------------------
-- 1. PROBANDO CON EL USUARIO DE LECTURA (usr_lectura)
----------------------------------------------------
EXECUTE AS LOGIN = 'LgnLectura';
GO


-- Si iniciaras sesión como usr_lectura_tp y ejecutas esto: creo que daria error
INSERT INTO MASCOTA (nombre, especie, raza, edad, peso, id_cliente)
VALUES
('Enzo', 'Perro', 'Salchicha', '7', '15 kilos', 4);
```

Nos soltara el siguiente mensaje la consola:

<img width="943" height="546" alt="Captura de pantalla 2026-11-03 205202" src="https://github.com/user-attachments/assets/ff4ee892-9f61-4be7-ba57-abb3b40466e3" />

Como se puede apreciar, el permiso de INSERT fue denegado en el usuario lectura, sin embargo, al usar el procedimiento que le otorgamos anteriormente:

<img width="830" height="480" alt="Captura de pantalla 2026-11-03 221318" src="https://github.com/user-attachments/assets/2f02692d-1b88-42a2-ad07-ff2918769f12" />

Se puede apreciar que logra realizar el procedimiento correspondiente, debido a que ya le habiamos asignado este procedimiento a usr_lectura

Ahora revertiremos, y iremos al usuario admin, en el que, al ejecutar ya sea un INSERT, DELECT o un SELECT, saldria bien la consulta, lo haremos con este script:


```sql
-- Volvemos a nuestro usuario administrador original:
REVERT;
GO

----------------------------------------------------
-- 2. PROBANDO CON EL ADMINISTRADOR (usr_admin)
----------------------------------------------------
EXECUTE AS LOGIN = 'LgnAdmin';
GO

INSERT INTO MASCOTA (nombre, especie, raza, edad, peso, id_cliente) 
VALUES ('Enzo', 'Perro', 'Salchicha', 7, 14, 3);

SELECT * FROM MASCOTA;

-- Volvemos a nuestro usuario administrador original:
REVERT;
GO
```

El resultado es el siguiente:

<img width="608" height="669" alt="Captura de pantalla 2026-11-03 223348" src="https://github.com/user-attachments/assets/ef8a6a7f-5f19-4dd7-a736-48e053be732e" />


como se puede, se inserto la nueva mascota y se pudo ver los resultados


### 4. Pruebas del insert y el procedimiento con nuevos usuarios a nivel de roles de la base de datos

Crearemos otros 2 usuarios para comprobar la funcion de los roles:


```sql
-- 1. Creamos dos nuevos usuarios para esta prueba de roles personalizados
CREATE LOGIN LgnUserA WITH PASSWORD = 'Contrasena1234';
CREATE LOGIN LgnUserB WITH PASSWORD = 'Contrasena1234';
GO

CREATE USER usr_con_rol FOR LOGIN LgnUserA;
CREATE USER usr_sin_rol FOR LOGIN LgnUserB;
GO

-- 2. Creamos un Rol Personalizado en la base de datos
CREATE ROLE rol_lectura_veterinarios;
GO

-- 3. Le damos permiso de SELECT (lectura) UNICAMENTE sobre esa tabla en ese rol
GRANT SELECT ON dbo.VETERINARIO TO rol_lectura_veterinarios;
GO

-- 4. Agregamos a uno de los usuarios al rol personalizado creado
ALTER ROLE rol_lectura_veterinarios ADD MEMBER usr_con_rol;
GO
```

Luego de crear los 2 usuarios y asignar el rol al usuario, usr_con_rol, ejecutaremos el siguiente script:

```sql
-- PRUEBAS DE ACCESO CORRECTAS

-- PRUEBA 1: Probando con el usuario SIN rol (Debe dar ERROR de permisos)
EXECUTE AS USER = 'usr_sin_rol';
GO
SELECT * FROM VETERINARIO; 
GO
REVERT;
GO

-- PRUEBA 2: Probando con el usuario CON rol (Debe funcionar correctamente)
EXECUTE AS USER = 'usr_con_rol';
GO
SELECT * FROM VETERINARIO; 
GO
REVERT;
GO
```











