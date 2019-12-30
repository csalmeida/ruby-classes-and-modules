#!usr/bin/env ruby

# Defines a method that raises exceptions.
def even_numbers(array)
  # Raises an exception is argument is not an array.
  unless array.is_a?(Array)
    raise ArgumentError
  end

  # Raises a StandardError exception with a message if array is empty.
  if array.length == 0
    raise StandardError.new("Too few elements: #{array.length}")
  end

  array.find_all {|item| item.to_i % 2 == 0}
end

# Runs method with an array with items. No exceptions should be raised.
puts even_numbers([6, 3, '8'])

# Runs method with unexpected datatype, ArgumentError exception should be raised.
puts even_numbers("hello")

# Runs method with no items inside array, StandardError should be raised.
puts even_numbers([])

# Radio class can raise an exception when rejecting its Radio#volume value.
class Radio
  attr_accessor :volume

  def volume=(value)
    if value < 1 || value > 10
      # Raises an exception, RuntimeError by default.
      raise "Too loud!"
    end
    @volume = value
  end
end

begin
  radio = Radio.new
  radio.volume = 20
# Handles the raised RuntimeError exception.
rescue RuntimeError => e
  puts e.message
end