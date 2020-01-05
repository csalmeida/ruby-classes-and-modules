require_relative '../modules/string_to_integer'

class NotIntegerError < StandardError

  include StringToInteger
  
  def initialize(value)
    @value = value
    super("Exception: Expected Integer, got #{value.class} with value: #{value}")
  end
  
end