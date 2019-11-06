#!usr/bin/env ruby

# Both statements create an instance of the String class.
food = "pasta" # "pasta"
food = String.new # ""

# Any class can be instanciated as an object using the .new method.
array = Array.new # []
hash = Hash.new # {}

# Custom classes can also be instanciated.
class Person
end

# Two Person objects instanciated.
person_1 = Person.new
person_2 = Person.new

# These are two different instances, stored in different parts of memory:
puts "Person 1 has id of: " + person_1.object_id.to_s
puts "Person 2 has id of: " + person_2.object_id.to_s

# Classes can be redefined in Ruby, but uncommon since they tend to be stored in their own files.
class Person
  # A custom method of a class.
  def greet
    "Hello!"
  end
end

# Another instance of person.
person_3 = Person.new

# Any instance can run greet.
puts person_1.greet
puts person_2.greet
puts person_3.greet