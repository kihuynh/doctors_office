class Doctor
  attr_reader(:name, :specialty, :patient_id)
  # attr table similar to datatable.
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @patient_id = attributes.fetch(:patient_id)
  end

  def self.all
    returned_doctors = DB.exec('SELECT * FROM doctors;')
    doctors_list = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch('name')
      specialty = doctor.fetch('specialty')
      # So it can grab the foreign key.
      patient_id = doctor.fetch('patient_id').to_i()
      # push new doctor info into doctor list
      doctors_list.push(Doctor.new({:name => name, :specialty => specialty, :patient_id => patient_id}))
    end
    doctors_list
  end

  def save
    result = DB.exec("INSERT INTO doctors (name, specialty, patient_id) VALUES ('#{@name}', '#{@specialty}', #{@patient_id});")
    # patient_list doesn't have ' ' around the #{} because want patient_list go into data as an integer
  end

  def ==(other_doctor)
    self.name().==(other_doctor.name())
  end


end
