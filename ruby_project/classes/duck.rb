require_relative 'animal'

class Duck < Animal
  def initialize
    @noise = 'Quack!'
    @color = 'white'
  end

  def fly
    puts "Flying free as a bird"
  end
end