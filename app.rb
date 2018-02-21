require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => "doctors_office"})
# restful something. took photos.
get('/') do
  erb(:input)
end

get('/output') do
  erb(:output)
end
