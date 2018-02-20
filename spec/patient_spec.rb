require('rspec')
require('patient')
require('pg')

DB = PG.connect({:dbname => 'doctors_office_test'})


describe(Patient) do
  it("create new project") do
  expect().to(eq())
   end
end
