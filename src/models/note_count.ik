NoteCount = CouchDB Persistent mimic

NoteCount do(
  id = "note_count"

  next = method(
    value = database loadObject(id)
    if(value,
      count = value["count"]
      if(count,
        count = count toRational
        value["count"] = (count + 1) asText
        database saveObject(value)
        count,
        
        value["count"] = "1"
        database saveObject(value)
        1
      ),
      
      database saveObject(dict("_id" => id, "count" => "2"))
      1
    )
  )
)
