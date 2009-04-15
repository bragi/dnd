desc "Runs tests"
task :test do
  exec "CP=lib/sqlitejdbc-v054.jar ioke -J-Djdbc.drivers=org.sqlite.JDBC -I src `which ispec` test"
end

task :default => :test
