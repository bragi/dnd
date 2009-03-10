#!/usr/bin/env ioke

use("database")
use("command_controller")

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
      Note build(*entry)
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

  toDatabase = method(separator ",",
    [id, text, state] join(separator)
  )
    
  toText = method(
    "#{id}:\t #{text}\t (#{state})"
  )
    
  build = method(id, text, state,
    note = mimic
    note id = id
    note text = text
    note state = state
    note
  )
  
  initialize = method(text nil,
    self text = text
    self state = "created"
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


Commands = CommandController mimic do(
  add = method(arguments,
    note = Note mimic(arguments first) save
    note toText println
  )
  
  help = method(
    Help println
  )

  list = method(
    NoteCollection all each(toText println)
  )

  pass = macro(
    "Unknown command #{call message name}" println
    help
  )
)

Commands mimic route(System programArguments)
