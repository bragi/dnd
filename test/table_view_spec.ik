use("ispec")
use("table_view")

describe(TableView,
  it("renders simple table",
    table = TableView mimic
    table column("id", align: :right)
    table column("name")
    table row(1, "apple")
    table row(2, "orange")
    table asText should == " id | name   
----+--------
  1 | apple  
  2 | orange "
  )
)

describe(TableView Column,
  it("has proper contentWidth",
    column = TableView Column mimic
    TableView Cell mimic("a", column)
    TableView Cell mimic("longer", column)
    column contentWidth should == 6
  )
)

describe(TableView Cell,
  describe("when asked for text representation",
    it("shows content when column has the same width as cell",
      column = TableView Column mimic
      a = TableView Cell mimic("a", column)
      a asText should == " a "
    )

    it("shows content with padding when column is wider then cell",
      column = TableView Column mimic
      a = TableView Cell mimic("a", column)
      column contentWidth = 7
      a asText should == " a       "
    )

    it("shows content with padding when column is wider then cell and align is right",
      column = TableView Column mimic(align: :right)
      a = TableView Cell mimic("a", column)
      column contentWidth = 7
      a asText should == "       a "
    )
  )
)