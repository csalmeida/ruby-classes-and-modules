#!usr/bin/env ruby

# Superclass makes dinner in one step.
class Chef
  def make_dinner
    puts "Cook food."
  end
end

# Subclass makes dinner in more steps.
# Calls Chef#make_dinner as a step, using the super keyword.
class AmateurChef < Chef
  def make_dinner
    puts "Read recipe"
    super
    puts "Clean up mess."
  end
end

# Instanciated a chef of each class.
chef = Chef.new
amateur_chef = AmateurChef.new

puts "The Chef makes dinner:".upcase
chef.make_dinner
puts "The amateur Chef makes dinner:".upcase
amateur_chef.make_dinner

puts "-"*30

# Superclass, returns a geometry. 
class Image
  attr_accessor :resizable

  def geometry
    "800x600"
  end
end

# Subclass returns its own geometry if resizeable, otherwise Image#geometry takes over and is used instead.
class ProfileImage < Image
  def initialize
    @resizable = true
  end

  def geometry
    @resizable ? "100x100" : super
  end
end

puts "A generic image:".upcase
image = Image.new
puts image.geometry

puts "A resizable profile image:".upcase
profile_image = ProfileImage.new
puts profile_image.geometry

puts "A non-resizable profile image:".upcase
profile_image.resizable = false
puts profile_image.geometry