use("ispec")
use("model/database")

describe(Database Entry,
  it("has Dict representation",
    Database Entry mimic([:id, :text], [1, "text"]) toDict should == {}(id: 1, text: "text", savedRecord: true)
  )
)