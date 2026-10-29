--Funciones striggers Caso 10 | Actualización automática del stock
USE VETERINARIA;
GO

CREATE OR ALTER TRIGGER dbo.tr_actualizarStockVenta
ON dbo.DETALLE_VENTA
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Verifica que exista stock suficiente para todos los productos
    IF EXISTS (
        SELECT 1
        FROM (
            SELECT id_producto, SUM(cantidad) AS cantidad_vendida
            FROM inserted
            GROUP BY id_producto
        ) AS i
        LEFT JOIN dbo.STOCK AS s
            ON s.id_producto = i.id_producto
        WHERE s.id_producto IS NULL
           OR s.cantidad < i.cantidad_vendida
    )
    BEGIN
        THROW 50001,
            'No hay stock suficiente o falta el registro de stock del producto.',
            1;
    END;

    -- Descuenta las unidades vendidas
    UPDATE s
    SET s.cantidad = s.cantidad - i.cantidad_vendida
    FROM dbo.STOCK AS s
    INNER JOIN (
        SELECT id_producto, SUM(cantidad) AS cantidad_vendida
        FROM inserted
        GROUP BY id_producto
    ) AS i
        ON i.id_producto = s.id_producto;
END;

--Prueba para el strigger Caso 10 | Se probara vender mas unidades de las disponibles en el sistema de stock, mostrara un mensaje que impida realizar esta venta dado insuficiencia de stock.

USE VETERINARIA;
GO

BEGIN TRY
    DECLARE @id_producto_prueba INT;
    DECLARE @stock_actual INT;
    DECLARE @precio_prueba DECIMAL(10,2);
    DECLARE @id_cliente_prueba INT;
    DECLARE @id_pago_prueba INT;
    DECLARE @id_venta_prueba INT;
    DECLARE @cantidad_excesiva INT;

    SELECT TOP (1)
        @id_producto_prueba = p.id_producto,
        @stock_actual = s.cantidad,
        @precio_prueba = p.precio
    FROM dbo.PRODUCTO AS p
    INNER JOIN dbo.STOCK AS s
        ON s.id_producto = p.id_producto
    WHERE s.cantidad >= 0
    ORDER BY p.id_producto;

    SELECT TOP (1) @id_cliente_prueba = id_cliente
    FROM dbo.CLIENTE
    ORDER BY id_cliente;

    SELECT TOP (1) @id_pago_prueba = id_metodo_pago
    FROM dbo.METODO_PAGO
    ORDER BY id_metodo_pago;

    IF @id_producto_prueba IS NULL
       OR @id_cliente_prueba IS NULL
       OR @id_pago_prueba IS NULL
       OR @precio_prueba IS NULL
    BEGIN
        THROW 50030, 'No hay datos suficientes para la prueba.', 1;
    END;

    SET @cantidad_excesiva = @stock_actual + 1;

    BEGIN TRANSACTION;

    INSERT INTO dbo.VENTA (
        descripcion, fecha_hora, monto,
        id_cliente, id_metodo_pago
    )
    VALUES (
        'Prueba Caso 10 - Stock insuficiente',
        GETDATE(),
        @precio_prueba * @cantidad_excesiva,
        @id_cliente_prueba,
        @id_pago_prueba
    );

    SET @id_venta_prueba = CONVERT(INT, SCOPE_IDENTITY());

    -- El trigger va a rechazar este detalle
    INSERT INTO dbo.DETALLE_VENTA (
        cantidad, precio_unitario, subtotal,
        id_venta, id_producto
    )
    VALUES (
        @cantidad_excesiva,
        @precio_prueba,
        @precio_prueba * @cantidad_excesiva,
        @id_venta_prueba,
        @id_producto_prueba
    );

    COMMIT TRANSACTION;

    SELECT 'ERROR: se permitio una venta sin stock suficiente' AS resultado;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_MESSAGE() AS mensaje,
        'Se rechazo la operacion' AS resultado;
END CATCH;
GO

-- La venta de prueba queda en cero registros
SELECT COUNT(*) AS ventas_que_deben_ser_cero
FROM dbo.VENTA
WHERE descripcion = 'Prueba Caso 10 - Stock insuficiente';
GO

-- Caso 11 | Auditoría de cambios de precios, se creara una tabla auxiliar realizada en json para poder operar mejor los triggers antes al mismo.

USE VETERINARIA;
GO

IF OBJECT_ID('dbo.AUDITORIA_OPERACIONES', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.AUDITORIA_OPERACIONES (
        id_auditoria INT IDENTITY(1,1) PRIMARY KEY,
        tabla_afectada VARCHAR(50) NOT NULL,
        operacion VARCHAR(10) NOT NULL,
        id_registro INT NOT NULL,
        valores_anteriores NVARCHAR(MAX) NULL,
        valores_nuevos NVARCHAR(MAX) NULL,
        fecha_hora DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
        usuario_bd NVARCHAR(128) NOT NULL
    );
END;
GO

CREATE OR ALTER TRIGGER dbo.tr_auditoriaProducto
ON dbo.PRODUCTO
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AUDITORIA_OPERACIONES (
        tabla_afectada,
        operacion,
        id_registro,
        valores_anteriores,
        valores_nuevos,
        fecha_hora,
        usuario_bd
    )
    SELECT
        'PRODUCTO',
        'UPDATE',
        d.id_producto,
        (SELECT d.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
        (SELECT i.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
        SYSDATETIME(),
        SUSER_SNAME()
    FROM deleted AS d
    INNER JOIN inserted AS i
        ON i.id_producto = d.id_producto;
END;
GO

-- Este segundo trigger se encargara de registrar las ventas eliminadas, conservando sus datos.

CREATE OR ALTER TRIGGER dbo.tr_auditoriaEliminarVenta
ON dbo.VENTA
AFTER DELETE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.AUDITORIA_OPERACIONES (
        tabla_afectada,
        operacion,
        id_registro,
        valores_anteriores,
        valores_nuevos,
        fecha_hora,
        usuario_bd
    )
    SELECT
        'VENTA',
        'DELETE',
        d.id_venta,
        (SELECT d.* FOR JSON PATH, WITHOUT_ARRAY_WRAPPER),
        NULL,
        SYSDATETIME(),
        SUSER_SNAME()
    FROM deleted AS d;
END;
GO

-- Muestra del Prueba del Caso 11 | Se busca que aumente el precio de un producto luego lo vuelva nuevamente a su original. Esto se mostrara en el registro de auditoria.

  USE VETERINARIA;
GO

DECLARE @id_producto_auditoria INT;
DECLARE @precio_original DECIMAL(10,2);

SELECT TOP (1)
    @id_producto_auditoria = id_producto,
    @precio_original = precio
FROM dbo.PRODUCTO
ORDER BY id_producto;

IF @id_producto_auditoria IS NULL OR @precio_original IS NULL
BEGIN
    THROW 50031, 'No hay productos disponibles para la prueba.', 1;
END;

-- Primera modificacion
UPDATE dbo.PRODUCTO
SET precio = @precio_original + 1.00
WHERE id_producto = @id_producto_auditoria;

-- Restaura el precio original
UPDATE dbo.PRODUCTO
SET precio = @precio_original
WHERE id_producto = @id_producto_auditoria;
GO

-- Consulta los registros de auditoria
SELECT TOP (10)
    id_auditoria,
    tabla_afectada,
    operacion,
    id_registro,
    valores_anteriores,
    valores_nuevos,
    fecha_hora,
    usuario_bd
FROM dbo.AUDITORIA_OPERACIONES
WHERE tabla_afectada = 'PRODUCTO'
  AND operacion = 'UPDATE'
ORDER BY id_auditoria DESC;
GO

-- Caso 12 | Control de eliminación de productos.

 CREATE OR ALTER TRIGGER dbo.tr_controlEliminarProducto
ON dbo.PRODUCTO
INSTEAD OF DELETE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1
        FROM dbo.DETALLE_VENTA AS dv
        INNER JOIN deleted AS d
            ON d.id_producto = dv.id_producto
    )
    BEGIN
        THROW 50012,
            'No se puede eliminar un producto que tenga ventas registradas.',
            1;
    END;

    IF EXISTS (
        SELECT 1
        FROM dbo.PRODUCTO_PROVEEDOR AS pp
        INNER JOIN deleted AS d
            ON d.id_producto = pp.id_producto
    )
    BEGIN
        THROW 50013,
            'No se puede eliminar un producto asociado a un proveedor.',
            1;
    END;

    IF EXISTS (
        SELECT 1
        FROM dbo.MEDICAMENTO AS m
        INNER JOIN deleted AS d
            ON d.id_producto = m.id_producto
    )
    BEGIN
        THROW 50014,
            'No se puede eliminar un producto asociado a un medicamento.',
            1;
    END;

    IF EXISTS (
        SELECT 1
        FROM dbo.STOCK AS s
        INNER JOIN deleted AS d
            ON d.id_producto = s.id_producto
        WHERE s.cantidad > 0
    )
    BEGIN
        THROW 50015,
            'No se puede eliminar un producto con stock disponible.',
            1;
    END;

    -- Elimina el stock que exista sin unidades antes del producto.
    DELETE s
    FROM dbo.STOCK AS s
    INNER JOIN deleted AS d
        ON d.id_producto = s.id_producto;

    DELETE p
    FROM dbo.PRODUCTO AS p
    INNER JOIN deleted AS d
        ON d.id_producto = p.id_producto;
END;
GO

-- Muestra de Prueba del caso 12 | Se borrara un producto asociado para verificar que el strigger bloquee esta operacion.

USE VETERINARIA;
GO

DECLARE @id_producto_eliminar INT;

SELECT TOP (1) @id_producto_eliminar = p.id_producto
FROM dbo.PRODUCTO AS p
WHERE EXISTS (
    SELECT 1
    FROM dbo.DETALLE_VENTA AS dv
    WHERE dv.id_producto = p.id_producto
)
OR EXISTS (
    SELECT 1
    FROM dbo.PRODUCTO_PROVEEDOR AS pp
    WHERE pp.id_producto = p.id_producto
)
OR EXISTS (
    SELECT 1
    FROM dbo.MEDICAMENTO AS m
    WHERE m.id_producto = p.id_producto
)
OR EXISTS (
    SELECT 1
    FROM dbo.STOCK AS s
    WHERE s.id_producto = p.id_producto
      AND s.cantidad > 0
)
ORDER BY p.id_producto;

IF @id_producto_eliminar IS NULL
BEGIN
    SELECT 'No hay un producto relacionado disponible para esta prueba.'
        AS resultado;
END
ELSE
BEGIN
    BEGIN TRY
        DELETE FROM dbo.PRODUCTO
        WHERE id_producto = @id_producto_eliminar;

        SELECT 'ERROR: se permitio eliminar el producto'
            AS resultado;
    END TRY
    BEGIN CATCH
        SELECT
            ERROR_MESSAGE() AS mensaje,
            'El trigger bloqueo la eliminacion' AS resultado;
    END CATCH;

    -- Verifica que el producto siga existiendo
    SELECT
        id_producto,
        nombre,
        'El producto debe seguir existiendo' AS comprobacion
    FROM dbo.PRODUCTO
    WHERE id_producto = @id_producto_eliminar;
END;
GO
GO
