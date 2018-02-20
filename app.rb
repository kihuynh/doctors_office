require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/doctor')
#add require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => "doctors_office"})

get('/') do
  erb(:input)
end

get('/output') do
  erb(:output)
end
