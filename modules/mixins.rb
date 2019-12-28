#!usr/bin/env ruby

# An arbitrary Person class with a few features.
class Person
  attr_accessor :first_name, :last_name
  attr_accessor :city, :state, :zip
  attr_accessor :age, :gender

  def full_name
    "#{first_name} #{last_name}"
  end

  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end 

# Splitting its functionality into modules allow them to be resused across multiple classes. 
module Nameable
  attr_accessor :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end

module Contactinfo
  attr_accessor :city, :state, :zip

  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end

# Using include, modules can be mixed in in multiple classes, sharing only desired functionality without inheriting all aspects of a parent class.
class Person
  include Nameable
  include Contactinfo
  attr_accessor :age, :gender
end

class Customer
  include Nameable
  include Contactinfo
end 

class Supplier
  include Nameable
  include Contactinfo
end

# Creating an intance of each class and setting values.
person = Person.new
person.first_name = "Jon"
person.last_name = "Snow"
person.age = 23

customer = Customer.new
customer.first_name = "Cersei"
customer.last_name = "Lannister"

supplier = Supplier.new
supplier.first_name = "Tycho"
supplier.last_name = "Nestoris"

# Classes share most functionality, however only person can read/write age.
puts "#{person.full_name}'s age is #{person.age}"
puts customer.full_name
puts supplier.full_name
