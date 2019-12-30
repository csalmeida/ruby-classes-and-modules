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

def even_numbers(array)
  
  unless array.is_a?(Array)
    raise ArgumentError
  end

  if array.length == 0
    raise StandardError.new("Too few elements")
  end

  array.find_all {|item| item.to_i % 2 == 0}
end

puts even_numbers([*1..5]).join(',')
# puts even_numbers(1..20)
puts even_numbers([])