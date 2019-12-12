#!usr/bin/env ruby

# Superclass definition. 
class Sofa
  @@can_open = false
  attr_accessor :width, :length

  def area
    width * length
  end
end

# Subclass inherits from Sofa.
class SofaBed < Sofa
  # Overrites its class attribute.
  @@can_open = true

  # Extends itself by adding two new instance attributes.
  attr_accessor :length_opened
  attr_reader  :is_open

  # Overrides area to calculate when bed is open.
  def area
    @is_open ? width * @length_opened : width * length
  end
  
  # Extends class further by other two additional methods.
  # These methods to not exist in the Sofa parent class.
  def open
    @is_open = true
  end

  def close
    @is_open = false
  end
end

sofa = SofaBed.new
sofa.width = 2
sofa.length = 4
sofa.length_opened = 6
puts "Closed sofa area: #{sofa.area}m2"
sofa.open
puts "Opened sofa area: #{sofa.area}m2"