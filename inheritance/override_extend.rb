#!usr/bin/env ruby

class Sofa
  @@can_open = false
  attr_accessor :width, :length

  def area
    width * length
  end
end

class SofaBed < Sofa
  @@can_open = true
  attr_accessor :length_opened
  attr_reader  :is_open

  def area
    @is_open ? width * @length_opened : width * length
  end
  
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