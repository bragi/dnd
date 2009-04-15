use("ispec")
use("controllers/command_controller")
use("controllers/list_controller")
use("controllers/dnd_controller")

describe(DndController,
  it("uses ListController to handle list command",
    let(ListController defaultCommand, macro(self result = 77),
      DndController mimic route(["list"]) should == 77
    )
  )
)