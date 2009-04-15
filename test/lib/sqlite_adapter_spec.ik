use("ispec")
use("lib/sqlite_adapter")

describe(SqliteAdapter,
  after(
    FileSystem removeFile!("test/fixtures/test.db")
  )
  
  it("has connection to database",
    SqliteAdapter with(database: "test/fixtures/test.db") connection
  )
)