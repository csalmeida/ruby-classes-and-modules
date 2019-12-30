#!usr/bin/env ruby

# Defines a custom exception.
class TooLoudError < StandardError
  def initialize(msg=nil)
    super(msg || "Too loud!")
  end
end

# Radio class can raise an exception when rejecting its Radio#volume value.
class Radio
  attr_accessor :volume

  def volume=(value)
    if value < 1 || value > 10
      # Raises previously defined custom exception.
      raise TooLoudError
    end
    @volume = value
  end
end

begin
  radio = Radio.new
  radio.volume = 20
# Handles the raised TooLoudError exception.
rescue TooLoudError => e
  puts e.message
end

# Redefining TooLoudError to receive a value for volume.
class TooLoudError < StandardError
  attr_reader :volume

  def initialize(value, msg=nil)
    super(msg || "Too loud!")
    @volume = value
  end
end

class Radio
  attr_accessor :volume

  def volume=(value)
    if value < 1 || value > 10
      # Passes volume value to exception.
      raise TooLoudError.new(value)
    end
    @volume = value
  end
end

begin
  radio = Radio.new
  radio.volume = 45
# Makes use of 'TooLoudError#volume' when handling the exception.
rescue TooLoudError => e
  puts "Volume #{e.volume}: #{e.message}"
end