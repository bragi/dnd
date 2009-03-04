#!/usr/bin/env ioke

System userHome = method(
  Origin java:lang:System getProperty("user.home"))

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
    self all = List mimic
    readAll)

  asIoke = method(
    "NoteCollection[
#{all map(to_ioke) join("\n")}
    ]")
    
  collectionFile = method(
    unless(FileSystem exists?(storageFullPath),
      initializeCollection)
    storageFullPath)
    
  initializeCollection = method(
    unless(FileSystem exists?(storageDir),
      FileSystem createDirectory!(storageDir))
    FileSystem withOpenFile(storageFullPath, fn(f, f println(""))))

  maxId = method(
    all map(id) max)

  readAll = method(
    bind(
      rescue(Condition Error Load, fn(c,
        println "Could not load file: #{c}"))
      use(collectionFile)))

  saveAll = method(
    FileSystem withOpenFile(file_name,
      all each(it, f << it to_ioke)))


  storageDir = method(
    "#{System userHome}/.dnd")

  storageFileName = "database.ik"

  storageFullPath = method(storageDir + "/" + storageFileName))

Note = Origin mimic do(

  add = method(text,
    note = self mimic(text)
    all << note
    note)

  asIoke = method(
    "[#{id}, \"#{text}\"]")
    
  asText = method(
    "#{id}:\t #{text}")
    
  build = method(id, text,
    note = mimic
    note id = id
    note text = text
    note))

Command = Origin mimic do(
  add = method(text,
    Note add(text))
    
  displayHelp = method(
    "Use one of the following commands:
add  - add new note
help - prints this help
list - lists notes" println)

  init = method(
    NoteCollection initializeCollection)

  list = method(
    NoteCollection all each(asText println))

  recognize = method(arguments,
    if(arguments empty?, displayHelp,
      case(arguments first,
        "add", add(arguments second),
        "init", init
        "list", list
        )))
)

Command mimic recognize(System programArguments)

