require('rspec')
require('doctor')
require('pg')

DB = PG.connect({:dbname => 'doctors_office_test'})


describe(Doctor) do
  it("create new project") do
  expect().to(eq())
   end
end
