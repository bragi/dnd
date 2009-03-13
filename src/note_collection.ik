NoteCollection = Origin mimic do(
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
  
  created = method(
    all select (state == "created")
  )
  
  database = method(Database mimic(Note attributes))
  
  deleted = method(
    all select (state == "deleted")
  )
  
  done = method(
    all select (state == "done")
  )

  find = method(findId,
    note = all select(id == findId) first
  )
  
  maxId = method(
    all map(id toRational) max || 0
  )

  saveAll = method(
    Database save(all)
  )
)
