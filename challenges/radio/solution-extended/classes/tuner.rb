class Tuner
  # Allowed frequency ranges in the two available bands.
  @@bands = ['FM', 'AM']
  @@bands_range = {
    FM: 88.0..108.0,
    AM: 540.0..1600.0
  }

  # Instance attributes.
  attr_reader :freq, :band, :last_fm_freq, :last_am_freq

  # Sets defaults for each tuner instance.
  def initialize(options={})
    @band = options[:band] || @@bands[rand(0..1)]
    @freq = options[:freq] || random_freq
  end

  # Updates frequency only if within band range.
  def freq=(value)
    return if !band_range.cover?(value)
    store_freq
    @freq = value
  end

  # Switched band type
  def switch_band
    # Stores last used frequency before switching bands.
    store_freq
    # Switches bands.
    @band = @band != 'FM' ? 'FM' : 'AM'
    # Assings last used frequency for new band.
    @freq = last_band_freq
    # Returns current band.
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
      end
    end

    # Used when a default is needed.
    def random_freq
      case @band
      when 'FM'
        rand(@@bands_range[:FM]).truncate(1)
      when 'AM'
        rand(@@bands_range[:AM]).truncate(1)
      end
    end

    # Returns last used frequency according to band.
    def last_band_freq
      case @band
      when 'FM'
        @last_fm_freq || random_freq
      when 'AM'
        @last_am_freq || random_freq
      end
    end

    # Saves last used frequency. Used to restore it when switching bands. 
    def store_freq
      case @band
      when 'FM'
        @last_fm_freq = band_range.cover?(@freq) ? @freq : nil
      when 'AM'
        @last_am_freq = band_range.cover?(@freq) ? @freq : nil
      end
    end
end