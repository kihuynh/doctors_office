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

    # describe("#name") do
    #   it("input a patient's name and DOB") do
    #     patient = Patient.new({:name => "Joey", :dob => "2008-01-01 00:00:00"})
    #     expect(Patient.name()).to(eq("Joey"))
    #   end
    # end

end
