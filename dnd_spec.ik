use("dnd")

describe(Database,
  it("should read database file",
    Database fileName = "test.txt"
    Database all should == ["Line 1", "Line 2"]
  )
)

describe(Note,
  it("should create new with given text",
    note = Note mimic("Hello")
    note text should == "Hello"
  )
)

describe(Command,
  it("should recognize add command",
    model = Origin mimic
    model add = method(what, self added = what)
    Command mimic(model) recognize(["add", "Text to add"])
    model added should == "Text to add"
  )
  
  it("should recognize list command",
    model = Origin mimic
    model all = method(self called = true)
    Command mimic(model) recognize(["list"])
    model called should == true
  )
)