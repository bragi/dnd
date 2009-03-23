CommandController = Origin mimic do(
  View = Origin mimic do(
    pass = macro(
      model println
    )
    
    error = method(condition, arguments,
      "Error #{condition}, arguments: #{arguments}"
    )
  )
  
  defaultCommand = macro(error!(CommandController Error UnknownCommand))
  
  initialize = method(
    self flash = nil
    self model = nil
    self result = 0
    self template = :default
    self view = self View mimic
  )
  
  process = method(arguments,
    bind(
      rescue(Condition Error,
        fn(c, view error(c, arguments))
      )
      controller = route(arguments)
      view = controller view
      logger debug(controller asText)
      logger debug(controller view asText)
      logger debug(controller model asText)
      view model = controller model
      view send(controller template) println
      System exit(controller result)
    )
  )
  
  route = method(arguments,
    controller = self
    action = arguments first
    arguments = arguments rest
    controller template = arguments first
    
    if(action && controller cell?(action) && controller cell(action) kind?("CommandController"),
      controller = controller cell(action) route(arguments),
      
      controller model = if(action,
        controller send(action, arguments),
        
        controller defaultCommand(arguments)
      )
    )
    controller
  )
)

CommandController Error = Condition Error mimic
CommandController Error UnknownCommand = CommandController Error mimic
