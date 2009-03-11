Note = Origin mimic do(

  toDatabase = method(separator ",",
    [id, text, state, tag] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}\t (#{tag}, #{state})"
  )
    
  build = method(id, text, state, tag "inbox",
    note = mimic
    note id = id
    note text = text
    note state = state
    note tag = tag
    note
  )
  
  delete! = method(
    self state = "deleted"
    NoteCollection saveAll
  )
  
  do! = method(
    self state = "done"
    NoteCollection saveAll
  )
  
  initialize = method(text nil, tag "inbox",
    self text = text
    self tag = tag
    self state = "created"
    self
  )
  
  save = method(
    NoteCollection add(self)
  )
  
  take! = method(
    self state = "taken"
    NoteCollection saveAll
  )
)
