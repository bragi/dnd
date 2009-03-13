ListController = CommandController mimic do(
  viewCollection = method(collection, collection each(toText println))
  
  active = method(arguments, viewCollection(NoteCollection active))
  
  all = method(arguments, viewCollection(NoteCollection all))

  created = method(arguments, viewCollection(NoteCollection created))
  
  defaultCommand = method(arguments, created(arguments))
  
  deleted = method(arguments, viewCollection(NoteCollection deleted))
  
  done = method(arguments, viewCollection(NoteCollection done))

  pass = macro(
    "Unknown list #{call message name}" println
    Help println
  )
)