#!usr/bin/env ruby

# Imports the person class, the .rb extension is optional.
require_relative 'classes/person'

# After importing, an instance of Person can be created :
person = Person.new
puts person.greet