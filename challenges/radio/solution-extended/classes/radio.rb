class Radio
  # Instance attributes.
  attr_reader :volume, :tuner, :band

  # Sets defaults for each radio instance.
  def initialize(options={})
    @volume = options[:volume] || rand(1..10)
    @tuner = options[:tuner] || Tuner.new
    @band = options[:band] || @tuner.band
  end

  # Volume is set using a custom attribute method as only a range of values is accepted.
  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  # Returns radio state as a string.
  def status
    measure_unit = @band == "FM" ? "MHz" : "kHz" 
    "Station: #{@tuner.freq}#{measure_unit} #{@band}, volume #{@volume}"
  end

  # Instantiates an FM or AM radio.
  # def self.fm
  #   Radio.new({band: "FM"})
  # end

  # def self.am
  #   Radio.new({band: "AM"})
  # end
end