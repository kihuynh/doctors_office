require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => "doctors_office"})
# restful something. took photos.
get('/') do
  # Display home page
  erb(:home)
end
#
get('/doctors') do
# Display current doctor info
  erb(:doctors)
end

get('/patients') do
  # Display current Patients
  erb(:patients)
end
