CommandController = Origin mimic do(
  defaultCommand = macro(raise(CommandController Error UnknownCommand mimic))
  
  route = method(arguments,
    if(arguments length == 0,
      defaultCommand(arguments),
      send(arguments first, arguments rest)
    )
  )
)

CommandController Error = Origin mimic
CommandController Error UnknownCommand = CommandController Error mimic