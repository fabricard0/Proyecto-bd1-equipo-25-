 <div align="center">

# 🗄️ Proyecto BD1 — Equipo 25

# 🐾 Sistema de Gestión para Veterinaria

</div>


UNNE - Base de Datos I · Proyecto Integrador 2026 · Equipo 25

---

## 🩺 Presentación y contexto

El proyecto consiste en el diseño e implementación de una base de datos relacional para un sistema de gestión de una veterinaria.

La propuesta surge de la necesidad de centralizar y organizar la información relacionada con las actividades del establecimiento, incluyendo la atención de mascotas, el seguimiento de consultas, la administración de tratamientos y la comercialización de productos veterinarios.

El sistema contempla dos áreas principales:

* **Atención veterinaria:** registro de clientes y mascotas, consultas médicas, veterinarios, especialidades y tratamientos indicados.
* **Gestión comercial:** administración de productos, medicamentos, proveedores, stock, ventas y métodos de pago.

La base de datos permitirá relacionar la información de estas áreas, facilitando el acceso a los registros y contribuyendo a mantener la integridad y consistencia de los datos.

---

## ⚠️ Problemática

La administración de una veterinaria requiere gestionar información de distinta naturaleza que se encuentra relacionada entre sí. Por ejemplo, una mascota pertenece a un cliente, puede asistir a múltiples consultas y recibir diferentes tratamientos. Asimismo, el establecimiento necesita controlar los productos disponibles, los proveedores y las ventas realizadas.

Si esta información se registra de forma desorganizada o mediante sistemas independientes, pueden aparecer dificultades para consultar el historial clínico de una mascota, identificar los tratamientos realizados, verificar las existencias de productos y analizar las operaciones comerciales.

### Solución propuesta

Se propone desarrollar una base de datos relacional que permita centralizar la información del establecimiento y establecer relaciones entre las entidades que intervienen en sus actividades.

La solución contempla:

* Registrar clientes y las mascotas asociadas a ellos.
* Administrar veterinarios y sus especialidades.
* Registrar consultas y tratamientos realizados a las mascotas.
* Gestionar medicamentos y productos comercializados.
* Mantener información sobre proveedores y abastecimiento.
* Controlar las existencias de productos mediante registros de stock.
* Registrar ventas, sus respectivos detalles y los métodos de pago utilizados.
* Conservar los precios unitarios aplicados en cada detalle de venta para mantener el historial de las operaciones.

---

## 🎯 Alcance del sistema

Algunas de las areas que contempla el sistema son las siguientes:

| Área                    | Funcionalidad                                                                           |
| ----------------------- | --------------------------------------------------------------------------------------- |
| Clientes                | Registro de datos personales y de contacto de los clientes.                             |
| Mascotas                | Administración de mascotas y asociación con sus propietarios.                           |
| Veterinarios            | Registro de profesionales y sus datos de contacto.                                      |
| Especialidades          | Clasificación de las especialidades veterinarias.                                       |
| Consultas               | Registro de las consultas realizadas a las mascotas y del veterinario interviniente.    |
| Tratamientos            | Registro de tratamientos asociados a las consultas.                                     |
| Medicamentos            | Administración de medicamentos, sus características y su vinculación con los productos. |
| Productos               | Registro y clasificación de los productos comercializados.                              |

se detallan de forma mas completa en: [alcance.md](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-01/alcance.md)

---

## 🎯 Objetivos generales

1. Diseñar una base de datos relacional que represente adecuadamente el funcionamiento de una veterinaria.
2. Identificar las entidades, los atributos y las relaciones necesarias para representar las actividades del establecimiento.
3. Construir el Diagrama Entidad-Relación (DER), definiendo las cardinalidades y restricciones correspondientes.
4. Transformar el modelo conceptual en un modelo relacional.
5. Normalizar las tablas hasta la Tercera Forma Normal (3FN), evitando redundancias y dependencias funcionales incorrectas.
6. Implementar físicamente la base de datos mediante scripts SQL.
7. Definir claves primarias, claves foráneas, restricciones `CHECK`, restricciones `UNIQUE` y valores predeterminados cuando corresponda.
8. Incorporar datos de prueba coherentes con las relaciones y reglas de negocio.
9. Desarrollar consultas SQL para obtener información clínica y comercial relevante.
10. Documentar las decisiones de diseño, las restricciones de integridad y los casos de uso implementados.

---

## 📋 Reglas de negocio principales

El funcionamiento de la base de datos se encuentra condicionado por reglas que buscan garantizar la coherencia de la información.

Entre las principales se encuentran:

* **Identificación de clientes:** cada cliente posee un identificador único.
* **Relación cliente-mascota:** cada mascota se encuentra asociada a un cliente.
* **Identificación de veterinarios:** cada veterinario posee un identificador propio.
* **Relación entre veterinarios y especialidades:** un veterinario puede tener varias especialidades y una especialidad puede corresponder a varios veterinarios.
* **Registro de consultas:** cada consulta se encuentra asociada a una mascota y a un veterinario.
* **Relación entre consultas y tratamientos:** los tratamientos se registran vinculados a la consulta correspondiente.



---

## 📚 Documentación

La documentación se organiza dentro de la carpeta `docs/`, separada por etapas para facilitar la consulta de los entregables.

### Etapa 01 — Análisis del problema y reglas de negocio

Comprende la descripción del caso, la identificación de las necesidades del establecimiento y la definición de las reglas que orientan el diseño de la base de datos.

| Documento                                                                                                                  | Descripción                                                                         |
| -------------------------------------------------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------- |
| [`alcance.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-01/alcance.md)                   | Define las funcionalidades, los límites y los procesos contemplados por el sistema. |
| [`descripcion-caso.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-01/descripcion-caso.md) | Describe la problemática, el contexto y las necesidades de la veterinaria.          |
| [`reglas_negocio.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-01/reglas_negocio.md)     | Establece las reglas y condiciones que rigen el funcionamiento del sistema.         |




### Etapa 02 — Modelado conceptual y lógico

Comprende el diseño del modelo conceptual, su transformación al modelo relacional y la documentación de las decisiones adoptadas.

| Documento                                                    | Descripción                                                                            |
| ------------------------------------------------------------ | -------------------------------------------------------------------------------------- |
| [`modelo-relacional.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-02/modelo-relacional.md) | Representación de las entidades, atributos, claves y relaciones del modelo relacional. |
| [`normalizacion.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-02/normalizacion.md)       | Análisis de la normalización del esquema hasta la Tercera Forma Normal (3FN).          |
| [`decisiones-diseño.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-02/decisiones-diseño.md)| Justificación de las principales decisiones de diseño.                                 |
| [`der/`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-02/der)                                 | Recursos del Diagrama Entidad-Relación.                                                |


### Etapa 03 — Implementación física

Corresponde a la creación de la base de datos, las tablas, las restricciones de integridad y la incorporación de registros de prueba.

| Documento                                                                  | Descripción                                                          |
| -------------------------------------------------------------------------- | -------------------------------------------------------------------- |
| [`implementacion.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-03/implementacion.md)                  | Descripción de la implementación física de la base de datos.         |
| [`restricciones_integridad.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-03/restricciones-integridad.md) | Documentación de las restricciones y mecanismos de integridad.       |
| [`pruebas-validacion.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-03/pruebas-validacion.md)             | Registro de las pruebas realizadas para verificar la implementación. |

### Etapa 04 — Consultas y casos de uso

Esta etapa comprende el desarrollo de consultas SQL orientadas a resolver necesidades concretas de información de la veterinaria.

Se incluyen consultas para la emisión de comprobantes de venta, la elaboración de informes comerciales y el análisis de información clínica mediante combinaciones de tablas, agrupamientos y funciones de agregación.

| Documento                                                        | Descripción                                                       |
| ---------------------------------------------------------------- | ----------------------------------------------------------------- |
| [`casos-uso.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/casos-uso.md)                     | Índice y descripción de los casos de uso implementados.           |
| [`comprobante_venta.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/comprobante_venta.md)     | Documentación de la consulta de comprobantes de venta.            |
| [`informe_venta.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-04/informe_venta.md)             | Documentación del informe de ventas por categoría y período.      |
| [`consultas_avanzadas.md`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/docs/etapa-02/consultas_avanzadas.md) | Documentación de consultas avanzadas sobre ventas y tratamientos. |

Los scripts SQL correspondientes se encuentran en [`sql/consultas/`](https://github.com/fabricard0/Proyecto-bd1-equipo-25-/blob/main/sql/consultas/).

---

## 🗂️ Estructura del repositorio

La siguiente estructura es una referencia de organización para los archivos del proyecto. Los nombres deben coincidir con los archivos que efectivamente existan en el repositorio.

```text
Proyecto-bd1-equipo-25-/
│
├── 📄README.md
│
├── 📁docs/
│   ├── etapa-01/
│   │   ├── 📄alcance.md
│   │   ├── 📄descripcion-caso.md
│   │   └── 📄reglas-negocio.md
│   │
│   ├── 📁etapa-02/
│   │   ├── 📁der/
│   │   ├── 📄modelo-relacional.md
│   │   ├── 📄normalizacion.md
│   │   └── 📄decisiones-diseño.md
│   │
│   ├── 📁etapa-03/
│   │   ├── 📄implementacion.md
│   │   ├── 📄restricciones_integridad.md
│   │   └── 📄pruebas-validacion.md
│   │
│   └── 📁etapa-04/
│       ├── 📄casos-uso.md
│       ├── 📄comprobante_venta.md
│       ├── 📄informe_venta.md
│       └── 📄consultas_avanzadas.md
│
└── 📁sql/
    ├── 📁ddl/
    │   └── 📄crear_bd.sql
    │
    ├── 📁dml/
    │   └── 📄datos_prueba.sql
    │
    ├── 📁consultas/
    │   ├── 📄comprobante_venta.sql
    │   ├── 📄informe_venta.sql
    │   └── 📄consulta_avanzada.sql
    │
    └── 📁tecnico/procedimientos
        ├── 📄procedimientos_funciones.md
        ├── 📄transacciones.md
        ├── 📄triggers_auditoria.md
        ├── 📄seguridad.md
        └── 📄indices_optimizacion.md

```

---

## ⚙️ Tecnologías utilizadas

* **Sistema gestor de bases de datos:** Microsoft SQL Server.
* **Entorno de administración:** SQL Server Management Studio (SSMS).
* **Lenguaje de definición y manipulación de datos:** SQL (DDL y DML).
* **Documentación:** Markdown.
* **Control de versiones y colaboración:** Git y GitHub.

---

## ▶️ Ejecución del proyecto

Para implementar la base de datos en SQL Server, se recomienda seguir este orden:

1. Abrir SQL Server Management Studio y conectarse a la instancia correspondiente.
2. Ejecutar el script de creación de la base de datos y las tablas ubicado en `sql/ddl/`.
3. Ejecutar el script de poblado inicial ubicado en `sql/dml/`.
4. Comprobar que los datos se hayan insertado correctamente y que las relaciones entre las tablas sean consistentes.
5. Ejecutar los scripts ubicados en `sql/consultas/` para verificar los resultados de los casos de uso documentados.

Se recomienda ejecutar cada etapa por separado y comprobar los resultados antes de continuar con la siguiente.

---

## 👥 Equipo de trabajo

**Equipo 25 — Base de Datos I**
Proyecto Integrador 2026.

* **Caseres Lautaro**
* **Gauto Gimena**
* **Cardozo Fabricio**
* **Rojas Camila**

Las contribuciones individuales de cada integrante pueden consultarse en la documentación de entregas (manifiestos individuales) y en el historial de cambios del repositorio.

---

## 📝 Conclusión

El proyecto permite aplicar los conceptos fundamentales de Base de Datos I mediante el análisis, modelado, normalización e implementación de una base de datos relacional para una veterinaria.

La estructura propuesta busca garantizar la integridad de los datos y facilitar la gestión de clientes, mascotas, consultas, tratamientos, productos, proveedores y ventas. Asimismo, las consultas SQL permiten obtener información útil para el seguimiento de la actividad clínica y el análisis comercial del establecimiento.
