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

