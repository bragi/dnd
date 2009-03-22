DndController = CommandController mimic do(

  add = method(arguments,
    note = Note mimic(text: arguments first, tag: arguments second) save
    note
  )
  
  delete = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note delete
      note,
      
      "Could not find note #{arguments first}" )
  )
  
  done = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note done
      note,
      
      "Could not find note #{arguments first}" )
  )
  
  help = method(arguments,
    Help usage
  )
  
  list = method(arguments,
    ListController route(arguments))
    
  move = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note tag = arguments second
      note save
      note,
      
      "Could not find note #{arguments first}" )
  )

  pass = macro(
    Help failure("Unknown command #{call message name}")
  )
  
  take = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note take
      note,
      
      "Could not find note #{arguments first}" )
  )
)
