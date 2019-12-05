#!usr/bin/env ruby

# Imports the person class and others, the .rb extension is optional.
require_relative 'classes/person'
require_relative 'classes/animal'

# After importing, an instance of Person can be created:
person = Person.new
puts person.greet

# Creating an animal class making use of its @noise attribute.
pig = Animal.new
pig.noise = "Oink!"
puts pig.noise