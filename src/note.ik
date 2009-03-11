Note = Origin mimic do(

  toDatabase = method(separator ",",
    [id, text, state] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}\t (#{state})"
  )
    
  build = method(id, text, state,
    note = mimic
    note id = id
    note text = text
    note state = state
    note
  )
  
  delete = method(
    self state = "deleted"
    NoteCollection saveAll
  )
  
  initialize = method(text nil,
    self text = text
    self state = "created"
    self
  )
  
  save = method(
    NoteCollection add(self)
  )
)
