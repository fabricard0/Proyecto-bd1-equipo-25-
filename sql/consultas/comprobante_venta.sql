-- CONSULTA FACTURA
SELECT 
    VENTA.id_venta AS [Nro Factura],
    VENTA.fecha_hora AS [Fecha],
    CLIENTE.apellido + ', ' + CLIENTE.nombre AS [Cliente],
    METODO_PAGO.tipo_nombre AS [Metodo Pago],
    DETALLE_VENTA.id_producto AS [Codigo Producto],
    DETALLE_VENTA.cantidad AS [Cantidad],
    DETALLE_VENTA.precio_unitario AS [Precio Unitario],
    (DETALLE_VENTA.cantidad * DETALLE_VENTA.precio_unitario) AS [Subtotal Renglon]
FROM VENTA
JOIN CLIENTE 
    ON VENTA.id_cliente = CLIENTE.id_cliente
JOIN METODO_PAGO 
    ON VENTA.id_metodo_pago = METODO_PAGO.id_metodo_pago
JOIN DETALLE_VENTA 
    ON VENTA.id_venta = DETALLE_VENTA.id_venta
WHERE VENTA.id_venta = 1;
