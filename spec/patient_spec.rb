require('rspec')
require('patient')
require('pg')

DB = PG.connect({:dbname => 'doctors_office_test'})


describe(Patient) do

  describe(".all") do
      it("starts off with no patient") do
        expect(Patient.all()).to(eq([]))
      end
    end

    describe("#save") do
      it("add a patient's name and DOB to save") do
        patient = Patient.new({:name => "Joey", :dob => "2008-01-01 00:00:00"})
        patient.save()
        expect(Patient.all()).to(eq([patient]))
      end
    end

end
