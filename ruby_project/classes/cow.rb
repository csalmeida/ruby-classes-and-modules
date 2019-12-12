require_relative 'animal'

class Cow < Animal
  def initialize
    @noise = 'Moo!'
    @color = 'brown'
  end
end