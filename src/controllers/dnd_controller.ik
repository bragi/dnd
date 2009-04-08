DndController = CommandController mimic do(
  add = method(arguments,
    note = Note mimic(text: arguments first, tag: arguments second) save
    note
  )

  delete = method(arguments,
    note = Notes find(arguments first)
    note delete
    note
  )

  done = method(arguments,
    note = Notes find(arguments first)
    note done
    note
  )

  help = macro()

  list = ListController mimic

  move = method(arguments,
    note = Notes find(arguments first)
    note tag = arguments second
    note save
    note
  )

  take = method(arguments,
    note = Notes find(arguments first)
    note take
    note
  )
)

DndController View = CommandController View mimic do(
  default = method(
    model mimic!(DndController NotePresenter) toText
  )

  help = method(
    "Use one of the following commands:
add    - add new note
delete - deletes existing note
help   - prints this help
list   - lists notes"
  )
)

DndController NotePresenter = Origin mimic do(
  toText = method(
    "Id:    #{id}
Note:  #{text}
Inbox: #{tag}
State: #{state}"
  )
)