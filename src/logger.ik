Logger = Origin mimic do(
  out = System err
  
  silence = macro(
    macro()
  )
  
  talk = macro(
    macro(
      out println("#{call arguments first}: #{call arguments first evaluateOn(call ground)}")
    )
  )
  
  debug = talk
)

Ground logger = Logger mimic