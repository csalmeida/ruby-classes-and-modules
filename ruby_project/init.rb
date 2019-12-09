#!usr/bin/env ruby

# Imports the person class and others, the .rb extension is optional.
require_relative 'classes/person'
require_relative 'classes/animal'

# After importing, an instance of Person can be created:
person = Person.new
puts person.greet

person.first_name = "Han"
person.last_name = "Solo"
# Method makes use of private method in the class.
puts person.initial_and_last_name

puts '-'*15

# Creating an animal class making use of its @noise attribute.
pig = Animal.new({noise: "Oink!"})
puts pig.noise

puts '-'*15

Animal.types.each do |type|
  puts type
end

puts '-'*15

wilbur = Animal.create_a_pig
puts wilbur.noise

puts '-'*15

puts Animal.total_animals
puts Animal.current_animals

puts '-'*15