{
  "diagramType": 2,
  "data": {
    "nodes": [
      {
        "id": "c40b9747-de49-4347-9b2c-df35965b4cd2",
        "type": "Table",
        "position": {
          "x": 678.915527546031,
          "y": 25.782091901629073
        },
        "data": {
          "label": "CLIENTE",
          "isConnectable": false,
          "columns": [
            {
              "id": "f79766ca-87b1-4c8f-9786-b30927a5aeb4",
              "name": "telefono",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "1f0c8409-8a7d-4715-b247-ae46ac386183",
              "name": "id_cliente",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "8d6e880b-3f56-48ce-b9f4-8e9d4ddb2da4",
              "name": "dirrecion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "018ddd69-975c-4e70-8e92-adeac39cfbc2",
              "name": "apellido",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "8812bdef-76c0-40ce-a32e-79ee482cf391",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "6241c035-53e9-4605-b39d-af84e9fd149e",
              "name": "email",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 173
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "98499678-71a5-498b-a9d5-019e8bfc576f",
        "type": "Table",
        "position": {
          "x": 67.5687000803953,
          "y": 478.41440026587844
        },
        "data": {
          "label": "VETERINARIO",
          "isConnectable": false,
          "columns": [
            {
              "id": "05184cdd-67e0-4fee-b44b-a03092863cac",
              "name": "id_veterinario",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "120128eb-eeab-4ddb-8df4-3c6a411ea476",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "5ddfe30d-8d03-4669-a0a4-ef75ddc135e1",
              "name": "dirrecion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "43fe0517-d9b9-4c21-ac27-0307cddcf174",
              "name": "apelido",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "68581a1d-4950-4ed6-a05e-b1d53f5eb573",
              "name": "telefono",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "0c8e565f-8288-4133-8444-03227f8c5cc0",
              "name": "email",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 173
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "type": "Table",
        "position": {
          "x": 1605.390517822772,
          "y": 287.73973025168647
        },
        "data": {
          "label": "PRODUCTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "b980bbfa-b51c-4a17-8851-98e2a45f4e28",
              "name": "categoria",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "9e682f57-740b-4b16-810d-3ed3e51c3f6b",
              "name": "id_producto",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "1c3cedbc-2314-41ea-94bc-625c83edfff5",
              "name": "precio",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "1e3c855c-6336-49e7-9d9e-94db2f0b8192",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "type": "Table",
        "position": {
          "x": 981.325886979932,
          "y": 263.99680756191816
        },
        "data": {
          "label": "VENTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "8cd594e0-b862-4641-9007-8363dc39d694",
              "name": "id_venta",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false,
              "position": 0
            },
            {
              "id": "f331290c-6a91-4296-aef9-6a41c540ea08",
              "name": "descrpcion",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 1
            },
            {
              "id": "541665a3-a20b-4f14-bf83-c69e75fcf9ab",
              "name": "fecha_hora",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 2
            },
            {
              "id": "22c3d92a-b625-41fb-aa79-ab022948be48",
              "name": "monto",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 3
            },
            {
              "id": "fk_d64fa6b9-7dea-4439-8f3f-8e012c105834",
              "name": "fk_CLIENTE",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "a7bb2d7d-6289-4af8-8eb7-9c4cbab12715",
                "sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",
                "columns": [
                  {
                    "id": "fk_1f0c8409-8a7d-4715-b247-ae46ac386183",
                    "name": "id_cliente",
                    "type": "INT"
                  }
                ]
              },
              "position": 4
            },
            {
              "id": "fk_ed011aef-f9cb-47a2-b3d8-7d7b7dce6057",
              "name": "fk_METODOPAGO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "763ff208-f680-4345-b3db-ba9bea0daf9b",
                "sourceTableId": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
                "columns": [
                  {
                    "id": "fk_231b7e62-d566-41c1-b582-30966cf754bc",
                    "name": "id_metodo_pago",
                    "type": "INT"
                  }
                ]
              },
              "position": 5
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 174
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
        "type": "Table",
        "position": {
          "x": 979.8578214077004,
          "y": 455.11262428309504
        },
        "data": {
          "label": "METODOPAGO",
          "isConnectable": false,
          "columns": [
            {
              "id": "fb2bc1dd-35b9-402d-9a4c-f9ac525365d6",
              "name": "tipo_nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "231b7e62-d566-41c1-b582-30966cf754bc",
              "name": "id_metodo_pago",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": true,
              "isOptional": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 75
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
        "type": "Table",
        "position": {
          "x": -236.84651411782,
          "y": 76.38904167628148
        },
"selected": false,
"dragging": false
},
"data": {

"label": "TRATAMIENTO",

"isConnectable": false,

"columns": [

{

"id": "a4dc2a54-c883-4c74-9870-e6fca21a2bc9",

"name": "descripcion",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "1084c1e6-3c07-40d8-90fd-75469ded1ea3",

"name": "tipo\_tratamiento",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "37a051f0-6886-439e-89fd-f84d5752e9ca",

"name": "sintomas",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "284313f3-06d3-41ef-82cd-af01a2c6c2c2",

"name": "duracion\_tratamiento",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "5bc774a9-ab01-4499-9e2e-59470f3435bb",

"name": "id\_tratamiento",

"type": "INT",

"position": 0,

"isPrimaryKey": true,

"isOptional": false

},

{
  "diagramType": 2,
  "data": {
    "nodes": [
      {
        "id": "c40b9747-de49-4347-9b2c-df35965b4cd2",
        "type": "Table",
        "position": {
          "x": 678.915527546031,
          "y": 25.782091901629073
        },
        "data": {
          "label": "CLIENTE",
          "isConnectable": false,
          "columns": [
            {
              "id": "f79766ca-87b1-4c8f-9786-b30927a5aeb4",
              "name": "telefono",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "1f0c8409-8a7d-4715-b247-ae46ac386183",
              "name": "id_cliente",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "8d6e880b-3f56-48ce-b9f4-8e9d4ddb2da4",
              "name": "dirrecion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "018ddd69-975c-4e70-8e92-adeac39cfbc2",
              "name": "apellido",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "8812bdef-76c0-40ce-a32e-79ee482cf391",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "6241c035-53e9-4605-b39d-af84e9fd149e",
              "name": "email",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 173
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "98499678-71a5-498b-a9d5-019e8bfc576f",
        "type": "Table",
        "position": {
          "x": 67.5687000803953,
          "y": 478.41440026587844
        },
        "data": {
          "label": "VETERINARIO",
          "isConnectable": false,
          "columns": [
            {
              "id": "05184cdd-67e0-4fee-b44b-a03092863cac",
              "name": "id_veterinario",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "120128eb-eeab-4ddb-8df4-3c6a411ea476",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "5ddfe30d-8d03-4669-a0a4-ef75ddc135e1",
              "name": "dirrecion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "43fe0517-d9b9-4c21-ac27-0307cddcf174",
              "name": "apelido",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "68581a1d-4950-4ed6-a05e-b1d53f5eb573",
              "name": "telefono",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "0c8e565f-8288-4133-8444-03227f8c5cc0",
              "name": "email",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 173
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "type": "Table",
        "position": {
          "x": 1605.390517822772,
          "y": 287.73973025168647
        },
        "data": {
          "label": "PRODUCTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "b980bbfa-b51c-4a17-8851-98e2a45f4e28",
              "name": "categoria",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "9e682f57-740b-4b16-810d-3ed3e51c3f6b",
              "name": "id_producto",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "1c3cedbc-2314-41ea-94bc-625c83edfff5",
              "name": "precio",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "1e3c855c-6336-49e7-9d9e-94db2f0b8192",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "type": "Table",
        "position": {
          "x": 981.325886979932,
          "y": 263.99680756191816
        },
        "data": {
          "label": "VENTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "8cd594e0-b862-4641-9007-8363dc39d694",
              "name": "id_venta",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false,
              "position": 0
            },
            {
              "id": "f331290c-6a91-4296-aef9-6a41c540ea08",
              "name": "descrpcion",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 1
            },
            {
              "id": "541665a3-a20b-4f14-bf83-c69e75fcf9ab",
              "name": "fecha_hora",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 2
            },
            {
              "id": "22c3d92a-b625-41fb-aa79-ab022948be48",
              "name": "monto",
              "type": "INT",
              "isPrimaryKey": false,
              "position": 3
            },
            {
              "id": "fk_d64fa6b9-7dea-4439-8f3f-8e012c105834",
              "name": "fk_CLIENTE",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "a7bb2d7d-6289-4af8-8eb7-9c4cbab12715",
                "sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",
                "columns": [
                  {
                    "id": "fk_1f0c8409-8a7d-4715-b247-ae46ac386183",
                    "name": "id_cliente",
                    "type": "INT"
                  }
                ]
              },
              "position": 4
            },
            {
              "id": "fk_ed011aef-f9cb-47a2-b3d8-7d7b7dce6057",
              "name": "fk_METODOPAGO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "763ff208-f680-4345-b3db-ba9bea0daf9b",
                "sourceTableId": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
                "columns": [
                  {
                    "id": "fk_231b7e62-d566-41c1-b582-30966cf754bc",
                    "name": "id_metodo_pago",
                    "type": "INT"
                  }
                ]
              },
              "position": 5
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 174
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
        "type": "Table",
        "position": {
          "x": 979.8578214077004,
          "y": 455.11262428309504
        },
        "data": {
          "label": "METODOPAGO",
          "isConnectable": false,
          "columns": [
            {
              "id": "fb2bc1dd-35b9-402d-9a4c-f9ac525365d6",
              "name": "tipo_nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "231b7e62-d566-41c1-b582-30966cf754bc",
              "name": "id_metodo_pago",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": true,
              "isOptional": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 75
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
        "type": "Table",
        "position": {
          "x": -236.84651411782,
          "y": 76.38904167628148
        },
        "data": {
          "label": "TRATAMIENTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "a4dc2a54-c883-4c74-9870-e6fca21a2bc9",
              "name": "descripcion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "1084c1e6-3c07-40d8-90fd-75469ded1ea3",
              "name": "tipo_tratamiento",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "37a051f0-6886-439e-89fd-f84d5752e9ca",
              "name": "sintomas",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "284313f3-06d3-41ef-82cd-af01a2c6c2c2",
              "name": "duracion_tratamiento",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "5bc774a9-ab01-4499-9e2e-59470f3435bb",
              "name": "id_tratamiento",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "fk_f7034578-e360-4bdf-8e16-71c91739fb78",
              "name": "fk_CONSULTA",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "fdde9089-8cd8-4053-a761-6637f6c49e4c",
                "sourceTableId": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
                "columns": [
                  {
                    "id": "fk_334b761b-9780-49e0-a69c-34b08abb2759",
                    "name": "nro_consulta",
                    "type": "INT"
                  }
                ]
              }
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 174
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "1bb6e589-1e48-445e-8915-c5b522548ee5",
        "type": "Table",
        "position": {
          "x": 1605.1169940141176,
          "y": -12.509373111228072
        },
        "data": {
          "label": "PROVEEDOR",
          "isConnectable": false,
          "columns": [
            {
              "id": "4955f5f4-fbb4-4f12-a641-4230f06d67ab",
              "name": "dirrecion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "eef56d01-48b4-461c-87f3-a957ffda84a9",
              "name": "telefono",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
              "name": "id_proveedor",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "a1742589-4168-4fd2-9ac3-08d1eabd69d2",
              "name": "razon_social",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "c00033f4-d1b6-4d1a-a62c-4d2e2a622bca",
              "name": "email",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 149
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "type": "Table",
        "position": {
          "x": 66.93160402398104,
          "y": 281.60676074126366
        },
        "data": {
          "label": "CONSULTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "334b761b-9780-49e0-a69c-34b08abb2759",
              "name": "nro_consulta",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false,
              "isUnique": false
            },
            {
              "id": "7755b042-d638-43b5-a9b6-ea4e25e8e7af",
              "name": "señales",
              "type": "INT",
              "isPrimaryKey": false,
              "isUnique": false
            },
            {
              "id": "143f5e27-e156-45f6-a655-58cccb279dbf",
              "name": "fk_MASCOTA",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "43e5e730-1319-41ce-9dec-aa4eb68f236d",
                "sourceTableId": "98018d29-c620-4892-955a-993fe8c331a1",
                "columns": [
                  {
                    "id": "fk_5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",
                    "name": "id_mascota",
                    "type": "INT"
                  }
                ]
              },
              "isOptional": false,
              "isUnique": false
            },
            {
              "id": "0147adf9-3ae5-429e-ab78-d9fa7dbc9343",
              "name": "fk_VETERINARIO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
                "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
                "columns": [
                  {
                    "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                    "name": "id_veterinario",
                    "type": "INT"
                  }
                ]
              },
              "isOptional": false,
              "isUnique": false
            },
            {
              "id": "02ed7064-578e-45df-9732-25109262509f",
              "name": "fecha",
              "type": "INT",
              "position": 0,
              "isUnique": false
            },
            {
              "id": "1c2a66da-12c9-4251-ac66-d392b7b787f1",
              "name": "hora",
              "type": "INT",
              "position": 0,
              "isUnique": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 174
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "98018d29-c620-4892-955a-993fe8c331a1",
        "type": "Table",
        "position": {
          "x": 374.4313505996324,
          "y": 267.14987392040115
        },
        "data": {
          "label": "MASCOTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "54d36483-cae1-4c7d-a6aa-471cda15c2b2",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false,
              "isOptional": false
            },
            {
              "id": "10e4e4a0-2703-4662-9fe6-3762702b696d",
              "name": "peso",
              "type": "INT",
              "isPrimaryKey": false,
              "isOptional": false
            },
            {
              "id": "affb71d2-c6cd-437a-ab78-93a1bf080609",
              "name": "edad",
              "type": "INT",
              "isPrimaryKey": false,
              "isOptional": false
            },
            {
              "id": "eebc7c73-f151-4bbe-80ba-98bda5109497",
              "name": "raza",
              "type": "INT",
              "isPrimaryKey": false,
              "isOptional": true
            },
            {
              "id": "5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",
              "name": "id_mascota",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "6c9fe8d7-45f6-4998-86dd-67fcc71f111e",
              "name": "especie",
              "type": "INT",
              "position": 0,
              "isOptional": false
            },
            {
              "id": "fk_d2838879-0bc9-4746-abaa-92ae6eb48878",
              "name": "fk_CLIENTE",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "790ed9da-d72f-4764-9c76-37540f51b218",
                "sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",
                "columns": [
                  {
                    "id": "fk_1f0c8409-8a7d-4715-b247-ae46ac386183",
                    "name": "id_cliente",
                    "type": "INT"
                  }
                ]
              }
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 199
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
        "type": "Table",
        "position": {
          "x": 372.7523772035509,
          "y": -36.34717652050596
        },
        "data": {
          "label": "MEDICAMENTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "124ff335-4ca3-452f-9268-95187b523b80",
              "name": "id_medicamento",
              "type": "INT",
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "1de77f4b-14b1-4057-9739-6664c196f74b",
              "name": "nombre",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "f96b4562-c9aa-4021-afa9-b5ac1cd0c0fd",
              "name": "descripcion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "864bac3c-b934-4712-8d6f-938e152be7fb",
              "name": "cantidad",
              "type": "INT",
              "isPrimaryKey": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "80a26357-7794-45f4-aa00-b9301476f86e",
        "type": "Table",
        "position": {
          "x": 1908.2061578542462,
          "y": 395.63566499336423
        },
        "data": {
          "label": "STOCK",
          "isConnectable": false,
          "columns": [
            {
              "id": "d8c1b0fb-95b9-483d-ae79-11cca2df3f3e",
              "name": "cantidad",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "4160beb0-6ea8-4244-bbe5-f569948e46da",
              "name": "faltante",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "fk_e6be64c6-e39c-440c-8462-4696d115c10b",
              "name": "fk_PRODUCTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "34142fb3-5eba-4e11-b271-6792d0352d4e",
                "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
                "columns": [
                  {
                    "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                    "name": "id_producto",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 100
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",
        "type": "Table",
        "position": {
          "x": 371.2979841166665,
          "y": 636.219462594258
        },
        "data": {
          "label": "ESPECIALIDAD",
          "isConnectable": false,
          "columns": [
            {
              "id": "b7133fc4-fb8d-4771-99c4-819302c91163",
              "name": "descripcion",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "e3023245-2e80-4d26-afa0-890014c12141",
              "name": "tipo",
              "type": "INT",
              "isPrimaryKey": false
            },
            {
              "id": "23b6455e-56a9-4f15-a60e-3ecc0a674e4c",
              "name": "id_especialidad",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "03552fca-9e65-4e79-a7ee-a31e60ac2909",
              "name": "nombre",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "b7e6299b-5bd4-42f4-9e15-b313cd54e1c5",
        "type": "Table",
        "position": {
          "x": 69.21425693715165,
          "y": -23.061593568170426
        },
        "data": {
          "label": "DETALLE_TRATAMIENTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "0712e112-8652-4e6d-852a-f352f7a5d9c9",
              "name": "fk_MEDICAMENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "02a1be56-19e6-4696-b381-b5e6ae816600",
                "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
                "columns": [
                  {
                    "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                    "name": "id_medicamento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "fk_514bc840-4741-43bc-8e4f-419843a9ead0",
              "name": "fk_TRATAMIENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "3c7d6272-ed7d-4d71-84d5-634302e2a819",
                "sourceTableId": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
                "columns": [
                  {
                    "id": "fk_5bc774a9-ab01-4499-9e2e-59470f3435bb",
                    "name": "id_tratamiento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "ebb555cb-8d58-4ddd-a722-1b915f6b4281",
              "name": "cantidad",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            },
            {
              "id": "0cbc1666-eebd-4ba7-b730-85c195769bcf",
              "name": "dosis",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            },
            {
              "id": "2e7bdf7a-d33f-4bbe-9299-1e098a0d9736",
              "name": "duracion",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 149
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "type": "Table",
        "position": {
          "x": 1290.1837156846204,
          "y": 263.0111340659047
        },
        "data": {
          "label": "DETALLE_VENTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "9910d35b-9956-4d6b-8987-9aacc400379d",
              "name": "fk_VENTA",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "bd88ac97-be7d-4aac-a704-814b9e55eb33",
                "sourceTableId": "03788b16-81da-4ac7-965c-3af3d3477f51",
                "columns": [
                  {
                    "id": "fk_8cd594e0-b862-4641-9007-8363dc39d694",
                    "name": "id_venta",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "9c8877ac-d717-4c38-a969-b5c1f501ffa0",
              "name": "fk_PRODUCTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "42e10630-ffa2-4b3a-ae29-10ad1d9365df",
                "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
                "columns": [
                  {
                    "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                    "name": "id_producto",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "522bc321-4935-4f60-a1b8-88289341f054",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            },
            {
              "id": "b88b0eff-094d-4105-87cf-e6b0e1e9d0f2",
              "name": "precio_unitario",
              "type": "INT",
              "position": 0
            },
            {
              "id": "bfc4efb2-f2ff-49d4-9414-0739d2c4b436",
              "name": "subtotal",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 149
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "afe2edd7-0279-49d5-bb39-ca72ff1296a5",
        "type": "Table",
        "position": {
          "x": 1605.0116142017,
          "y": 143.52099696103633
        },
        "data": {
          "label": "PRODUCTO_PROVEEDOR",
          "isConnectable": false,
          "columns": [
            {
              "id": "002ecd00-1cb2-41ab-9b6b-102d63c3d776",
              "name": "fk_PROVEEDOR",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "1a359cf1-827d-4200-b377-54a9ef333b8e",
                "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
                "columns": [
                  {
                    "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                    "name": "id_proveedor",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "6a53c522-7c40-4ef8-bf79-4194817ed5ea",
              "name": "fk_PRODUCTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "12e692db-8605-45a4-9507-1111557b46fb",
                "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
                "columns": [
                  {
                    "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                    "name": "id_producto",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "d0dfb1f5-6d06-462c-9191-e1f0fd8972b8",
              "name": "precio_compra",
              "type": "INT",
              "position": 0
            },
            {
              "id": "6693e2c5-61dd-4de4-acb0-dedea7825732",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 125
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "c41359bf-56fd-4a7c-9a38-2de00df2e8b0",
        "type": "Table",
        "position": {
          "x": 1173.3515350639143,
          "y": -36.422989681463065
        },
        "data": {
          "label": "MEDICAMENTO_PROVEEDOR",
          "isConnectable": false,
          "columns": [
            {
              "id": "f3cf0174-5a06-46cd-8a3b-87e0b059449e",
              "name": "fk_MEDICAMENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "74c99f6d-824d-4fce-aa71-1be7f71f77ee",
                "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
                "columns": [
                  {
                    "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                    "name": "id_medicamento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "2ef80d65-2fa4-47fa-b6ed-6ea1aea9e5a9",
              "name": "fk_PROVEEDOR",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "c9426d75-3a38-440a-b91f-247f7f4faae5",
                "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
                "columns": [
                  {
                    "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                    "name": "id_proveedor",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "0df879dc-16bc-4854-826a-336be0ba0933",
              "name": "precio_compra",
              "type": "INT",
              "position": 0
            },
            {
              "id": "a637104a-6d13-4497-bfed-1cec7cde74a6",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 125
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "a5e672de-cfab-4d4c-a51c-882b6f045d10",
        "type": "Table",
        "position": {
          "x": 370.3476432412771,
          "y": 498.47680710020444
        },
        "data": {
          "label": "VETERINARIO_ESPECIALIDAD",
          "isConnectable": false,
          "columns": [
            {
              "id": "2a85f04e-8e6d-4830-ba58-749602bbd737",
              "name": "fk_VETERINARIO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "e95b193c-b8ca-4b22-a9c6-f123340d3e33",
                "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
                "columns": [
                  {
                    "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                    "name": "id_veterinario",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "fk_35302257-5682-4adb-9f4f-f33bda190596",
              "name": "fk_ESPECIALIDAD",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "cdf9dc4f-74c6-4cc1-9669-9d44693afaba",
                "sourceTableId": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",
                "columns": [
                  {
                    "id": "fk_23b6455e-56a9-4f15-a60e-3ecc0a674e4c",
                    "name": "id_especialidad",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "ba6f9d72-5554-4481-8bb4-005c0d989e30",
              "name": "nombre",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      }
    ],
    "edges": [
      {
        "id": "98018d29-c620-4892-955a-993fe8c331a1->497ec7eb-bc68-4cf7-aa8b-14a3741ff313_43e5e730-1319-41ce-9dec-aa4eb68f236d",
        "type": "Relational",
        "source": "98018d29-c620-4892-955a-993fe8c331a1",
        "targetHandle": "foreign-key-handle-43e5e730-1319-41ce-9dec-aa4eb68f236d",
        "target": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "43e5e730-1319-41ce-9dec-aa4eb68f236d",
            "sourceTableId": "98018d29-c620-4892-955a-993fe8c331a1",
            "columns": [
              {
                "id": "fk_5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",
                "name": "id_mascota",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "98499678-71a5-498b-a9d5-019e8bfc576f->497ec7eb-bc68-4cf7-aa8b-14a3741ff313_2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
        "type": "Relational",
        "source": "98499678-71a5-498b-a9d5-019e8bfc576f",
        "targetHandle": "foreign-key-handle-2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
        "target": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
            "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
            "columns": [
              {
                "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                "name": "id_veterinario",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "4bd2d40e-63a7-4572-8990-b72c0f40974e->b7e6299b-5bd4-42f4-9e15-b313cd54e1c5_02a1be56-19e6-4696-b381-b5e6ae816600",
        "type": "Relational",
        "source": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
        "targetHandle": "foreign-key-handle-02a1be56-19e6-4696-b381-b5e6ae816600",
        "target": "b7e6299b-5bd4-42f4-9e15-b313cd54e1c5",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "02a1be56-19e6-4696-b381-b5e6ae816600",
            "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
            "columns": [
              {
                "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                "name": "id_medicamento",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "03788b16-81da-4ac7-965c-3af3d3477f51->a46de616-ce2a-409a-a3d4-81530be4bade_bd88ac97-be7d-4aac-a704-814b9e55eb33",
        "type": "Relational",
        "source": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "targetHandle": "foreign-key-handle-bd88ac97-be7d-4aac-a704-814b9e55eb33",
        "target": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "bd88ac97-be7d-4aac-a704-814b9e55eb33",
            "sourceTableId": "03788b16-81da-4ac7-965c-3af3d3477f51",
            "columns": [
              {
                "id": "fk_8cd594e0-b862-4641-9007-8363dc39d694",
                "name": "id_venta",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc->a46de616-ce2a-409a-a3d4-81530be4bade_42e10630-ffa2-4b3a-ae29-10ad1d9365df",
        "type": "Relational",
        "source": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "targetHandle": "foreign-key-handle-42e10630-ffa2-4b3a-ae29-10ad1d9365df",
        "target": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "42e10630-ffa2-4b3a-ae29-10ad1d9365df",
            "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
            "columns": [
              {
                "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                "name": "id_producto",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "1bb6e589-1e48-445e-8915-c5b522548ee5->afe2edd7-0279-49d5-bb39-ca72ff1296a5_1a359cf1-827d-4200-b377-54a9ef333b8e",
        "type": "Relational",
        "source": "1bb6e589-1e48-445e-8915-c5b522548ee5",
        "targetHandle": "foreign-key-handle-1a359cf1-827d-4200-b377-54a9ef333b8e",
        "target": "afe2edd7-0279-49d5-bb39-ca72ff1296a5",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "1a359cf1-827d-4200-b377-54a9ef333b8e",
            "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
            "columns": [
              {
                "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                "name": "id_proveedor",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc->afe2edd7-0279-49d5-bb39-ca72ff1296a5_12e692db-8605-45a4-9507-1111557b46fb",
        "type": "Relational",
        "source": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "targetHandle": "foreign-key-handle-12e692db-8605-45a4-9507-1111557b46fb",
        "target": "afe2edd7-0279-49d5-bb39-ca72ff1296a5",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "12e692db-8605-45a4-9507-1111557b46fb",
            "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
            "columns": [
              {
                "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                "name": "id_producto",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "4bd2d40e-63a7-4572-8990-b72c0f40974e->c41359bf-56fd-4a7c-9a38-2de00df2e8b0_74c99f6d-824d-4fce-aa71-1be7f71f77ee",
        "type": "Relational",
        "source": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
        "targetHandle": "foreign-key-handle-74c99f6d-824d-4fce-aa71-1be7f71f77ee",
        "target": "c41359bf-56fd-4a7c-9a38-2de00df2e8b0",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "74c99f6d-824d-4fce-aa71-1be7f71f77ee",
            "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
            "columns": [
              {
                "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                "name": "id_medicamento",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "1bb6e589-1e48-445e-8915-c5b522548ee5->c41359bf-56fd-4a7c-9a38-2de00df2e8b0_c9426d75-3a38-440a-b91f-247f7f4faae5",
        "type": "Relational",
        "source": "1bb6e589-1e48-445e-8915-c5b522548ee5",
        "targetHandle": "foreign-key-handle-c9426d75-3a38-440a-b91f-247f7f4faae5",
        "target": "c41359bf-56fd-4a7c-9a38-2de00df2e8b0",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "c9426d75-3a38-440a-b91f-247f7f4faae5",
            "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
            "columns": [
              {
                "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                "name": "id_proveedor",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "98499678-71a5-498b-a9d5-019e8bfc576f->a5e672de-cfab-4d4c-a51c-882b6f045d10_e95b193c-b8ca-4b22-a9c6-f123340d3e33",
        "type": "Relational",
        "source": "98499678-71a5-498b-a9d5-019e8bfc576f",
        "targetHandle": "foreign-key-handle-e95b193c-b8ca-4b22-a9c6-f123340d3e33",
        "target": "a5e672de-cfab-4d4c-a51c-882b6f045d10",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "e95b193c-b8ca-4b22-a9c6-f123340d3e33",
            "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
            "columns": [
              {
                "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                "name": "id_veterinario",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "58303ac7-70b4-4ddb-b570-9495a07e9dc7->a5e672de-cfab-4d4c-a51c-882b6f045d10_cdf9dc4f-74c6-4cc1-9669-9d44693afaba",
        "type": "Relational",
        "source": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",
        "targetHandle": "foreign-key-handle-cdf9dc4f-74c6-4cc1-9669-9d44693afaba",
        "target": "a5e672de-cfab-4d4c-a51c-882b6f045d10",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "cdf9dc4f-74c6-4cc1-9669-9d44693afaba",
            "sourceTableId": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",
            "columns": [
              {
                "id": "fk_23b6455e-56a9-4f15-a60e-3ecc0a674e4c",
                "name": "id_especialidad",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "056736ee-7728-4f2c-a4b6-7f45b86eb979->b7e6299b-5bd4-42f4-9e15-b313cd54e1c5_3c7d6272-ed7d-4d71-84d5-634302e2a819",
        "type": "Relational",
        "source": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
        "targetHandle": "foreign-key-handle-3c7d6272-ed7d-4d71-84d5-634302e2a819",
        "target": "b7e6299b-5bd4-42f4-9e15-b313cd54e1c5",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "3c7d6272-ed7d-4d71-84d5-634302e2a819",
            "sourceTableId": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
            "columns": [
              {
                "id": "fk_5bc774a9-ab01-4499-9e2e-59470f3435bb",
                "name": "id_tratamiento",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313->056736ee-7728-4f2c-a4b6-7f45b86eb979_fdde9089-8cd8-4053-a761-6637f6c49e4c",
        "type": "Relational",
        "source": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "targetHandle": "foreign-key-handle-fdde9089-8cd8-4053-a761-6637f6c49e4c",
        "target": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "fdde9089-8cd8-4053-a761-6637f6c49e4c",
            "sourceTableId": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
            "columns": [
              {
                "id": "fk_334b761b-9780-49e0-a69c-34b08abb2759",
                "name": "nro_consulta",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "27ca4a21-4599-41c5-9c7f-73c112b5a554->03788b16-81da-4ac7-965c-3af3d3477f51_763ff208-f680-4345-b3db-ba9bea0daf9b",
        "type": "Relational",
        "source": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
        "targetHandle": "foreign-key-handle-763ff208-f680-4345-b3db-ba9bea0daf9b",
        "target": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "763ff208-f680-4345-b3db-ba9bea0daf9b",
            "sourceTableId": "27ca4a21-4599-41c5-9c7f-73c112b5a554",
            "columns": [
              {
                "id": "fk_231b7e62-d566-41c1-b582-30966cf754bc",
                "name": "id_metodo_pago",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "c40b9747-de49-4347-9b2c-df35965b4cd2->98018d29-c620-4892-955a-993fe8c331a1_790ed9da-d72f-4764-9c76-37540f51b218",
        "type": "Relational",
        "source": "c40b9747-de49-4347-9b2c-df35965b4cd2",
        "targetHandle": "foreign-key-handle-790ed9da-d72f-4764-9c76-37540f51b218",
        "target": "98018d29-c620-4892-955a-993fe8c331a1",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "790ed9da-d72f-4764-9c76-37540f51b218",
            "sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",
            "columns": [
              {
                "id": "fk_1f0c8409-8a7d-4715-b247-ae46ac386183",
                "name": "id_cliente",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "c40b9747-de49-4347-9b2c-df35965b4cd2->03788b16-81da-4ac7-965c-3af3d3477f51_a7bb2d7d-6289-4af8-8eb7-9c4cbab12715",
        "type": "Relational",
        "source": "c40b9747-de49-4347-9b2c-df35965b4cd2",
        "targetHandle": "foreign-key-handle-a7bb2d7d-6289-4af8-8eb7-9c4cbab12715",
        "target": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "a7bb2d7d-6289-4af8-8eb7-9c4cbab12715",
            "sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",
            "columns": [
              {
                "id": "fk_1f0c8409-8a7d-4715-b247-ae46ac386183",
                "name": "id_cliente",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc->80a26357-7794-45f4-aa00-b9301476f86e_34142fb3-5eba-4e11-b271-6792d0352d4e",
        "type": "Relational",
        "source": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "targetHandle": "foreign-key-handle-34142fb3-5eba-4e11-b271-6792d0352d4e",
        "target": "80a26357-7794-45f4-aa00-b9301476f86e",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "34142fb3-5eba-4e11-b271-6792d0352d4e",
            "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
            "columns": [
              {
                "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                "name": "id_producto",
                "type": "INT"
              }
            ]
          }
        }
      }
    ],
    "viewport": {
      "x": 155.16008906589354,
      "y": 134.0508817718013,
      "zoom": 0.5
    }
  },
  "name": "Veterinaria-Relational Schema",
  "folder": {
    "name": "Diagrams",
    "folderType": 1,
    "depth": 0,
    "id": 382065
  },
  "id": 580209,
  "updatedAtTimestamp": 1790105993
}
{

"id": "fk\_f7034578-e360-4bdf-8e16-71c91739fb78",

"name": "fk\_CONSULTA",

"type": "None",

"isForeignKey": true,

"foreignKeyProps": {

"foreignKeyGroupId": "fdde9089-8cd8-4053-a761-6637f6c49e4c",

"sourceTableId": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",

"columns": [

{

"id": "fk\_334b761b-9780-49e0-a69c-34b08abb2759",

"name": "nro\_consulta",

"type": "INT"

}

]

}

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 174

},

"selected": false,

"dragging": false

},

{

"id": "1bb6e589-1e48-445e-8915-c5b522548ee5",

"type": "Table",

"position": {

"x": 1605.1169940141176,

"y": -12.509373111228072

},

"data": {

"label": "PROVEEDOR",

"isConnectable": false,

"columns": [

{

"id": "4955f5f4-fbb4-4f12-a641-4230f06d67ab",

"name": "dirrecion",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "eef56d01-48b4-461c-87f3-a957ffda84a9",

"name": "telefono",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",

"name": "id\_proveedor",

"type": "INT",

"isPrimaryKey": true,

"isOptional": false

},

{

"id": "a1742589-4168-4fd2-9ac3-08d1eabd69d2",

"name": "razon\_social",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "c00033f4-d1b6-4d1a-a62c-4d2e2a622bca",

"name": "email",

"type": "INT",

"position": 0

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 149

},

"selected": false,

"dragging": false

},

{

"id": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",

"type": "Table",

"position": {

"x": 66.93160402398104,

"y": 281.60676074126366

},

"data": {

"label": "CONSULTA",

"isConnectable": false,

"columns": [

{

"id": "334b761b-9780-49e0-a69c-34b08abb2759",

"name": "nro\_consulta",

"type": "INT",

"isPrimaryKey": true,

"isOptional": false,

"isUnique": false

},

{

"id": "7755b042-d638-43b5-a9b6-ea4e25e8e7af",

"name": "seÃ±ales",

"type": "INT",

"isPrimaryKey": false,

"isUnique": false

},

{

"id": "143f5e27-e156-45f6-a655-58cccb279dbf",

"name": "fk\_MASCOTA",

"type": "None",

"isForeignKey": true,

"foreignKeyProps": {

"foreignKeyGroupId": "43e5e730-1319-41ce-9dec-aa4eb68f236d",

"sourceTableId": "98018d29-c620-4892-955a-993fe8c331a1",

"columns": [

{

"id": "fk\_5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",

"name": "id\_mascota",

"type": "INT"

}

]

},

"isOptional": false,

"isUnique": false

},

{

"id": "0147adf9-3ae5-429e-ab78-d9fa7dbc9343",

"name": "fk\_VETERINARIO",

"type": "None",

"isForeignKey": true,

"foreignKeyProps": {

"foreignKeyGroupId": "2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",

"sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",

"columns": [

{

"id": "fk\_05184cdd-67e0-4fee-b44b-a03092863cac",

"name": "id\_veterinario",

"type": "INT"

}

]

},

"isOptional": false,

"isUnique": false

},

{

"id": "02ed7064-578e-45df-9732-25109262509f",

"name": "fecha",

"type": "INT",

"position": 0,

"isUnique": false

},

{

"id": "1c2a66da-12c9-4251-ac66-d392b7b787f1",

"name": "hora",

"type": "INT",

"position": 0,

"isUnique": false

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 174

},

"selected": false,

"dragging": false

},

{

"id": "98018d29-c620-4892-955a-993fe8c331a1",

"type": "Table",

"position": {

"x": 374.4313505996324,

"y": 267.14987392040115

},

"data": {

"label": "MASCOTA",

"isConnectable": false,

"columns": [

{

"id": "54d36483-cae1-4c7d-a6aa-471cda15c2b2",

"name": "nombre",

"type": "INT",

"isPrimaryKey": false,

"isOptional": false

},

{

"id": "10e4e4a0-2703-4662-9fe6-3762702b696d",

"name": "peso",

"type": "INT",

"isPrimaryKey": false,

"isOptional": false

},

{

"id": "affb71d2-c6cd-437a-ab78-93a1bf080609",

"name": "edad",

"type": "INT",

"isPrimaryKey": false,

"isOptional": false

},

{

"id": "eebc7c73-f151-4bbe-80ba-98bda5109497",

"name": "raza",

"type": "INT",

"isPrimaryKey": false,

"isOptional": true

},

{

"id": "5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",

"name": "id\_mascota",

"type": "INT",

"isPrimaryKey": true,

"isOptional": false

},

{

"id": "6c9fe8d7-45f6-4998-86dd-67fcc71f111e",

"name": "especie",

"type": "INT",

"position": 0,

"isOptional": false

},

{

"id": "fk\_d2838879-0bc9-4746-abaa-92ae6eb48878",

"name": "fk\_CLIENTE",

"type": "None",

"isForeignKey": true,

"foreignKeyProps": {

"foreignKeyGroupId": "790ed9da-d72f-4764-9c76-37540f51b218",

"sourceTableId": "c40b9747-de49-4347-9b2c-df35965b4cd2",

"columns": [

{

"id": "fk\_1f0c8409-8a7d-4715-b247-ae46ac386183",

"name": "id\_cliente",

"type": "INT"

}

]

}

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 199

},

"selected": false,

"dragging": false

},

{

"id": "4bd2d40e-63a7-4572-8990-b72c0f40974e",

"type": "Table",

"position": {

"x": 372.7523772035509,

"y": -36.34717652050596

},

"data": {

"label": "MEDICAMENTO",

"isConnectable": false,

"columns": [

{

"id": "124ff335-4ca3-452f-9268-95187b523b80",

"name": "id\_medicamento",

"type": "INT",

"isPrimaryKey": true,

"isOptional": false

},

{

"id": "1de77f4b-14b1-4057-9739-6664c196f74b",

"name": "nombre",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "f96b4562-c9aa-4021-afa9-b5ac1cd0c0fd",

"name": "descripcion",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "864bac3c-b934-4712-8d6f-938e152be7fb",

"name": "cantidad",

"type": "INT",

"isPrimaryKey": false

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 124

},

"selected": false,

"dragging": false

},

{

"id": "80a26357-7794-45f4-aa00-b9301476f86e",

"type": "Table",

"position": {

"x": 1908.2061578542462,

"y": 395.63566499336423

},

"data": {

"label": "STOCK",

"isConnectable": false,

"columns": [

{

"id": "d8c1b0fb-95b9-483d-ae79-11cca2df3f3e",

"name": "cantidad",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "4160beb0-6ea8-4244-bbe5-f569948e46da",

"name": "faltante",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "fk\_e6be64c6-e39c-440c-8462-4696d115c10b",

"name": "fk\_PRODUCTO",

"type": "None",

"isForeignKey": true,

"foreignKeyProps": {

"foreignKeyGroupId": "34142fb3-5eba-4e11-b271-6792d0352d4e",

"sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",

"columns": [

{

"id": "fk\_9e682f57-740b-4b16-810d-3ed3e51c3f6b",

"name": "id\_producto",

"type": "INT"

}

]

},

"isPrimaryKey": true,

"isOptional": false

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 100

},

"selected": false,

"dragging": false

},

{

"id": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",

"type": "Table",

"position": {

"x": 371.2979841166665,

"y": 636.219462594258

},

"data": {

"label": "ESPECIALIDAD",

"isConnectable": false,

"columns": [

{

"id": "b7133fc4-fb8d-4771-99c4-819302c91163",

"name": "descripcion",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "e3023245-2e80-4d26-afa0-890014c12141",

"name": "tipo",

"type": "INT",

"isPrimaryKey": false

},

{

"id": "23b6455e-56a9-4f15-a60e-3ecc0a674e4c",

"name": "id\_especialidad",

"type": "INT",

"position": 0,

"isPrimaryKey": true,

"isOptional": false

},

{

"id": "03552fca-9e65-4e79-a7ee-a31e60ac2909",

"name": "nombre",

"type": "INT",

"position": 0

}

],

"numberOfGroups": 0,

"isSelected": false

},

"measured": {

"width": 240,

"height": 124

},

"selected": false,

"dragging": false

},

{

"id": "b7e6299b-5bd4-42f4-9e15-b313cd54e1c5",

"type": "Table",

"position": {

"x": 69.21425693715165, 

"y": -23.061593568170426

};
"data": {
          "label": "DETALLE_TRATAMIENTO",
          "isConnectable": false,
          "columns": [
            {
              "id": "0712e112-8652-4e6d-852a-f352f7a5d9c9",
              "name": "fk_MEDICAMENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "02a1be56-19e6-4696-b381-b5e6ae816600",
                "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
                "columns": [
                  {
                    "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                    "name": "id_medicamento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "fk_514bc840-4741-43bc-8e4f-419843a9ead0",
              "name": "fk_TRATAMIENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "3c7d6272-ed7d-4d71-84d5-634302e2a819",
                "sourceTableId": "056736ee-7728-4f2c-a4b6-7f45b86eb979",
                "columns": [
                  {
                    "id": "fk_5bc774a9-ab01-4499-9e2e-59470f3435bb",
                    "name": "id_tratamiento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "ebb555cb-8d58-4ddd-a722-1b915f6b4281",
              "name": "cantidad",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            },
            {
              "id": "0cbc1666-eebd-4ba7-b730-85c195769bcf",
              "name": "dosis",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            },
            {
              "id": "2e7bdf7a-d33f-4bbe-9299-1e098a0d9736",
              "name": "duracion",
              "type": "INT",
              "position": 0,
              "isPrimaryKey": false
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 149
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "type": "Table",
        "position": {
          "x": 1290.1837156846204,
          "y": 263.0111340659047
        },
        "data": {
          "label": "DETALLE_VENTA",
          "isConnectable": false,
          "columns": [
            {
              "id": "9910d35b-9956-4d6b-8987-9aacc400379d",
              "name": "fk_VENTA",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "bd88ac97-be7d-4aac-a704-814b9e55eb33",
                "sourceTableId": "03788b16-81da-4ac7-965c-3af3d3477f51",
                "columns": [
                  {
                    "id": "fk_8cd594e0-b862-4641-9007-8363dc39d694",
                    "name": "id_venta",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "9c8877ac-d717-4c38-a969-b5c1f501ffa0",
              "name": "fk_PRODUCTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "42e10630-ffa2-4b3a-ae29-10ad1d9365df",
                "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
                "columns": [
                  {
                    "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                    "name": "id_producto",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "522bc321-4935-4f60-a1b8-88289341f054",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            },
            {
              "id": "b88b0eff-094d-4105-87cf-e6b0e1e9d0f2",
              "name": "precio_unitario",
              "type": "INT",
              "position": 0
            },
            {
              "id": "bfc4efb2-f2ff-49d4-9414-0739d2c4b436",
              "name": "subtotal",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 149
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "afe2edd7-0279-49d5-bb39-ca72ff1296a5",
        "type": "Table",
        "position": {
          "x": 1605.0116142017,
          "y": 143.52099696103633
        },
        "data": {
          "label": "PRODUCTO_PROVEEDOR",
          "isConnectable": false,
          "columns": [
            {
              "id": "002ecd00-1cb2-41ab-9b6b-102d63c3d776",
              "name": "fk_PROVEEDOR",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "1a359cf1-827d-4200-b377-54a9ef333b8e",
                "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
                "columns": [
                  {
                    "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                    "name": "id_proveedor",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "6a53c522-7c40-4ef8-bf79-4194817ed5ea",
              "name": "fk_PRODUCTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "12e692db-8605-45a4-9507-1111557b46fb",
                "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
                "columns": [
                  {
                    "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                    "name": "id_producto",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "d0dfb1f5-6d06-462c-9191-e1f0fd8972b8",
              "name": "precio_compra",
              "type": "INT",
              "position": 0
            },
            {
              "id": "6693e2c5-61dd-4de4-acb0-dedea7825732",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 125
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "c41359bf-56fd-4a7c-9a38-2de00df2e8b0",
        "type": "Table",
        "position": {
          "x": 1173.3515350639143,
          "y": -36.422989681463065
        },
        "data": {
          "label": "MEDICAMENTO_PROVEEDOR",
          "isConnectable": false,
          "columns": [
            {
              "id": "f3cf0174-5a06-46cd-8a3b-87e0b059449e",
              "name": "fk_MEDICAMENTO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "74c99f6d-824d-4fce-aa71-1be7f71f77ee",
                "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
                "columns": [
                  {
                    "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                    "name": "id_medicamento",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "2ef80d65-2fa4-47fa-b6ed-6ea1aea9e5a9",
              "name": "fk_PROVEEDOR",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "c9426d75-3a38-440a-b91f-247f7f4faae5",
                "sourceTableId": "1bb6e589-1e48-445e-8915-c5b522548ee5",
                "columns": [
                  {
                    "id": "fk_74f48d9a-ecf2-4f9e-bbb1-484d07ec0fee",
                    "name": "id_proveedor",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "0df879dc-16bc-4854-826a-336be0ba0933",
              "name": "precio_compra",
              "type": "INT",
              "position": 0
            },
            {
              "id": "a637104a-6d13-4497-bfed-1cec7cde74a6",
              "name": "cantidad",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 125
        },
        "selected": false,
        "dragging": false
      },
      {
        "id": "a5e672de-cfab-4d4c-a51c-882b6f045d10",
        "type": "Table",
        "position": {
          "x": 370.3476432412771,
          "y": 498.47680710020444
        },
        "data": {
          "label": "VETERINARIO_ESPECIALIDAD",
          "isConnectable": false,
          "columns": [
            {
              "id": "2a85f04e-8e6d-4830-ba58-749602bbd737",
              "name": "fk_VETERINARIO",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "e95b193c-b8ca-4b22-a9c6-f123340d3e33",
                "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
                "columns": [
                  {
                    "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                    "name": "id_veterinario",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "fk_35302257-5682-4adb-9f4f-f33bda190596",
              "name": "fk_ESPECIALIDAD",
              "type": "None",
              "isForeignKey": true,
              "foreignKeyProps": {
                "foreignKeyGroupId": "cdf9dc4f-74c6-4cc1-9669-9d44693afaba",
                "sourceTableId": "58303ac7-70b4-4ddb-b570-9495a07e9dc7",
                "columns": [
                  {
                    "id": "fk_23b6455e-56a9-4f15-a60e-3ecc0a674e4c",
                    "name": "id_especialidad",
                    "type": "INT"
                  }
                ]
              },
              "isPrimaryKey": true,
              "isOptional": false
            },
            {
              "id": "ba6f9d72-5554-4481-8bb4-005c0d989e30",
              "name": "nombre",
              "type": "INT",
              "position": 0
            }
          ],
          "numberOfGroups": 0,
          "isSelected": false
        },
        "measured": {
          "width": 240,
          "height": 124
        },
        "selected": false,
        "dragging": false
      }
    ],
    "edges": [
      {
        "id": "98018d29-c620-4892-955a-993fe8c331a1->497ec7eb-bc68-4cf7-aa8b-14a3741ff313_43e5e730-1319-41ce-9dec-aa4eb68f236d",
        "type": "Relational",
        "source": "98018d29-c620-4892-955a-993fe8c331a1",
        "targetHandle": "foreign-key-handle-43e5e730-1319-41ce-9dec-aa4eb68f236d",
        "target": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "43e5e730-1319-41ce-9dec-aa4eb68f236d",
            "sourceTableId": "98018d29-c620-4892-955a-993fe8c331a1",
            "columns": [
              {
                "id": "fk_5c6e28a3-fb0d-482e-831a-7de62d2bd2d6",
                "name": "id_mascota",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "98499678-71a5-498b-a9d5-019e8bfc576f->497ec7eb-bc68-4cf7-aa8b-14a3741ff313_2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
        "type": "Relational",
        "source": "98499678-71a5-498b-a9d5-019e8bfc576f",
        "targetHandle": "foreign-key-handle-2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
        "target": "497ec7eb-bc68-4cf7-aa8b-14a3741ff313",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "2f633b1d-3f68-4489-bf4e-d1d9b03fb5fa",
            "sourceTableId": "98499678-71a5-498b-a9d5-019e8bfc576f",
            "columns": [
              {
                "id": "fk_05184cdd-67e0-4fee-b44b-a03092863cac",
                "name": "id_veterinario",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "4bd2d40e-63a7-4572-8990-b72c0f40974e->b7e6299b-5bd4-42f4-9e15-b313cd54e1c5_02a1be56-19e6-4696-b381-b5e6ae816600",
        "type": "Relational",
        "source": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
        "targetHandle": "foreign-key-handle-02a1be56-19e6-4696-b381-b5e6ae816600",
        "target": "b7e6299b-5bd4-42f4-9e15-b313cd54e1c5",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "02a1be56-19e6-4696-b381-b5e6ae816600",
            "sourceTableId": "4bd2d40e-63a7-4572-8990-b72c0f40974e",
            "columns": [
              {
                "id": "fk_124ff335-4ca3-452f-9268-95187b523b80",
                "name": "id_medicamento",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "03788b16-81da-4ac7-965c-3af3d3477f51->a46de616-ce2a-409a-a3d4-81530be4bade_bd88ac97-be7d-4aac-a704-814b9e55eb33",
        "type": "Relational",
        "source": "03788b16-81da-4ac7-965c-3af3d3477f51",
        "targetHandle": "foreign-key-handle-bd88ac97-be7d-4aac-a704-814b9e55eb33",
        "target": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "bd88ac97-be7d-4aac-a704-814b9e55eb33",
            "sourceTableId": "03788b16-81da-4ac7-965c-3af3d3477f51",
            "columns": [
              {
                "id": "fk_8cd594e0-b862-4641-9007-8363dc39d694",
                "name": "id_venta",
                "type": "INT"
              }
            ]
          }
        }
      },
      {
        "id": "34f0851b-cd83-4892-8272-66c3b437cefc->a46de616-ce2a-409a-a3d4-81530be4bade_42e10630-ffa2-4b3a-ae29-10ad1d9365df",
        "type": "Relational",
        "source": "34f0851b-cd83-4892-8272-66c3b437cefc",
        "targetHandle": "foreign-key-handle-42e10630-ffa2-4b3a-ae29-10ad1d9365df",
        "target": "a46de616-ce2a-409a-a3d4-81530be4bade",
        "markerStart": {
          "type": "arrow"
        },
        "data": {
          "foreignKeyProps": {
            "foreignKeyGroupId": "42e10630-ffa2-4b3a-ae29-10ad1d9365df",
            "sourceTableId": "34f0851b-cd83-4892-8272-66c3b437cefc",
            "columns": [
              {
                "id": "fk_9e682f57-740b-4b16-810d-3ed3e51c3f6b",
                "name": "id_producto",
                "type": "INT"
              }
            ]
          }
        }
      },

},

