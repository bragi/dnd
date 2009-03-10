#!/usr/bin/env ioke

use("database")

NoteCollection = Origin mimic do (
  
  add = method(note,
    id = maxId + 1
    note id = id
    all << note
    saveAll
    note
  )

  all = method(
    self all = Database all map(entry,
      Note build(entry first, entry second)
    )
  )

  maxId = method(
    all map(id toRational) max || 0
  )

  saveAll = method(
    Database save(all)
  )
)

Note = Origin mimic do(

  asCsv = method(separator ",",
    [id, text] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}"
  )
    
  build = method(id, text,
    note = mimic
    note id = id
    note text = text
    note
  )
  
  initialize = method(text nil,
    self text = text
    self
  )
  
  save = method(
    NoteCollection add(self)
  )
)

Help = Origin mimic do(
  println = method(
    "Use one of the following commands:
add  - add new note
help - prints this help
list - lists notes" println
  )
)


Command = Origin mimic do(
  add = method(text,
    note = Note mimic(text) save
    note toText println
  )
  
  defaultCommand = method(help)
    
  help = method(
    Help println
  )

  list = method(
    NoteCollection all each(asText println)
  )

  route = method(arguments,
    case(arguments length,
      0, defaultCommand,
      1, send(arguments first),
      else, send(arguments first, arguments rest))
  )
  
  pass = macro(
    "Unknown command #{call message name}" println
    help
  )
)

Command mimic route(System programArguments)
