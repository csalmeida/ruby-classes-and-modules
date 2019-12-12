require_relative 'animal'

class Duck < Animal
  def initialize
    @noise = 'Quack!'
    @color = 'white'
  end
end