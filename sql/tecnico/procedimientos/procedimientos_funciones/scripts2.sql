--Procedimiento para registrar una venta validando stock y persistiendo datos
CREATE PROCEDURE dbo.sp_registrarVenta
(
    @id_cliente INT,
    @id_metodo_pago INT,
    @id_producto INT,
    @cantidad INT
)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @stock_actual INT;
    DECLARE @precio_unitario DECIMAL(10,2);
    DECLARE @id_venta_nueva INT;
    DECLARE @subtotal DECIMAL(10,2);

    
    SET @stock_actual = dbo.fn_stockDisponible(@id_producto);

    IF @stock_actual IS NULL OR @stock_actual < @cantidad
    BEGIN
        PRINT 'Error: Stock insuficiente o producto inexistente.';
        RETURN;
    END

    SELECT @precio_unitario = precio
    FROM PRODUCTO
    WHERE id_producto = @id_producto;

    SET @subtotal = @precio_unitario * @cantidad;

    BEGIN TRANSACTION;

    INSERT INTO VENTA (fecha_hora, monto, id_cliente, id_metodo_pago)
    VALUES (GETDATE(), @subtotal, @id_cliente, @id_metodo_pago);

    SET @id_venta_nueva = SCOPE_IDENTITY();

    INSERT INTO DETALLE_VENTA (cantidad, precio_unitario, subtotal, id_venta, id_producto)
    VALUES (@cantidad, @precio_unitario, @subtotal, @id_venta_nueva, @id_producto);

    UPDATE STOCK
    SET cantidad = cantidad - @cantidad
    WHERE id_producto = @id_producto;

    COMMIT TRANSACTION;

    SELECT 
        @id_venta_nueva AS id_venta_creada,
        @id_producto AS id_producto,
        @subtotal AS monto_total,
        'Venta registrada correctamente' AS resultado;
END;
GO

--EXEC dbo.sp_registrarVenta @id_cliente = 1, @id_metodo_pago = 1, @id_producto = 1, @cantidad = 2



--Procedimiento para consultar el historial clinico completo de una mascota
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

--EXEC dbo.sp_historialClinicoMascota @id_mascota = 1



--Procedimiento para consultar productos por categoria con su stock
CREATE PROCEDURE dbo.sp_consultarProductosCategoria
(
    @categoria VARCHAR(50)
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        p.id_producto,
        p.nombre,
        p.categoria,
        p.precio,
        ISNULL(s.cantidad, 0) AS stock_disponible
    FROM PRODUCTO p
    LEFT JOIN STOCK s ON s.id_producto = p.id_producto
    WHERE p.categoria = @categoria
    ORDER BY p.nombre ASC;
END;
GO

--EXEC dbo.sp_consultarProductosCategoria @categoria = 'Alimento'
--GO
