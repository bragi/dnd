use("lib/builtin_extensions")

Database = Origin mimic do(
  all = method(
    self all = if(databaseExists?,
      readDatabase,
      List mimic
    ) map(data, Entry mimic(columns, data))
  )

  createDirectoryIfNeeded = method(
    unless(FileSystem exists?(storageDir),
      FileSystem createDirectory!(storageDir)
    )
  )

  databaseExists? = method(
    FileSystem exists?(storageFullPath)
  )

  initialize = method(columns,
    self columns = columns
  )

  readDatabase = method(
    FileSystem readFully(storageFullPath) split("\1") map(split("\0"))
  )

  save = method(collection,
    createDirectoryIfNeeded
    FileSystem withOpenFile(storageFullPath,
      fn(f,
        f print(collection map(toDatabase("\0")) join("\1"))
      )
    )
  )

  storageDir = method(
    "#{System userHome}/.dnd"
  )

  storageFileName = "database"

  storageFullPath = method(storageDir + "/" + storageFileName)
)

Database Entry = Origin mimic do(
  initialize = method(columns, data,
    self columns = columns
    self data = data
  )

  toDict = method(
    {}() addKeysAndValues(columns, data) merge(savedRecord: true)
  )
)
