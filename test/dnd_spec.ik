use("ispec")
use("dnd")

describe(Note,
  it("should have id when built",
    Note build(3, "Hello") id should == 3)

  it("should have text when built",
    Note build(3, "Hello") text should == "Hello")
  
  it("should have text representation",
    Note build(3, "Hello") toText should == "3:\t Hello"))
    

describe(Command,
  it("should recognize add command",
    let(Command add = method(what, self added = what),
      Command recognize(["add", "Text to add"])
      Command added should == "Text to add"))
  
  it("should recognize list command",
    model = Origin mimic
    model all = method(self called = true)
    Command mimic(model) recognize(["list"])
    model called should == true))