use("builtin_extensions")

Database = Origin mimic do(
  all = method(
    self all = if(databaseExists?,
      readDatabase,
      List mimic
    )
  )
  
  createDirectoryIfNeeded = method(
    unless(FileSystem exists?(storageDir),
      FileSystem createDirectory!(storageDir)
    )
  )
    
  databaseExists? = method(
    if(FileSystem exists?(storageFullPath),
      "Reading database" println
      true,
      "No database" println
      false
    )
  )
    
  readDatabase = method(
    FileSystem readFully(storageFullPath) split("\n") map(split("\0"))
  )
    
  save = method(collection,
    createDirectoryIfNeeded
    FileSystem withOpenFile(storageFullPath, 
      fn(f,
        f print(collection map(asCsv(";")) join("\0"))
      )
    )
  )

  storageDir = method(
    "#{System userHome}/.dnd"
  )

  storageFileName = "database"

  storageFullPath = method(storageDir + "/" + storageFileName)
)
