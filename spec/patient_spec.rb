require('rspec')
require('pg')
require('patient')


DB = PG.connect({:dbname => 'doctors_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM patients *;")
  end
end

describe(Patient) do

  describe('.all') do
      it('starts off with an empty array') do
        expect(Patient.all()).to(eq([]))
      end
    end

    describe('#save') do
      it('add a patient name and DOB to save') do
        patient = Patient.new({:name => "Joey", :dob => "2008-01-01 00:00:00", :id => nil})
        patient.save()
        expect(Patient.all()).to(eq([patient]))
      end
    end

  describe('#==') do
    it('same patient with the same name') do
      patient1 = Patient.new({:name => 'Aria', :dob => '1999-03-08 00:00:00', :id => nil})
      patient2 = Patient.new({:name => 'Aria', :dob => '1999-03-08 00:00:00', :id => nil})
      expect(patient1).to(eq(patient2))
    end
  end

end
