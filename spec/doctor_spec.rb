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

  describe('#==') do
    it("same doctor with same name and specialty") do
      doctor1 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :id => nil})
      doctor2 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology', :id => nil})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
