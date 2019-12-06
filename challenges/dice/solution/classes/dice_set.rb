class DiceSet
  def initialize(options={})
    # Received two dice in an array.
    @dice = options[:dice]
    # Sets initial dice values.
    set_value
  end

  # Rolls each die present in the dice array.
  def roll
    @dice.map do |die|
      die.roll
    end
    set_value
  end

  # Used to consult current results without doing another roll.
  def display
    @value
  end
  
  # Set's value of set. Not available outside instance.
  private
    def set_value()
      @value = "[#{@dice.first.value}, #{@dice.last.value}]"
    end
end