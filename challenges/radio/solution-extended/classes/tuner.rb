class Tuner
  # Allowed frequency ranges in the two available bands.
  @@bands = ['FM', 'AM']
  @@bands_range = {
    FM: 88.0..108.0,
    AM: 540.0..1600.0
  }

  # Instance attributes.
  attr_reader :freq, :band, :last_fm_freq, :last_am_freq


  # Sets defaults for each radio instance.
  def initialize(options={})
    @band = options[:band] || @@bands[rand(0..1)]
    @freq = options[:freq] || random_freq
    store_last_freq
  end

  # Updates frequency only if within band range.
  def freq=(value)
    return if !band_range.cover?(value)
    store_last_freq
    @freq = value
  end

  # Switched band type
  def switch_band
    @band = @band != "FM" ? "FM" : "AM"
    @freq = last_freq
    @band
  end

  private

    # Returns band range based on radio band.
    def band_range
      case @band
      when 'FM'
        @@bands_range[:FM]
      when 'AM'
        @@bands_range[:AM]
      else
        nil
      end
    end

    # Used when a default is needed.
    def random_freq
      case @band
      when "FM"
        rand(@@bands_range[:FM]).truncate(1)
      when "AM"
        rand(@@bands_range[:AM]).truncate(1)
      end
    end

    # Updates stored frequencies to support switching.
    def last_freq
      case @band
      when "FM"
        @last_fm_freq || band_range.include?(@freq) ? @freq : random_freq
      when "AM"
        @last_am_freq || band_range.include?(@freq) ? @freq : random_freq
      end
    end

    # Updates stored frequencies to support switching.
    def store_last_freq
      case @band
      when "FM"
        @last_fm_freq = @freq
      when "AM"
        @last_am_freq = @freq
      end
    end
end