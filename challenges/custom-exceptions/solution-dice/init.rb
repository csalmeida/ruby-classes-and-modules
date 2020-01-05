#!usr/bin/env ruby
require_relative 'classes/dice_set'

# Formats the heading of the script.
def print_heading(heading="")
  unless heading.is_a?(String)
    raise TypeError
  end

  formatted_title = "| #{heading} |"
  dashes = "-" * formatted_title.length
  puts dashes
  puts formatted_title
  puts dashes

rescue TypeError => e
  puts "Exception: Heading needs to be a string."
  puts e.full_message
end

# Prints scripts heading.
print_heading("Roll the Dice!")
puts "Instructions:"
puts "This is a dice roller, it will roll two dice at a time."
puts "Type 'r' to roll or 'q' to quit."

# Instantiates two die and a dice set.
dice_set = DiceSet.new(2)

input = nil
until input == 'q' || input == 'quit'
  print "Roll ('r') or quit ('q'): "
  input = gets.chomp
  if input == 'r' || input == 'roll'
    dice_set.roll
    puts "Result: " + dice_set.display
  end
end