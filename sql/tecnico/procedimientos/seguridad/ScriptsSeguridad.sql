--Scripts para crear usuarios y asignarles procedimientos de la base de datos

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


-- 3. Al usuario usr_admin, le damos el control total de la base de datos (el rol de owner)
ALTER ROLE db_owner ADD MEMBER usr_admin;
GO

-- 4. Al usuario usr_lectura, el damos el permiso de lectura (rol db_datareader)
ALTER ROLE db_datareader ADD MEMBER usr_lectura;
GO

-- 5. Otorgar el permiso de ejecución al usr_lectura
GRANT EXECUTE ON dbo.sp_historialClinicoMascota TO [usr_lectura];
GO

 ---ROLES---
--Scripts para crear usuarios y asignarles un rol en concreto

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

