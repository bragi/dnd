#!/usr/bin/env ioke

Database = Origin mimic do(
  fileName = "dnd.txt"

  all = method(
    FileSystem readFully(fileName) split("\n")
  )
)

Note = Origin mimic do(
  initialize = method(text,
    @text = text)

  all = method(
    Database all map(
      self
    )
  )
)

Command = Origin mimic do(
  initialize = method(model,
    self model = model
    self)
  recognize = method(arguments,
    case(arguments first,
      "add", model add(arguments second),
      "list", model all
      )
  )
)

argv = System programArguments

