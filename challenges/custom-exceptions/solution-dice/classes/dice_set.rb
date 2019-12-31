# Exceptions
require_relative '../exceptions/not_integer_error'
require_relative '../exceptions/no_zero_error'

# Classes
require_relative 'dice'

class DiceSet
  attr_reader :count

  def initialize(dice_number=2)
    @dice = []
    @count = dice_number

    if count == 0 || count == "0"
      raise NoZeroError.new(count)
    end
    
    unless count.is_a?(Integer)
      raise NotIntegerError.new(count)
    end

    puts "This line should not run"
    count.times {|number| @dice << Dice.new }

  rescue NotIntegerError => e
    puts e.message
    converted_type = e.string_to_integer(count)

    unless converted_type == nil
      puts "Converting value #{count} to Integer."
      @count = converted_type
      count.times {|number| @dice << Dice.new }
    else 
      puts "Cannot convert String to Integer, exiting..."
      exit
    end

  rescue NoZeroError => e
    puts e.message
    exit
  end

  # Rolls all dices in the set.
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