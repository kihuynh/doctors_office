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


end
