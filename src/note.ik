Note = Origin mimic do(
  attributes = [:id, :text, :state, :tag, :savedRecord]
  
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
  
  initialize = method(+:newAttributes,
    self attributes each(attribute,
      self cell(attribute) = newAttributes[attribute]
    )
    self state ||= "created"
    self tag ||= "inbox"
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
    
  asText = method(
    "#{id}:\t #{text}\t (#{tag}, #{state})"
  )
    
)
