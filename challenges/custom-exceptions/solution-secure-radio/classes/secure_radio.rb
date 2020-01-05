require_relative 'shift_cipher'
require_relative 'radio'

class SecureRadio < Radio
  protected

    def audio_stream
      ShiftCipher.encode(super)
    end
end