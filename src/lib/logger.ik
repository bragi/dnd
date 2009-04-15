Logger = Origin mimic do(
  out = System err

  ignore = macro(
    macro()
  )

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

  level = method(level,
    case(level,
      :info,
        self debug = ignore
        self info = talk
        self warn = talk
        self error = talk,
      :warn,
        self debug = ignore
        self info = ignore
        self warn = talk
        self error = talk,
      :error,
        self debug = ignore
        self info = ignore
        self warn = ignore
        self error = talk,
      else,
        self debug = talk
        self info = talk
        self warn = talk
        self error = talk
    )
  )

  level(:debug)
)

Ground logger = Logger mimic