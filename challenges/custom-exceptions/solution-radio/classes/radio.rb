require_relative '../exceptions/volume_limit_error'
require_relative 'tuner'

class Radio
  # Instance attributes.
  attr_reader :volume, :tuner, :band

  # Sets defaults for each radio instance.
  def initialize(options={})
    @volume = options[:volume] || rand(1..10)
    @tuner = options[:tuner] || Tuner.new
    @band = @tuner.band
  end

  # Volume is set using a custom attribute method as only a range of values is accepted.
  def volume=(value)

    unless value < 0 || value > 10
      @volume = value
    else
      raise VolumeLimitError.new(value)
    end

  rescue VolumeLimitError => e
    puts "Exception: Volume #{e.value}"
    puts e.message
  end

  # Returns radio state as a string.
  def status
    measure_unit = @band == "FM" ? "MHz" : "kHz" 
    "Station: #{@tuner.freq}#{measure_unit} #{@band}, volume #{@volume}"
  end

  # Instantiates an FM or AM tuner.
  def self.fm
    Radio.new({
      tuner: Tuner.new({band: "FM"})
    })
  end

  def self.am
    Radio.new({
      tuner: Tuner.new({band: "AM"})
    })
  end
end