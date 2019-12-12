require_relative 'animal'

class Cow < Animal
  def initialize
    @noise = 'Moo!'
    @color = 'brown'
  end

  def jump
    puts "Over the moon we go"
  end
end