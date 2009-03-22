ListController = CommandController mimic do(
  active = method(arguments, NoteCollection active)
  
  all = method(arguments, NoteCollection all)

  created = method(arguments, NoteCollection created)
  
  defaultCommand = method(arguments, created(arguments))
  
  deleted = method(arguments, NoteCollection deleted)
  
  done = method(arguments, NoteCollection done)

  pass = macro(
    Help failure("Unknown list #{call message name}")
  )
  
  view = method(model,
    model map(toText) join("\n") println
  )
)