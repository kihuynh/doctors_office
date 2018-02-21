require('rspec')
require('doctor')
require('pg')
require('spec_helper')


describe(Doctor) do
  describe(".all") do
    it("empty doctor list") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe('save') do
    it('adds doctors to the list') do
      doc = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatologist', :id => nil})
      doc.save()
      expect(Doctor.all()).to(eq([doc]))
    end
  end

  # describe('#list_id') do
  #   it("says what doctor_id belongs to patient") do
  #     test_patient = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatologist'})
  #     expect(test_patient.patient_id()).to(eq(1))
  #   end
  # end

  # overrides duplicates (look again on lesson)
  describe('#==') do
    it("same doctor with same name and specialty") do
      doctor1 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :id => nil})
      doctor2 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
