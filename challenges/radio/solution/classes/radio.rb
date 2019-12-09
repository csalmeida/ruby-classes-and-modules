class Radio
  # Allowed frequency ranges in the two available bands.
  @@bands = ['FM', 'AM']
  @@bands_range = {
    FM: 88.0..108.0,
    AM: 540.0..1600.0
  }

  # Instance attributes.
  attr_accessor :freq
  attr_reader :volume, :band

  # Sets defaults for each radio instance.
  def initialize(options={})
    @volume = options[:volume] || rand(1..10)
    @band = options[:band] || @@bands[rand(0..1)]
    @freq = options[:freq] || rand(get_band_range).truncate(2)
  end

  # Volume is set using a custom attribute method as only a range of values is accepted.
  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  def freq=(value)
    puts "Is #{value} within band range? #{get_band_range.cover?(value)}"
    return if !get_band_range.cover?(value)
    @freq = value
  end

  def self.fm
    Radio.new({band: "FM"})
  end

  def self.am
    Radio.new({band: "AM"})
  end

  def self.bands_range
    @@bands_range
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