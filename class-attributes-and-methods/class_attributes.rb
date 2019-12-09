#!usr/bin/env ruby

class Animal
  # Class attribute definition. Can be called without an instance.
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']

  # Class attributes are not accessible outsite the class. Therefore, a method can be used to return and/or manipulate its value.
  def self.species
    @@species
  end
end

# A class attribute is returned here without an instance being required.
puts Animal.species

class Animal
  # A class attribute is defined to keep track of how many instances of this class are running.
  @@current_animals = []

  # Each time an instance is created, it is added to an array with the total number of intances being accessible at all times.
  def initialize
    @@current_animals << self
  end

  # Returns all instances of Animal
  def self.current_animals
    @@current_animals
  end

  # Counts how many instances were created
  def self.count
    @@current_animals.count
  end
end

# Instantiates four animals.
cat = Animal.new
dog = Animal.new
chicken = Animal.new
sheep = Animal.new

# Using class attributes and methods the count and each instance can be accessed at a class level.
puts "There are #{Animal.count} instances of the Animal class."
puts Animal.current_animals
