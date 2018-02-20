#!/usr/bin/ruby

class Patient
  attr_reader(:name, :dob)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:dob)
  end

  def self.all
      returned_patients = DB.exec("SELECT * FROM patients;")
      patient_lists = []
      returned_patients.each() do |patient|
        name = patient.fetch("name")
        dob = patient.fetch("dob")
        id = patient.fetch("id").to_i()
        patient_lists.push(Patient.new({:name => name, :dob => dob}))
      end
      patient_lists
  end


  def save
    DB.exec("INSERT INTO patients (name, dob) VALUES ('#{@name}', '#{@dob}') RETURNING id;")
  end
  #
  def ==(other_patient)
    self.name().==(other_patient.name())
  end
  
end
