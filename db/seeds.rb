
lists = List.all
list = lists.find_by filename:"lista_esimerkkikorjattu.csv"
if !list
  List.create([
    {filename: "lista_esimerkkikorjattu.csv", training: false, active: true}
  ])
  Number.create([
    {numberset_id: 1, position: 1, text: 5},
    {numberset_id: 1, position: 2, text: 7},
    {numberset_id: 1, position: 3, text: 3},
    {numberset_id: 1, position: 4, text: 8},
    {numberset_id: 2, position: 1, text: 4},
    {numberset_id: 2, position: 2, text: 7},
    {numberset_id: 2, position: 3, text: 1},
    {numberset_id: 3, position: 1, text: 0},
    {numberset_id: 3, position: 2, text: 5},
    {numberset_id: 4, position: 1, text: 7},
    {numberset_id: 4, position: 2, text: 3},
    {numberset_id: 4, position: 3, text: 8},
    {numberset_id: 4, position: 4, text: 5},
    {numberset_id: 4, position: 5, text: 9},
    {numberset_id: 4, position: 6, text: 3},
    {numberset_id: 4, position: 7, text: 5},
    {numberset_id: 5, position: 1, text: 4},
    {numberset_id: 5, position: 2, text: 7},
    {numberset_id: 5, position: 3, text: 3},
    {numberset_id: 5, position: 4, text: 8},
    {numberset_id: 6, position: 1, text: 5},
    {numberset_id: 6, position: 2, text: 9},
    {numberset_id: 6, position: 3, text: 6},
    {numberset_id: 6, position: 4, text: 4},
    {numberset_id: 6, position: 5, text: 0},
    {numberset_id: 6, position: 6, text: 4},
    {numberset_id: 7, position: 1, text: 6},
    {numberset_id: 7, position: 2, text: 3},
    {numberset_id: 8, position: 1, text: 7},
    {numberset_id: 8, position: 2, text: 5},
    {numberset_id: 8, position: 3, text: 8},
    {numberset_id: 9, position: 1, text: 9},
    {numberset_id: 9, position: 2, text: 2},
    {numberset_id: 9, position: 3, text: 5},
    {numberset_id: 9, position: 4, text: 3},
    {numberset_id: 9, position: 5, text: 7},
    {numberset_id: 10, position: 1, text: 4},
    {numberset_id: 10, position: 2, text: 6},
    {numberset_id: 10, position: 3, text: 8},
    {numberset_id: 10, position: 4, text: 9},
    {numberset_id: 10, position: 5, text: 1},
    {numberset_id: 10, position: 6, text: 5},
    {numberset_id: 10, position: 7, text: 3},
    {numberset_id: 11, position: 1, text: 6},
    {numberset_id: 11, position: 2, text: 2},
    {numberset_id: 11, position: 3, text: 7},
    {numberset_id: 11, position: 4, text: 9},
    {numberset_id: 12, position: 1, text: 4},
    {numberset_id: 12, position: 2, text: 6}
  ])
  Numberset.create([
    {position: 1, list_id: 1, length: 4, order: "backwards"},
    {position: 2, list_id: 1, length: 3, order: "upwards"},
    {position: 3, list_id: 1, length: 2, order: "upwards"},
    {position: 4, list_id: 1, length: 7, order: "upwards"},
    {position: 5, list_id: 1, length: 4, order: "upwards"},
    {position: 6, list_id: 1, length: 6, order: "backwards"},
    {position: 7, list_id: 1, length: 2, order: "backwards"},
    {position: 8, list_id: 1, length: 3, order: "upwards"},
    {position: 9, list_id: 1, length: 5, order: "backwards"},
    {position: 10, list_id: 1, length: 7, order: "upwards"},
    {position: 11, list_id: 1, length: 4, order: "upwards"},
    {position: 12, list_id: 1, length: 2, order: "backwards"}
  ])
end
User.create([
  {username: "Olen", sex: "f", yearOfBirth: 1999, handedness: "l", education: "Peruskoulu"}
])
