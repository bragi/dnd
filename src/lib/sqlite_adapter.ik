SqliteAdapter = Origin mimic
SqliteAdapter do(

  connection = method(
    self connection = Origin java:sql:DriverManager getConnection("jdbc:sqlite:#{database}")
  )
)