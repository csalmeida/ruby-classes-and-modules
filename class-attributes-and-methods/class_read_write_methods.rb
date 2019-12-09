#!usr/bin/env ruby

class Animal
  # Class attribute.
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']

  # Makes attribute readable outsite the class.
  def self.species
    @@species
  end

  # Attribute can be set outside class declaration.
  def self.species=(array)
    return unless array.is_a?(Array)
    @@species = array
  end
end

puts "Current species array: #{Animal.species.join(", ")}"
# Setting the species to another value.
Animal.species = ['elephant', 'crocodile']
puts "New species array: #{Animal.species.join(", ")}"