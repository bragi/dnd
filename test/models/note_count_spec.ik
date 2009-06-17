use("ispec")
use("environment")

describe(NoteCount,
  before(
    Dnd resetDatabase
  )
  
  it("should provide next count",
    NoteCount next should == 1
    NoteCount next should == 2
    NoteCount next should == 3
    NoteCount next should == 4
  )
)
