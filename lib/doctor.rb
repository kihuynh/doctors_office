class Doctor
  attr_reader(:name, :specialty, :id)

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    # initialize @patient_list
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors_list = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      # comment out id.
      # insert patient_list for doctor to fetch
      # So it can grab the foreign key.
      # id = doctor.fetch('id').to_i()
      # doctors_list.push(Doctor.new({:name => name, :specialty => specialty, :id => nil}))
    end
    doctors_list
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}', #{@patient_list}) RETURNING id;")
    # patient_list doesn't have ' ' around the #{} because want patient_list go into data as an integer
    # @id = result.first().fetch('id').to_i()
  end

  def ==(other_doctor)
    self.name().==(other_doctor.name())
  end


end
