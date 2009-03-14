NoteCollection = Origin mimic 

NoteCollection do(
  selectByState = method(
    macro(all select(state == call message name))
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
  
  [:created, :deleted, :done] each(state,
    NoteCollection cell(state)= selectByState
  )
  database = method(Database mimic(Note attributes))
  
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
