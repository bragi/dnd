Text truncate = method(length: 50, elipsis: "...",
  if(self length <= length,
    self,
    
    cutLength = length - elipsis length
    
    self[0..length] + elipsis
  )
)