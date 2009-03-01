#!/usr/bin/env ioke

NoteCollection = Origin mimic do (
  
  [] = method(collection,
    collection.each(item,
      all << Note build(item first, item second)))

  add = method(note,
    id = maxId
    note id = id
    all << note
    saveAll)

  all = method(
    self all = []
    readAll)

  collectionFile = method(
    unless(FileSystem exists?(file_name),
      ; Create directory
      ; Create empty file
      )
    file_name)

  file_name = "~/.dnd/database.ik"

  maxId = method(
    all map(id) max)

  readAll = method(
    use(collectionFile))

  saveAll = method(
    FileSystem withOpenFile(file_name,
      all each(it, f << it to_ioke)))

  to_ioke = method(
    "NoteCollection[
#{all map(to_ioke) join("\n")}
    ]"))

Note = Origin mimic do(

  add = method(text,
    note = self mimic(text)
    all << note
    note)
    
  build = method(id, text,
    note = mimic
    note id = id
    note text = text
    note)

  println = method(
    "#{id} #{text}" println))

Command = Origin mimic do(
  recognize = method(arguments,
    case(arguments first,
      "add", add(arguments second),
      "list", list
      ))
  add = method(text,
    Note add(text))

  list = method(
    Note each(println))
)

argv = System programArguments

