# Pruebas y validación de la implementación física

**Etapa:** III

**Fecha de validación:** 2026-09-30



Las pruebas se orientaron a verificar el registro de clientes, mascotas, veterinarios, consultas, tratamientos, productos, medicamentos, ventas y proveedores, las restricciones que fuimos agregando al DDL y de también verificar las reglas de negocio con las que cuenta nuestra base de datos.

## Pruebas ejecutadas

| **Prueba**                                                                                   | **Resultado**                                                                                                      |
| -------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Creación de las tablas y carga de datos de prueba en SQL Server                              | Aprobado: las tablas se crearon correctamente y los datos de prueba se cargaron en el sistema.                     |
| Asociacion entre clientes y mascotas                                             | Aprobado: las mascotas están asociadas a clientes registrados.                                                     |
| Asociación entre tratamientos y consultas veterinarias                                       | Aprobado: los tratamientos están asociados a las consultas correspondientes.                                       |
| Asociacion entre ventas y clientes                                               | Aprobado: las ventas están asociadas a clientes registrados.                                                       |
| Consistencia entre el subtotal de cada detalle de venta y la cantidad por el precio unitario | Aprobado: los subtotales coinciden con los importes calculados a partir de las cantidades y los precios unitarios. |
| Consistencia entre el importe total de una venta y la suma de sus detalles                   | Aprobado: los importes totales coinciden con la suma de los subtotales de los productos vendidos.                  |
| Rechazo de un precio de venta menor o igual a cero                                           | Aprobado: la restricción correspondiente impide registrar precios inválidos.                                       |
| Rechazo de una cantidad de stock negativa                                                    | Aprobado: la restricción `CHECK` impide registrar cantidades negativas.                                            |

## Conclusión

Las pruebas de validación permitieron comprobar la estructura de la base de datos y el cumplimiento de las reglas de negocio relacionadas con el registro de clientes, mascotas, consultas, tratamientos, productos, medicamentos, ventas y proveedores.
Asimismo, se verificaron las relaciones entre las entidades y las restricciones destinadas a mantener la integridad y consistencia de los datos, incluyendo el cálculo de subtotales y totales de venta y el control de precios y cantidades de stock.




