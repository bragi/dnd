ShellController = Origin mimic do(
  action = macro(
    name = call arguments first
    code = 
    actions << name
    cell(name) = method(*(call arguments rest))
  )
  
  actions = []
  
  route = method(commandLine,
    actionName = commandLine.first
    if(actions include?(actionName),
      
    )
  )
)


