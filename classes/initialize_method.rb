#!usr/bin/env ruby

class Animal
  attr_accessor :noise

  # Sets the noise instance variable as soon a new object is created.
  def initialize
    @noise = 'Ooof!'
    puts "New animal instantiated."
  end
end

pig = Animal.new
puts pig.noise

class Animal
  attr_accessor :noise

  # Arguments can be passsed to the initialize method.
  def initialize(options={})
    @noise = options[:noise] || 'Ooof!'
    puts "New animal instantiated."
  end
end

# Values can be passed to an object uppon instantiation. Values will typically be stored in a hash.
cat = Animal.new({noise: "Miau!"})
puts cat.noise