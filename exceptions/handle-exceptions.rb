#!usr/bin/env ruby

# Exceptions to code ban be added between begin and end blocks. They run if anything goes wrong in the code block.
begin
  1 / 0
rescue
  puts "Exception: Cannot divide number by zero."
end

# Exceptions can be handled with rescue in methods. def and end blocks delimit the code it applies to.
def divide(x,y)
  x / y
rescue
  puts "Exceptions raised, cannot divide #{x} with #{y}."
end

divide(4,0)

# Redefining the divide method without an exception handler.
def divide(x,y)
  x / y
end

# Handles exception outside of the method.
begin
  divide(7,0)
rescue
  puts "Exceptions raised when trying division."
end

