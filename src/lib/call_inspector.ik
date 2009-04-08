CallInspector = Origin mimic do(
  nesting = 0

  entering = lecrox(
    "#{"| " * nesting}+called #{call receiver}:#{call message name}(#{call arguments})" println
    nesting ++
  )

  leaving = lecrox(
    nesting --
    "#{"| " * nesting}\\returned #{aspectResult asText truncate}" println
  )
  
  instrument = method(+objects,
    objects each(object,
      object before(matching: :anyFromSelf) << entering
      object after(matching: :anyFromSelf) << leaving
    )
  )
)
