class VolumeLimitError < StandardError

  attr_reader :value

  def initialize(value=nil)

    @@default_message = less_than_zero?(value) ? "Cannot go below zero." : "Too loud!"
    @value = value

    super(@@default_message)
  end

  private

    def less_than_zero?(value)
      value < 0
    end

end