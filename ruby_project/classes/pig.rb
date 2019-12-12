require_relative 'animal'

class Pig < Animal
  def initialize
    @noise = 'Oink!'
    @color = 'pink'
  end
end