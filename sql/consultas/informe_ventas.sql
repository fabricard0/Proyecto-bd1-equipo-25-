
-- Informe de total de ventas realizadas por cada categoria de producto en un intervalo de fechas (incluido las unidades que se vendieron de cada producto por categoria)
SELECT
    P.categoria,
    SUM(DV.cantidad) AS unidades_vendidas,
    SUM(DV.subtotal) AS total_vendido,
    COUNT(DISTINCT V.id_venta) AS cantidad_ventas
FROM VENTA V
INNER JOIN DETALLE_VENTA DV
    ON V.id_venta = DV.id_venta
INNER JOIN PRODUCTO P
    ON DV.id_producto = P.id_producto
WHERE V.fecha_hora >= '20260910'
  AND V.fecha_hora <  '20260918'
GROUP BY
    P.categoria
ORDER BY total_vendido DESC;
