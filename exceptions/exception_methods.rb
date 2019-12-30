#!usr/bin/env ruby

# Used to separate messages in console.
def print_separator
  puts "-"*55
end

# Exceptions are stored in local variables to be used in each rescue block. Methods may be called on an exception instance, in this case `Exception#class`.
begin
  1 / 0
rescue ZeroDivisionError => e
  puts "#{e.class} handled"
rescue => e
  puts "#{e.class} handled"
end

print_separator()

# Defines the divide method with rescue blocks that make use of its exception instance.
def divide(x,y)
  x / y

  rescue ZeroDivisionError => e
    puts "ZeroDivisionError handled when dividing #{x} with #{y}"
    puts "Backtrace: #{e.backtrace}"
    print_separator()
  rescue TypeError => e
    puts "TypeError handled: #{e.message}"
    print_separator()
  rescue => e
    puts "#{e.class} handled"
    print_separator()
end

begin
  puts divide(8,4)
  divide(8,0)
  divide(8,"4")
  divide(4)
rescue ArgumentError => e
  puts "Requires two integer arguments."
  puts "Full message below:"
  puts "#{e.full_message}"
  print_separator()
end

puts "The errors above where thrown using exception handling." 
