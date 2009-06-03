Logger = Origin mimic do(
  talk = macro(
    macro(
      messageOrCode = call arguments first
      text = if(messageOrCode kind?("Text"),
        messageOrCode,

        "#{call arguments first}: #{call arguments first evaluateOn(call ground)}"
      )
      out println(text)
      self
    )
  )
)

Ground logger = Logger mimic