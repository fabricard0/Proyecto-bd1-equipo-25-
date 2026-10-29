## INDICES

Para la siguiente etapa se implementa el mecanismo de los indices, para optimizar de mejor forma, la búsqueda de ciertos registros en la tabla de base de datos

### 1. Indice IX_Mascota_IdMascota

Es un indice que permite buscar a traves del nombre de la mascota en los registros, usandolo de esta forma:

" SELECT nombre 
FROM MASCOTA 
WHERE nombre = 'Luna'; "


### 2. Indice IX_Venta_Fecha

Es un indice que permite buscar a traves de un intervalo de 2 fechas, una venta en especifica, se lo usa de esta forma:

" SELECT * 
FROM VENTA 
WHERE fecha_hora >= '2026-09-08' AND fecha_hora < '2026-09-11'; "

### 3. Indice IX_Consulta_Fecha

Es un indice que, similar al indice anterior, permite buscar entre un intervalo de 2 fechas, una consulta especifica



### 4. Indice IX_Detalle_venta_idVenta

Es un indice que, similar al indice anterior, permite buscar detalle de una venta en concreta a traves de su ID





