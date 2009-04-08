Note = Origin mimic do(
  attributes = [:id, :text, :state, :project, :savedRecord]
  
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
    self project ||= "inbox"
  )
  
  save = method(
    if(savedRecord,
      Notes saveAll,
      
      Notes add(self)
    )
  )
  
  take = updateStateMethod("taken")

  toDatabase = method(separator ",",
    [id, text, state, project] join(separator)
  )
    
  asText = method(
    "#{id}:\t #{text}\t (#{project}, #{state})"
  )
    
)
