class RadioOptionError < StandardError

  attr_reader :options, :unexpected_options

  @@expected_options = [
    :volume,
    :band,
    :freq
  ]

  def initialize(options={}, message=nil)
    @options = options
    @unexpected_options = @options.keys - @@expected_options
    super(message || "Exception: Unexpected options on instantiation: #{@unexpected_options}")
  end

  # Returns whether any unexpected keys were introduced to options, regardless of hash length.
  def self.unexpected_options?(options)
    unless options.keys.empty?
      options.keys.any? { |key| !@@expected_options.include?(key)  }
    else
      false
    end
  end
end