#!usr/bin/env ruby
class Person
  # Name can be read and set outside the class definition.
  attr_accessor :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end  

  # Makes use of private method to return name in a different format.
  def initial_and_last_name
    "#{get_initial(first_name)} #{last_name}"
  end  

  # All methods below this keyword  will be private.
  private
    def get_initial(name)
      name.chars.first + '.'
    end
end

ree = Person.new
ree.first_name = "Rhianon"
ree.last_name = "Farrow"
puts ree.full_name
puts ree.initial_and_last_name