class DiceSet
  def initialize(options={})
    # Received two dice in an array.
    @dice = options[:dice]
  end

  # Rolls each die present in the dice array.
  def roll
    @dice.map do |die|
      die.roll
    end
  end

  # Used to consult current results without doing another roll.
  def display
    @dice.map {|die| "[ #{die.value} ]" }.join(' - ')
  end
end