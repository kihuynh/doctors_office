require('rspec')
require('doctor')
require('pg')

DB = PG.connect({:dbname => 'doctors_office_test'})


describe(Doctor) do
  describe(".all") do
    it("empty doctor list") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe("save") do
    it("adds doctors to the list") do
      doc = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatologist'})
    end
  end

  describe('#==') do
    it("same doctor with same name and specialty") do
      doctor1 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology'})
      doctor1 = Doctor.new({:name => 'Lorenzo', :specialty => 'Dermatology'})
      expect(doctor1).to(eq(doctor2))
    end
  end
end
