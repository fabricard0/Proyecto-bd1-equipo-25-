-- Comienzo de las funciones transaccion Caso 7 | Registro integral de una venta

USE VETERINARIA;
GO

SET XACT_ABORT ON;
GO

BEGIN TRY
    DECLARE @id_producto INT;
    DECLARE @cantidad_stock INT;
    DECLARE @precio DECIMAL(10,2);
    DECLARE @id_cliente INT;
    DECLARE @id_metodo_pago INT;
    DECLARE @id_venta_nueva INT;
    DECLARE @total DECIMAL(10,2);

    -- Seleccionando un producto que tenga stock
    SELECT TOP (1)
        @id_producto = p.id_producto,
        @cantidad_stock = s.cantidad,
        @precio = p.precio
    FROM dbo.PRODUCTO AS p
    INNER JOIN dbo.STOCK AS s
        ON s.id_producto = p.id_producto
    WHERE s.cantidad >= 1
    ORDER BY p.id_producto;

    SELECT TOP (1) @id_cliente = id_cliente
    FROM dbo.CLIENTE
    ORDER BY id_cliente;

    SELECT TOP (1) @id_metodo_pago = id_metodo_pago
    FROM dbo.METODO_PAGO
    ORDER BY id_metodo_pago;

    IF @id_producto IS NULL
       OR @id_cliente IS NULL
       OR @id_metodo_pago IS NULL
       OR @precio IS NULL
    BEGIN
        THROW 50020,
            'Faltan productos con stock, clientes o metodos de pago para la prueba.',
            1;
    END;

    SET @total = @precio;

    -- Transaccion externa
    BEGIN TRANSACTION;

    INSERT INTO dbo.VENTA (
        descripcion, fecha_hora, monto,
        id_cliente, id_metodo_pago
    )
    VALUES (
        'Prueba Caso 7 - Venta anidada',
        GETDATE(),
        @total,
        @id_cliente,
        @id_metodo_pago
    );

    SET @id_venta_nueva = CONVERT(INT, SCOPE_IDENTITY());

    -- Transaccion interna
    BEGIN TRANSACTION;

    INSERT INTO dbo.DETALLE_VENTA (
        cantidad, precio_unitario, subtotal,
        id_venta, id_producto
    )
    VALUES (
        1, @precio, @total,
        @id_venta_nueva, @id_producto
    );

    -- En el trigger del caso se descuenta una unidad de stock
    COMMIT TRANSACTION;

    -- Confirma la transaccion externa
    COMMIT TRANSACTION;

    SELECT
        @id_venta_nueva AS id_venta_creada,
        @id_producto AS id_producto,
        @total AS monto_total,
        'Venta registrada correctamente' AS resultado;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS numero_error,
        ERROR_MESSAGE() AS mensaje_error,
        'La operacion fue revertida' AS resultado;
END CATCH;
GO

-- Caso de prueba para verificar errores, haciendo que la ultima consulta devuelva 0.
  
USE VETERINARIA;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @id_cliente_error INT;
    DECLARE @id_metodo_error INT;

    SELECT TOP (1) @id_cliente_error = id_cliente
    FROM dbo.CLIENTE
    ORDER BY id_cliente;

    SELECT TOP (1) @id_metodo_error = id_metodo_pago
    FROM dbo.METODO_PAGO
    ORDER BY id_metodo_pago;

    IF @id_cliente_error IS NULL OR @id_metodo_error IS NULL
        THROW 50021, 'No hay cliente o metodo de pago para probar.', 1;

    INSERT INTO dbo.VENTA (
        descripcion, fecha_hora, monto,
        id_cliente, id_metodo_pago
    )
    VALUES (
        'Prueba Caso 7 - Error',
        GETDATE(),
        100,
        @id_cliente_error,
        @id_metodo_error
    );

    -- Provoca un error despues del INSERT
    THROW 50022, 'Corrobora el Error', 1;

    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS numero_error,
        ERROR_MESSAGE() AS mensaje_error,
        'Se ejecuto error' AS resultado;
END CATCH;
GO

-- Verifica que la venta de prueba no se haya guardado
SELECT COUNT(*) AS ventas_que_deben_ser_cero
FROM dbo.VENTA
WHERE descripcion = 'Prueba Caso 7 - Error';
GO

-- Caso 8 | Ingreso de mercadería al inventario

USE VETERINARIA;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @id_producto_ingreso INT;
    DECLARE @id_proveedor_ingreso INT;
    DECLARE @cantidad_ingreso INT = 5;
    DECLARE @precio_compra DECIMAL(10,2) = 1000.00;

    SELECT TOP (1) @id_producto_ingreso = id_producto
    FROM dbo.PRODUCTO
    ORDER BY id_producto;

    SELECT TOP (1) @id_proveedor_ingreso = id_proveedor
    FROM dbo.PROVEEDOR
    ORDER BY id_proveedor;

    IF @id_producto_ingreso IS NULL
       OR @id_proveedor_ingreso IS NULL
    BEGIN
        THROW 50023, 'No hay productos o proveedores para la prueba.', 1;
    END;

    IF @cantidad_ingreso <= 0 OR @precio_compra <= 0
    BEGIN
        THROW 50024, 'La cantidad y el precio deben ser mayores que cero.', 1;
    END;

    -- Registra o actualiza la relacion con el proveedor
    IF EXISTS (
        SELECT 1
        FROM dbo.PRODUCTO_PROVEEDOR
        WHERE id_producto = @id_producto_ingreso
          AND id_proveedor = @id_proveedor_ingreso
    )
    BEGIN
        UPDATE dbo.PRODUCTO_PROVEEDOR
        SET cantidad = cantidad + @cantidad_ingreso,
            precio_compra = @precio_compra
        WHERE id_producto = @id_producto_ingreso
          AND id_proveedor = @id_proveedor_ingreso;
    END
    ELSE
    BEGIN
        INSERT INTO dbo.PRODUCTO_PROVEEDOR (
            id_producto, id_proveedor, precio_compra, cantidad
        )
        VALUES (
            @id_producto_ingreso,
            @id_proveedor_ingreso,
            @precio_compra,
            @cantidad_ingreso
        );
    END;

    -- Actualiza el stock 
    UPDATE dbo.STOCK
    SET cantidad = cantidad + @cantidad_ingreso
    WHERE id_producto = @id_producto_ingreso;

    -- Si el producto no tenia registro de stock, se debe crear
    IF @@ROWCOUNT = 0
    BEGIN
        INSERT INTO dbo.STOCK (id_producto, cantidad)
        VALUES (@id_producto_ingreso, @cantidad_ingreso);
    END;

    COMMIT TRANSACTION;

    SELECT
        @id_producto_ingreso AS id_producto,
        @id_proveedor_ingreso AS id_proveedor,
        @cantidad_ingreso AS unidades_ingresadas,
        'Ingreso registrado correctamente' AS resultado;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS numero_error,
        ERROR_MESSAGE() AS mensaje_error,
        'El ingreso fue revertido' AS resultado;
END CATCH;
GO

-- Caso 9 | Anulación de una venta

USE VETERINARIA;
GO

BEGIN TRY
    BEGIN TRANSACTION;

    DECLARE @id_venta_anular INT;

    SELECT TOP (1) @id_venta_anular = id_venta
    FROM dbo.VENTA
    WHERE descripcion = 'Prueba Caso 7 - Venta anidada'
    ORDER BY id_venta DESC;

    IF @id_venta_anular IS NULL
    BEGIN
        THROW 50025,
            'No se encontro la venta del caso 7. Ejecuta primero ese caso.',
            1;
    END;

    -- Verifica que todos los productos tengan un registro de stock
    IF EXISTS (
        SELECT 1
        FROM dbo.DETALLE_VENTA AS dv
        LEFT JOIN dbo.STOCK AS s
            ON s.id_producto = dv.id_producto
        WHERE dv.id_venta = @id_venta_anular
          AND s.id_producto IS NULL
    )
    BEGIN
        THROW 50026,
            'Falta un registro de stock para uno de los productos.',
            1;
    END;

    -- Devuelve al stock las cantidades de la venta
    UPDATE s
    SET s.cantidad = s.cantidad + dv.cantidad_total
    FROM dbo.STOCK AS s
    INNER JOIN (
        SELECT id_producto, SUM(cantidad) AS cantidad_total
        FROM dbo.DETALLE_VENTA
        WHERE id_venta = @id_venta_anular
        GROUP BY id_producto
    ) AS dv
        ON dv.id_producto = s.id_producto;

    DELETE FROM dbo.DETALLE_VENTA
    WHERE id_venta = @id_venta_anular;

    DELETE FROM dbo.VENTA
    WHERE id_venta = @id_venta_anular;

    -- El trigger de auditoria del caso 11 registra la eliminacion
    COMMIT TRANSACTION;

    SELECT
        @id_venta_anular AS venta_anulada,
        'Venta anulada y stock restablecido correctamente' AS resultado;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0
        ROLLBACK TRANSACTION;

    SELECT
        ERROR_NUMBER() AS numero_error,
        ERROR_MESSAGE() AS mensaje_error,
        'La anulacion fue revertida' AS resultado;
END CATCH;
GO
