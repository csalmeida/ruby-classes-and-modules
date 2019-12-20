require_relative 'shift_cipher'
require_relative 'radio'

class SecureRadio < Radio
  def audio_stream
    ShiftCipher.encode(super)
  end
end