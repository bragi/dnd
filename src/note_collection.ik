NoteCollection = Origin mimic do(
  add = method(note,
    id = maxId + 1
    note id = id
    all << note
    saveAll
    note
  )

  all = method(
    self all = Database all map(entry,
      Note build(*entry)
    )
  )
  
  created = method(
    all select (state == "created")
  )
  
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
