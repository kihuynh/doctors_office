require('sinatra')
require('sinatra/reloader')
also_reload('lib/**.*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')
require('pry')

DB = PG.connect({:dbname => "doctors_office"})
# restful something. took photos.
get('/') do
  # Display home page
  erb(:home)
end
#
get('/doctors') do
# Display current doctor info
  @doctors = Doctor.all()
  erb(:doctors)
end

get('/patients') do
  # Display current Patients
  @patients = Patient.all()
  erb(:patients)
end

get('/doctors-new') do
# new doctor form
  erb(:doctors_new)
end
get('/patients-new') do
# new doctor form
  erb(:patients_new)
end

post('/patients') do
  # new patient information. params and such to save
  name = params.fetch('name')
  dob = params.fetch('dob')
  patient = Patient.new({:name => name, :dob => dob, :doctor_id => nil, :id => nil})
  patient.save()
  # Look at RESTFUL lesson for post
  @patient = Patient.all()
  erb(:patients_new)
end
#
# post('/doctors_new') do
# # new doctor information. params and such and saving and stuff
#   name = params.fetch('name')
#   specialty = params.fetch('specialty')
#   doc = Doctor.new({:name => name, :specialty => specialty, :id => nil})
#   doc.save()
#   @doctors = Doctor.all()
#   erb(:doctors_new)
# end
