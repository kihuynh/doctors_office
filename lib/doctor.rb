class Doctor
  attr_reader(:name, :specialty, :id)
  # attr table similar to datatable.
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors_list = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      id = doctor.fetch('id').to_i()
      # So it can grab the foreign key.
      # push new doctor info into doctor list
      doctors_list.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors_list
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch('id').to_i()
    # patient_list doesn't have ' ' around the #{} because want patient_list go into data as an integer
  end

  def ==(other_doctor)
    self.name().==(other_doctor.name())
  end


end
