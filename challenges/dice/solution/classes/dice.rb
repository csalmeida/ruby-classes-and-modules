class Dice
  # Value can be read but not changed outsite its class definition.
  attr_reader :value

  def initialize
    # Dice will have a value uppon instantiation.
    roll
  end

  # Updates Dice value on each roll.
  def roll
    @value = get_random_number
  end

  # Returns a random number.
  private
    def get_random_number
      rand(1..6)
    end
end