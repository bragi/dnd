CommandController = Origin mimic do(
  defaultCommand = method()
  
  route = method(arguments,
    if(arguments length == 0,
      defaultCommand(arguments),
      send(arguments first, arguments rest)
    )
  )
)