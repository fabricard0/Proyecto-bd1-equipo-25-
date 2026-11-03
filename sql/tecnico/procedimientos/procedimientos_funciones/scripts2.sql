

CREATE OR ALTER PROCEDURE dbo.sp_registrarVenta
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

    IF @cantidad <= 0
    BEGIN
        PRINT 'Error: La cantidad debe ser mayor a cero.';
        RETURN;
    END;

    SET @stock_actual = dbo.fn_stockDisponible(@id_producto);

    IF @stock_actual IS NULL OR @stock_actual < @cantidad
    BEGIN
        PRINT 'Error: Stock insuficiente o producto inexistente.';
        RETURN;
    END;

    SELECT @precio_unitario = precio
    FROM PRODUCTO
    WHERE id_producto = @id_producto;

    IF @precio_unitario IS NULL OR @precio_unitario <= 0
    BEGIN
        PRINT 'Error: Producto inexistente o precio inválido.';
        RETURN;
    END;

    SET @subtotal = @precio_unitario * @cantidad;

    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO VENTA
        (
            descripcion,
            fecha_hora,
            monto,
            id_cliente,
            id_metodo_pago
        )
        VALUES
        (
            'Venta de productos veterinarios',
            GETDATE(),
            @subtotal,
            @id_cliente,
            @id_metodo_pago
        );

        SET @id_venta_nueva = SCOPE_IDENTITY();

        INSERT INTO DETALLE_VENTA
        (
            cantidad,
            precio_unitario,
            subtotal,
            id_venta,
            id_producto
        )
        VALUES
        (
            @cantidad,
            @precio_unitario,
            @subtotal,
            @id_venta_nueva,
            @id_producto
        );

        UPDATE STOCK
        SET cantidad = cantidad - @cantidad
        WHERE id_producto = @id_producto;

        COMMIT TRANSACTION;

        SELECT
            @id_venta_nueva AS id_venta_creada,
            @id_producto AS id_producto,
            @subtotal AS monto_total,
            'Venta registrada correctamente' AS resultado;
    END TRY
    BEGIN CATCH
        IF @@TRANCOUNT > 0
            ROLLBACK TRANSACTION;

        PRINT 'Error al registrar la venta: ' + ERROR_MESSAGE();
    END CATCH;
END;
GO


--Procedimiento para consultar el historial clinico completo de una mascota
CREATE OR ALTER PROCEDURE dbo.sp_historialClinicoMascota
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
        c.fecha,
        c.hora,
        c.motivo,
        v.apellido + ', ' + v.nombre AS veterinario,
        ISNULL(t.descripcion, 'Sin tratamiento') AS tratamiento,
        ISNULL(med.medicamentos, 'N/A') AS medicamentos

    FROM MASCOTA m

    INNER JOIN CONSULTA c
        ON c.id_mascota = m.id_mascota

    INNER JOIN VETERINARIO v
        ON v.id_veterinario = c.id_veterinario

    LEFT JOIN TRATAMIENTO t
        ON t.nro_consulta = c.id_nroConsulta

    OUTER APPLY
    (
        SELECT STRING_AGG(md.nombre, ', ') AS medicamentos
        FROM DETALLE_TRATAMIENTO dt
        INNER JOIN MEDICAMENTO md
            ON md.id_medicamento = dt.id_medicamento
        WHERE dt.id_tratamiento = t.id_tratamiento
    ) med

    WHERE m.id_mascota = @id_mascota

    ORDER BY c.fecha, c.hora;
END;
GO
EXEC dbo.sp_historialClinicoMascota @id_mascota = 1

EXEC dbo.sp_historialClinicoMascota @id_mascota = 4


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
EXEC dbo.sp_consultarProductosCategoria @categoria = 'Alimentos'

EXEC dbo.sp_consultarProductosCategoria @categoria = 'Medicamentos'
GO
