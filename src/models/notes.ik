Notes = Origin mimic

Notes RecordNotFound = Condition Error mimic

Notes do(
  selectByState = method(name,
    lecro(all select(state == name))
  )

  add = method(note,
    id = maxId + 1
    note id = id
    all << note
    saveAll
    note
  )

  active = method(
    all reject(note, ["deleted", "done"] include?(note state))
  )

  all = method(
    self all = database all map(entry,
      Note mimic(* entry toDict)
    )
  )

  [:created, :deleted, :done, :taken] each(state,
    Notes cell(state)= selectByState(state)
  )

  database = method(Database mimic(Note attributes))

  find = method(findId,
    all select(id == findId) first || error!(RecordNotFound mimic("Could not find note with id: #{findId}"))
  )

  maxId = method(
    all map(id toRational) max || 0
  )

  saveAll = method(
    Database save(all)
  )
)
