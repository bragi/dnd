DndController = CommandController mimic do(

  add = method(arguments,
    note = Note mimic(*arguments) save
    note toText println
  )
  
  delete = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note delete
      note toText,
      
      "Could not find note #{arguments first}" ) println
  )
  
  done = method(arguments,
    note = NoteCollection find(arguments first)
    if(note,
      note done
      note toText,
      
      "Could not find note #{arguments first}" ) println
  )
  
  help = method(arguments,
    Help println
  )
  
  list = method(arguments,
    ListController route(arguments))

  pass = macro(
    "Unknown command #{call message name}" println
    help
  )
)
