class NoZeroError < StandardError

  def initialize(value)
    @value = value
    super("Exception: Value cannot be zero.")
  end
  
end