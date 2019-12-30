#!usr/bin/env ruby

def divide(x,y)
  puts x / y
rescue ZeroDivisionError
  puts "Cannot divide by zero"
  puts "#{e.class}: #{e.message}"
rescue TypeError
  puts "Requires two integer arguments"
rescue => e
  puts "#{e.class} handled"
end

begin
  # divide(4,2)
  # divide(7,0)
  # divide(7,"2")
  # divide(7)
# rescue ArgumentError
#   puts "Requires two integer arguments"
end

class NoEvenNumbers < StandardError
  
  attr_accessor :array

  def initialize(array)
    super("No even numbers")
    @array = array
  end
end

def even_numbers(array)

  unless array.is_a?(Array)
    raise ArgumentError
  end

  if array.length == 0
    raise StandardError.new("Too few elements")
  end

  even_array = array.find_all {|item| item.to_i % 2 == 0}

  if even_array.length == 0
    raise NoEvenNumbers.new(array)
  end

  return even_array
end

puts even_numbers([*1..5]).join(',')
# puts even_numbers(1..20)
# puts even_numbers([])

begin
  puts even_numbers([1,3,5,7])
rescue => e
  puts "#{e.class}: #{e.message}"
  puts "The array provided was: [#{e.array.join(",")}]"
end
