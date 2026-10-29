## Transacciones

Para esta etapa se implementaron transacciones para garantizar que las operaciones relacionadas con las ventas y el control de stock se realicen correctamente. De esta manera, si ocurre un error durante una operación, se pueden deshacer los cambios realizados y mantener la información de la base de datos consistente.

### 7. Registro de una venta

Se implementó una transacción que permite registrar una venta junto con sus respectivos detalles y actualizar el stock de los productos vendidos.

La operación incluye el registro de los datos de la venta y de los productos que la componen. Si ocurre un error durante el proceso o no hay stock suficiente, la transacción se revierte para evitar que queden datos incompletos.

### 8. Ingreso de mercadería de un proveedor

Se desarrolló una transacción para registrar el ingreso de mercadería proveniente de un proveedor y actualizar las cantidades correspondientes en el inventario.

Esta operación permite registrar la relación entre el producto y su proveedor, incluyendo la cantidad ingresada y el precio de compra. Si ocurre algún inconveniente, los cambios se revierten para mantener la consistencia de los datos.

### 9. Anulación de una venta

Se implementó una transacción que permite anular una venta registrada y restablecer las cantidades de los productos que se habían descontado del stock.

Para ello, se recuperan los productos y las cantidades correspondientes a la venta seleccionada. Luego se eliminan los detalles y el registro de la venta, y se devuelve al inventario la mercadería asociada. Si ocurre un error, se revierten los cambios realizados.

## Motivo de la implementación

