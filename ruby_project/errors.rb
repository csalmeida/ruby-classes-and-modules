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

divide(4,2)
divide(4,0)
divide(4,"2")

begin
  divide(4,2)
  divide(7,0)
  divide(7,"2")
  divide(7)
rescue ArgumentError
  puts "Requires two integer arguments"
end