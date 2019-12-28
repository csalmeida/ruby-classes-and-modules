#!usr/bin/env ruby

# Imports any required modules.
require_relative 'modules/nameable'

# Imports the person class and others, the .rb extension is optional.
require_relative 'classes/person'
require_relative 'classes/animal'
require_relative 'classes/pig'
require_relative 'classes/cow'
require_relative 'classes/duck'
require_relative 'classes/chef'
require_relative 'classes/amateur_chef'

# Prints a line to separate examples.
def add_line(symbol='-',length=30)
  puts
  puts symbol * length
  puts
end

# After importing, an instance of Person can be created:
person = Person.new
puts person.greet

person.first_name = "Han"
person.last_name = "Solo"
# Method makes use of private method in the class.
puts person.initial_and_last_name

add_line

# Creating an animal class making use of its @noise attribute.
pig = Animal.new({noise: "Oink!"})
puts pig.noise

add_line

Animal.types.each do |type|
  puts type
end

add_line

puts Animal.total_animals
puts Animal.current_animals

add_line

Animal.types = ['elephant', 'crocodile']
puts "New species array: #{Animal.types.join(", ")}"

add_line

wilbur = Pig.new
puts wilbur.noise
wilbur.eat

maisie = Cow.new
puts maisie.noise
maisie.jump

daffy = Duck.new
puts daffy.noise
daffy.fly

add_line

chef = Chef.new
chef.make_dinner

puts "*"

amateur_chef = AmateurChef.new
amateur_chef.make_dinner