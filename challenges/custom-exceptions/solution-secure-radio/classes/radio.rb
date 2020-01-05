require_relative '../exceptions/volume_limit_error'
require_relative '../exceptions/radio_option_error'


class Radio
  # Allowed frequency ranges in the two available bands.
  @@bands = ['FM', 'AM']
  @@bands_range = {
    FM: 88.0..108.0,
    AM: 540.0..1600.0
  }
  @@audio_samples = [
    "Samba em Prelúdio",
    "Like a Rolling Stone",
    "Cantaloupe Island",
    "Desafinado",
    "a traffic report...",
    "a news report"
  ]

  # Instance attributes.
  attr_reader :volume, :freq, :band

  # Sets defaults for each radio instance.
  def initialize(options={})
    # Listens for unexpected options.
    if RadioOptionError.unexpected_options?(options)
      raise RadioOptionError.new(options)
    end

    @volume = options[:volume] || rand(1..10)
    @band = options[:band] || @@bands[rand(0..1)]
    @freq = options[:freq] || rand(get_band_range).truncate(2)
  
  rescue RadioOptionError => e
    puts e.full_message
    exit
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

  # Updates frequency only if within band range.
  def freq=(value)
    return if !get_band_range.cover?(value)
    @freq = value
  end

  # Plays the radio.
  def play
    puts "The radio plays: #{audio_stream}"
  end

  # Returns radio state as a string.
  def status
    measure_unit = @band == "FM" ? "MHz" : "kHz" 
    "Station: #{@freq}#{measure_unit} #{@band}, volume #{@volume}"
  end

  # Instantiates an FM or AM radio.
  def self.fm
    Radio.new({band: "FM"})
  end

  def self.am
    Radio.new({band: "AM"})
  end

  protected
  
    # Sets stream to be played
    def audio_stream
      @@audio_samples.sample
    end

  private

    # Returns band range based on radio band.
    def get_band_range
      case @band
      when 'FM'
        @@bands_range[:FM]
      when 'AM'
        @@bands_range[:AM]
      else
        nil
      end
    end
end