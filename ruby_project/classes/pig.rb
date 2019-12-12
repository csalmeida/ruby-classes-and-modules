require_relative 'animal'

class Pig < Animal
  def initialize
    @noise = 'Oink!'
    @color = 'pink'
  end

  def eat
    puts "Nom nom nom"
  end
end