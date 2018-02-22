require('rspec')
require('pg')
require('patient')
require('spec_helper')

describe(Patient) do

  describe('.all') do
      it('starts off with an empty array') do
        expect(Patient.all()).to(eq([]))
      end
    end

    describe('#save') do
      it('add a patient name and DOB to save') do
        patient = Patient.new({:name => "Joey", :dob => "2008-01-01 00:00:00", :doctor_id => 1, :id => nil})
        patient.save()
        expect(Patient.all()).to(eq([patient]))
      end
    end

    describe('#list_id') do
      it("says what patient_id belongs to doctor") do
        test = Patient.new({:name => 'Banana', :dob => "1999-09-09 00:00:00", :doctor_id => 1, :id => nil})
        expect(test.doctor_id()).to(eq(1))
      end
    end

  describe('#==') do
    it('same patient with the same name') do
      patient1 = Patient.new({:name => 'Aria', :dob => '1999-03-08 00:00:00', :doctor_id => 1, :id => nil})
      patient2 = Patient.new({:name => 'Aria', :dob => '1999-03-08 00:00:00', :doctor_id => 1, :id => nil})
      expect(patient1).to(eq(patient2))
    end
  end

end
