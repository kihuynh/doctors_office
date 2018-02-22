#!/usr/bin/ruby

class Patient
  attr_reader(:name, :dob, :doctor_id, :id)
  # add :id back into reader to initialize the id in .all
  def initialize(attributes)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:dob)
    @doctor_id = attributes.fetch(:doctor_id)
    @id = attributes.fetch(:id)
  end

  def self.all
      returned_patients = DB.exec('SELECT * FROM patients;')
      patient_lists = []
      returned_patients.each() do |patient|
        # for each patient grab each info
        name = patient.fetch('name')
        dob = patient.fetch('dob')
        id = patient.fetch('id').to_i()
        doctor_id = patient.fetch('doctor_id').to_i()
        # push all new patient info into patient list
        patient_lists.push(Patient.new({:name => name, :dob => dob, :doctor_id => doctor_id, :id => id}))
      end
      patient_lists
  end


  def save
    result = DB.exec("INSERT INTO patients (name, dob, doctor_id) VALUES ('#{@name}', '#{@dob}', #{@doctor_id}) RETURNING id;")
    @id = result.first().fetch('id').to_i()
  end
  #
  def ==(other_patient)
    self.name().==(other_patient.name())
  end

end
