#!usr/bin/env ruby

def divide(x,y)
  puts x / y
rescue
  puts "Cannot divide by zero"
end

divide(4,0)

def divide(x,y)
  puts x / y
end


begin
  divide(4,2)
  divide(7,0)
rescue
  puts "Cannot divide by zero"
end