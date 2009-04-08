CommandController = Origin mimic 

CommandController Error = Condition Error mimic
CommandController Error UnknownCommand = CommandController Error mimic

CommandController do(

  defaultCommand = macro(error!(CommandController Error UnknownCommand))
  
  initialize = method(
    self flash = nil
    self model = nil
    self result = 0
    self template = :default
  )
  
  process = method(arguments,
    bind(
      rescue(Condition Error,
        fn(c, view error(c, arguments))
      )
      controller = route(arguments)
      view = (controller cell?(:view) && controller view) || controller View mimic
      view model = controller model
      template = controller template || :default
      unless(view cell?(template),
        template = :default
      )
      view send(template) println
      System exit(controller result)
    )
  )
  
  route = method(arguments,
    controller = self
    action = arguments first
    arguments = arguments rest
    controller template = action
    
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

CommandController View = Origin mimic do(
  default = macro(
    model
  )
  
  error = method(condition, arguments,
    "Error #{condition}, arguments: #{arguments}"
  )
)
