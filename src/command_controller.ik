CommandController = Origin mimic do(
  defaultCommand = macro(raise(CommandController Error UnknownCommand mimic))
  
  route = method(arguments,
    model = if(arguments length == 0,
      defaultCommand(arguments),
      send(arguments first, arguments rest)
    )
    view(model)
  )
  
  view = method(model,
    model asText println
  )
)

CommandController Error = Condition Error mimic
CommandController Error UnknownCommand = CommandController Error mimic