class Dice
  # Value can be read but not changed outsite its class definition.
  attr_reader :value

  def initialize
    # Dice will have a value uppon instantiation.
    self.roll
  end

  # Updates Dice value on each roll.
  def roll
    @value = rand(1..6)
  end
end