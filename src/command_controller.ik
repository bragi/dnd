CommandController = Origin mimic do(
  View = Origin mimic do(
    pass = macro(
      model println
    )
    
    error = method(condition, arguments,
      "Error #{condition}, arguments: #{arguments}"
    )
  )
  
  chain = method(nextController,
    fnx(arguments,
      nextController mimic route(arguments)
    )
  )
  
  defaultCommand = macro(error!(CommandController Error UnknownCommand))
  
  initialize = method(
    self view = View mimic
    self flash = nil
    self result = 0
  )
  
  pass = macro(error!(CommandController Error UnknownCommand))
  
  process = method(arguments,
    self template = arguments first
    bind(
      rescue(Condition Error,
        fn(c, view error(c, arguments))
      )
      view model = route(arguments)
      view send(template) println
      return(result)
    )
  )
  
  route = method(arguments,
    if(arguments length == 0,
      defaultCommand(arguments),
      send(arguments first, arguments rest)
    )
  )
)

CommandController Error = Condition Error mimic
CommandController Error UnknownCommand = CommandController Error mimic
