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
