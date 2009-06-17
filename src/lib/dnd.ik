Dnd = Origin mimic
Dnd initDatabase = method(
  unless(database exists?, database create!)
  CouchDB Persistent database = database
)

Dnd cleanupDatabase = method(
  if(database exists?, database destroy!)
)

Dnd resetDatabase = method(
  cleanupDatabase
  initDatabase
)

if(cell?(:ISpec),
  ; In tests we use different database, we also create and delete it on every test for now
  Dnd database = CouchDB database("http://127.0.0.1:5984/dnd_test"),

  ; In production initialize the database
  Dnd database = CouchDB database("http://127.0.0.1:5984/dnd")
  Dnd initDatabase
)
