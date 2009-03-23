ListController = CommandController mimic do(
  View = CommandController View mimic do(
    help = method(
      "Use one of the following commands:
list         - list only new notes
list active  - active notes
list all     - all created notes (including deleted)
list created - only new notes
list deleted - deleted notes
list done    - done notes
"
    )
    pass = method(
      model map(toText) join("\n")
    )
  )
  
  active = method(arguments, NoteCollection active)
  
  all = method(arguments, NoteCollection all)

  created = method(arguments, NoteCollection created)
  
  defaultCommand = method(arguments, created(arguments))
  
  deleted = method(arguments, NoteCollection deleted)
  
  done = method(arguments, NoteCollection done)
)