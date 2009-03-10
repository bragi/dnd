CommandController = Origin mimic do(
  defaultCommand = method()
  
  route = method(arguments,
    case(arguments length,
      0, defaultCommand,
      1, send(arguments first),
      else, send(arguments first, arguments rest))
  )
)