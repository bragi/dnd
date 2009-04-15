
TableView = Origin mimic
TableView Cell = Origin mimic
TableView Column = Origin mimic

TableView do(

  initialize = method(
    self columns = []
    self headers = []
    self rows = []
    rows << []
  )

  asText = method(
    header = headers map(asText) join("|")
    underline = columns map(asText) join("+")
    data = (rows rest map(map(asText) join("|"))) join("\n")
    [header, underline, data] join("\n")
  )

  column = method(name nil, align: :left,
    column = Column mimic(align: align)
    if(name,
      headers << Cell mimic(name, column)
    )

    columns << column
  )

  row = method(+data,
    row = []
    data zip(columns) each(valueColumn,
      c = Cell mimic(*valueColumn)
      row << c
    )
    rows << row
  )

  rowSeparator = "|"
)

TableView Cell do(
  initialize = method(content, column,
    self content = content asText
    self column = column
    column cs << self
  )

  asText = method(
    sign = if(column align == :left, "-", "")
    " %#{sign}#{column contentWidth}s " % content
  )

  contentWidth = method(content length)
)

TableView Column do(
  initialize = method(align: :left,
    self align = align
    self cs = []
  )

  asText = method("-" * (contentWidth + 2))

  contentWidth = method(cs map(contentWidth) max)
)
