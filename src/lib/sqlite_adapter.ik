SqliteAdapter = Origin mimic
SqliteAdapter do(
  Connection = Origin mimic do(
    connect = method(database,
      with(database: Origin java:sql:DriverManager getConnection("jdbc:sqlite:#{database}"))
    )

    execute = method(sql,
      database createStatement executeUpdate(sql)
    )
  )

  connection = method(database,
    Connection connect(database)
  )
)