use("command_controller")
use("list_controller")

DndController = CommandController mimic do(
  View = CommandController View mimic do(
    help = method(
      "Use one of the following commands:
add    - add new note
delete - deletes existing note
help   - prints this help
list   - lists notes"
    )
  )

  add = method(arguments,
    note = Note mimic(text: arguments first, tag: arguments second) save
    note
  )
  
  delete = method(arguments,
    note = NoteCollection find(arguments first)
    note delete
    note
  )
  
  done = method(arguments,
    note = NoteCollection find(arguments first)
    note done
    note
  )
  
  help = method(arguments, .)
  
  list = ListController mimic
    
  move = method(arguments,
    note = NoteCollection find(arguments first)
    note tag = arguments second
    note save
    note
  )

  take = method(arguments,
    note = NoteCollection find(arguments first)
    note take
    note
  )
)
