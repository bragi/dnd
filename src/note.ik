Note = Origin mimic do(
  attributes = [:id, :text, :state, :tag]
  
  updateAttributeMethod = method(attribute, value,
    lecro(
      target = call receiver
      target cell(attribute) = value
      target save
    )
  )
  
  updateStateMethod = method(value,
    updateAttributeMethod("state", value)
  )
  
  delete = updateStateMethod("deleted")
  
  done = updateStateMethod("done")
  
  initialize = method(+:attributes,
    self state = "created"
    self tag = "inbox"
    self savedRecord = false
    self attributes each(attribute,
      self cell(attribute) = attributes[attribute]
    )
  )
  
  save = method(
    if(savedRecord,
      NoteCollection saveAll,
      
      NoteCollection add(self)
    )
  )
  
  take = updateStateMethod("taken")

  toDatabase = method(separator ",",
    [id, text, state, tag] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}\t (#{tag}, #{state})"
  )
    
)
