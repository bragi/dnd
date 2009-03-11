use("command_controller")

ListController = CommandController mimic do(
  viewCollection = method(collection, collection each(toText println))
  
  all = method(arguments, viewCollection(NoteCollection all))

  created = method(arguments, viewCollection(NoteCollection created))
  
  defaultCommand = method(arguments, created(arguments))
  
  deleted = method(arguments, viewCollection(NoteCollection deleted))

  pass = method(arguments,
    created(arguments)
  )
)