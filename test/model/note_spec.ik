use("ispec")
use("model/database")
use("model/note")

describe(Note,
  describe("when creating",
    it("does not require arguments",
      Note mimic
    )
    
    it("has created state by default",
      note = Note mimic
      note state should == "created"
    )

    it("assigns given argument",
      note = Note mimic(text: "text")
      note text should == "text"
    )
    
    it("has attributes from Database Entry",
      note = Note mimic(* Database Entry mimic([:id, :text], [1, "text"]) toDict)
      note id should == 1
      note text should == "text"
    )
    
    it("is a saved record",
      Note mimic(savedRecord: true) savedRecord should be true
    )
  )
)
