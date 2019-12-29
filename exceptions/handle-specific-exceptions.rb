#!usr/bin/env ruby

# Handles specific exceptions differrently by using rescue multiple times.
def divide(x,y)
  x / y
rescue ZeroDivisionError
  puts "ZeroDivisionError handled"
rescue TypeError
  puts "TypeError handled"
rescue
  puts "Some other StandardError handled"
end

# First division is correct, no exceptions are thrown.
puts divide(4,2)
# Will throw ZeroDivisionError.
divide(4,0)
# Will throw TypeError as it expects two integers.
divide(4,"2")

# Separates console output.
puts '-'*30

# Redefined method, removing exception handling.
def divide(x,y)
  x / y
end

begin
  # Will throw ArgumentError as it expects 2.
  divide(4)
rescue ZeroDivisionError
  puts "Cannot divide by zero."
rescue TypeError, ArgumentError
  puts "Requires two integer arguments."
end

puts '-'*30

# Refactored example with Argument exception outside the method block.
def divide(x,y)
  x / y
rescue ZeroDivisionError
  puts "ZeroDivisionError handled"
rescue TypeError
  puts "TypeError handled"
end

begin
  # Will throw ArgumentError as it expects 2.
  divide(4)
rescue ArgumentError
  puts "Requires two integer arguments."
end