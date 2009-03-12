Note = Origin mimic do(
  attributes = [:id, :text, :state, :tag]

  toDatabase = method(separator ",",
    [id, text, state, tag] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}\t (#{tag}, #{state})"
  )
    
  delete! = method(
    self state = "deleted"
    NoteCollection saveAll
  )
  
  finish! = method(
    self state = "finished"
    NoteCollection saveAll
  )
  
  initialize = method(+:attributes,
    self attributes each(attribute,
      self cell(attribute) = attributes[attribute]
    )
    self state ||= "created"
  )
  
  save = method(
    NoteCollection add(self)
  )
  
  take! = method(
    self state = "taken"
    NoteCollection saveAll
  )
)
