#!/usr/bin/env ioke

System userHome = method(
  Origin java:lang:System getProperty("user.home"))
  
Database = Origin mimic do(
  all = method(
    self all = if(databaseExists?,
      readDatabase,
      List mimic
    )
  )
    
  databaseExists? = method(
    FileSystem exists?(storageFullPath)
  )
    
  readDatabase = method(
    FileSystem readFully(storageFullPath) split("\n") map(split(";"))
  )
    
  save = method(collection,
    createDirectoryIfNeeded
    FileSystem withOpenFile(storageFullPath, 
      fn(f,
        f print(collection map(asCsv(";")) join("\n"))
      )
    )
  )

  storageDir = method(
    "#{System userHome}/.dnd"
  )

  storageFileName = "database"

  storageFullPath = method(storageDir + "/" + storageFileName)
)

NoteCollection = Origin mimic do (
  
  add = method(note,
    id = maxId
    note id = id
    all << note
    saveAll
  )

  all = method(
    self all = Database all map(entry,
      Note build(entry first, entry second)
    )
  )

  maxId = method(
    all map(id) max
  )

  saveAll = method(
    Database save(all)
  )
)

Note = Origin mimic do(

  add = method(text,
    note = self mimic(text)
    all << note
    note
  )

  asCsv = method(separator ",",
    [id, text] join(separator)
  )
    
  asText = method(
    "#{id}:\t #{text}"
  )
    
  build = method(id, text,
    note = mimic
    note id = id
    note text = text
    note
  )
)

Command = Origin mimic do(
  add = method(text,
    Note add(text)
  )
    
  displayHelp = method(
    "Use one of the following commands:
add  - add new note
help - prints this help
list - lists notes" println
  )

  list = method(
    NoteCollection all each(asText println)
  )

  recognize = method(arguments,
    if(arguments empty?, displayHelp,
      case(arguments first,
        "add", add(arguments second),
        "list", list
      )
    )
  )
)

Command mimic recognize(System programArguments)
