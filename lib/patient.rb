#!/usr/bin/ruby

class Patient
  attr_reader(:name, :dob)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @dob = attributes.fetch(:dob)
  end


end
