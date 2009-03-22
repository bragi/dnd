Help = Origin mimic do(
  failure = method(reason,
    result = [reason, usage] join("\n")
    result map = macro(self)
    result join = macro(self)
    result toText = macro(self)
  )
  
  usage = method(
    "Use one of the following commands:
add    - add new note
delete - deletes existing note
help   - prints this help
list   - lists notes" println
  )
)
