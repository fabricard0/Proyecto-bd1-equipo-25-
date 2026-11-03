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

### 2. Asignación de roles a diferentes usuarios 

Luego de haber creado dichos usuarios, les asignaremos los roles correspondientes, uno le asignaremos el rol de admin y otro de solo lectura:

```sql

-- 3. Al usuario usr_admin, le damos el control total de la base de datos (el rol de owner)
ALTER ROLE db_owner ADD MEMBER usr_admin;
GO

-- 4. Al usuario usr_lectura, el damos el permiso de lectura (rol db_datareader)
ALTER ROLE db_datareader ADD MEMBER usr_lectura;
GO

```



