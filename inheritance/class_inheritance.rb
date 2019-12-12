#!usr/bin/env ruby

# Defining Animal to act as a super class.
class Animal
  attr_accessor :noise
end

# The Pig subclass inherits @noise from Animal.
class Pig < Animal
  def initialize
    @noise = "Oink!"
  end
end

# The Cow subclass also inherits @noise from Animal.
class Cow < Animal
  def initialize
    @noise = "Moo!"
  end
end

# Instantiates a generic animal.
# When noise is called nothing will be returned as the value was not passed in.
generic = Animal.new
puts generic.noise

# A pig is created and will have a noise set.
# noise is a method that has been inherited from the Animal superclass.
bigbur = Pig.new
puts bigbur.noise

# A cow is created and will have a noise set.
smiley = Cow.new
puts smiley.noise