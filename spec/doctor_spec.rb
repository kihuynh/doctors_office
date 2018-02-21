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
      doc = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatologist', :patient_id => 1})
      doc.save()
      expect(Doctor.all()).to(eq([doc]))
    end
  end

  describe('#list_id') do
    it("says what patient_id belongs to doc") do
      test_patient = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatologist', :patient_id => 1})
      expect(test_patient.patient_id()).to(eq(1))
    end
  end

  # overrides duplicates (look again on lesson)
  describe('#==') do
    it("same doctor with same name and specialty") do
      doctor1 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :patient_id => 1})
      doctor2 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :patient_id => 1})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
