--Funcion para saber el total de venta pasando con parametro el id_venta
CREATE FUNCTION dbo.fn_totalVenta(
@id_venta INT
)
RETURNS DECIMAL(10,2)
AS
BEGIN
	DECLARE @total DECIMAL(10,2);
	SELECT @total = SUM(subtotal)
	FROM DETALLE_VENTA
	WHERE id_venta = @id_venta;

	RETURN ISNULL(@total,0);
END;
GO

--SELECT dbo.fn_totalVenta(4) AS totalVenta
  
--Funcion para conocer el sock disponible de un producto pasando como parametro el id_producto
CREATE FUNCTION dbo.fn_stockDisponible
(
	@id_producto INT
)
RETURNS INT
AS
BEGIN
	DECLARE @cantidad INT;
	SELECT @cantidad = cantidad 
	FROM STOCK
	WHERE id_producto = @id_producto;

	RETURN @cantidad;
END;
GO
  
--SELECT dbo.fn_stockDisponible(4) AS STOCK

-- Funcion para conocer el total de dinero que gasto un cliente pasando como parametro el id_cliente  
CREATE FUNCTION dbo.fn_gastoTotalCliente
(
	@id_cliente INT 
)
RETURNS DECIMAL(10,2)
AS 
BEGIN 
	DECLARE @total DECIMAL(10,2);

	SELECT @total = SUM(v.monto)
	FROM VENTA v
	WHERE v.id_cliente = @id_cliente;

	RETURN ISNULL(@total,0);
END;
GO

--SELECT dbo.fn_gastoTotalCliente(5) as gastoTotal

--Funcion que devuelve una tabla con las consultas que tuvo una mascota pasando como parametro el id_mascota

CREATE FUNCTION dbo.fn_consultasMascota
(
	@id_mascota INT 
)
RETURNS TABLE 
AS 
RETURN
(
	SELECT fecha,hora, motivo
	FROM CONSULTA
	WHERE id_mascota = @id_mascota
);
GO

--SELECT * FROM dbo.fn_consultasMascota(1)
--GO
