use("table_view")
ListController = CommandController mimic do(

  active = method(arguments, NoteCollection active)

  all = method(arguments, NoteCollection all)

  created = method(arguments, NoteCollection created)

  defaultCommand = method(arguments,
    self template = "dashboard"
  )

  deleted = method(arguments, NoteCollection deleted)

  done = method(arguments, NoteCollection done)

  help = macro()
)

ListController View = CommandController View mimic do(
  default = method(
    if(model empty?,
      "No tasks added",

      model mimic!(ListController CollectionPresenter) toText
    )
  )

  help = method(
    "Use one of the following commands:
list         - list only new notes
list active  - active notes
list all     - all created notes (including deleted)
list created - only new notes
list deleted - deleted notes
list done    - done notes"
  )

  dashboard = method(
    screen = []
    if(NoteCollection taken empty?,
      screen << "No current tasks",

      screen << "Taken tasks:"
      NoteCollection taken mimic!(ListController CollectionPresenter) toText
    )

    if(NoteCollection created empty?,
      screen << "No tasks added",

      screen << "Available tasks"
      screen << NoteCollection created mimic!(ListController CollectionPresenter) toText
    )
    screen join("\n")
  )
)

ListController CollectionPresenter = Origin mimic do(
  toText = method(
    table = TableView mimic
    table column("Id", align: :right)
    table column("Note")
    table column("Project")
    table column("State")
    each(note, table row(note id, note text, note tag, note state))
    table asText
  )
)