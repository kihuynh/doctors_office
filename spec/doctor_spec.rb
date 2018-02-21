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



end
