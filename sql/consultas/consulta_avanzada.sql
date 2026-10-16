-- Consulta de negocio avanzada | Productos vendidos mas de 10 unidades:

SELECT
    p.nombre AS Producto,
    p.categoria AS Categoria,
    SUM(dv.cantidad) AS Unidades_Vendidas,
    SUM(dv.subtotal) AS Total_Vendido
FROM PRODUCTO p
INNER JOIN DETALLE_VENTA dv
    ON p.id_producto = dv.id_producto
INNER JOIN VENTA v
    ON dv.id_venta = v.id_venta
WHERE v.fecha_hora >= '20260901'
  AND v.fecha_hora < '20261001'
GROUP BY
    p.id_producto,
    p.nombre,
    p.categoria
HAVING SUM(dv.cantidad) > 10
ORDER BY Unidades_Vendidas DESC;

-- Mascotas que recibieron mas de un tratamiento

SELECT
    m.nombre AS Mascota,
    c.nombre AS Propietario,
    c.apellido,
    COUNT(t.id_tratamiento) AS Cantidad_Tratamientos
FROM MASCOTA m
INNER JOIN CLIENTE c
    ON m.id_cliente = c.id_cliente
INNER JOIN CONSULTA co
    ON m.id_mascota = co.id_mascota
INNER JOIN TRATAMIENTO t
    ON co.id_nroConsulta = t.nro_consulta
GROUP BY m.id_mascota, m.nombre, c.nombre, c.apellido
HAVING COUNT(t.id_tratamiento) > 1;

-- Categorias con mas de $100.000 en ventas

USE VETERINARIA;
GO

SELECT
    p.categoria AS Categoria,
    SUM(dv.subtotal) AS Total_Vendido,
    COUNT(DISTINCT v.id_venta) AS Cantidad_Ventas
FROM PRODUCTO p
INNER JOIN DETALLE_VENTA dv
    ON p.id_producto = dv.id_producto
INNER JOIN VENTA v
    ON dv.id_venta = v.id_venta
WHERE v.fecha_hora >= '20260901'
  AND v.fecha_hora < '20261001'
GROUP BY p.categoria
HAVING SUM(dv.subtotal) > 100000
   AND COUNT(DISTINCT v.id_venta) >= 3
ORDER BY Total_Vendido DESC;

-- Tratamientos realizados a las mascotas por veterinario

SELECT
    m.nombre AS Mascota,
    v.nombre AS Veterinario,
    v.apellido AS Apellido_Veterinario,
    t.descripcion AS Tratamiento,
    t.duracion_tratamiento AS Duracion
FROM MASCOTA m
INNER JOIN CONSULTA c
    ON m.id_mascota = c.id_mascota
INNER JOIN VETERINARIO v
    ON c.id_veterinario = v.id_veterinario
INNER JOIN TRATAMIENTO t
    ON c.id_nroConsulta = t.nro_consulta
ORDER BY m.nombre;
