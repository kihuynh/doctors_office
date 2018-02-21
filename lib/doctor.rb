class Doctor
  attr_reader(:name, :specialty)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors_list = []
  end
end
