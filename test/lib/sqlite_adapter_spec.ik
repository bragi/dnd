use("ispec")
use("lib/sqlite_adapter")

describe(SqliteAdapter,
  after(
    FileSystem removeFile!("test/fixtures/test.db")
  )

  it("has connection to database",
    SqliteAdapter connection("test/fixtures/test.db")
  )

  describe("with existing connection",
    before(
      connection = SqliteAdapter connection("test/fixtures/test.db")
    )

    it("has proper kind of connection",
      connection kind should == "SqliteAdapter Connection"
    )

    it("creates table",
      connection execute("CREATE TABLE test(id, name)")
    )
  )
)