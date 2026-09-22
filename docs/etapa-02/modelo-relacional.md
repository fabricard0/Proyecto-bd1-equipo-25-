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

},

