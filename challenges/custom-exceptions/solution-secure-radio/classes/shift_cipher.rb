# module StringTypeError
#   unless !string.is_a?(String)
#     raise TypeError
#   end

# rescue TypeError 
#   puts "Exception: Argument is not type string: #{string}"
# end

class ShiftCipher
  @@alphabet = [*'a'..'z']

  # The encode method takes a plain string and shifts it by a certain amount of characters.
  def self.encode(string, shift=3)
    # Takes each word and splits it into charactes to be shifted.
    encoded_words = self.shift(string, shift)
  end

  # Reverts an encoded string. Requires previous used shift.
  def self.decode(string, shift=3)
    decoded_words = self.shift(string, shift, true)
  end

  private

    # Shifts characters. Used in encoding and decoding.
    def self.shift(string, shift, revert=false)
      unless string.is_a?(String)
        raise TypeError
      end
      # Each character is shifted using @@alphabet.
      string.split("").map do |char|
        if @@alphabet.include?(char.downcase)
          # Position of letter in the alphabet with shift applied.
          alpha_index = !revert ? @@alphabet.find_index(char.downcase) + shift : @@alphabet.find_index(char.downcase) - shift
          # If character shift falls out of alphabet, uses reverse shift.
          shifted_char = alpha_index < @@alphabet.length ? @@alphabet[alpha_index] : @@alphabet[alpha_index % @@alphabet.length]
          # Returns the shifted character with correct casing.
          self.is_upcase?(char) ? shifted_char.upcase : shifted_char
        else
          char
        end
      end.join
    rescue TypeError 
      puts "Exception: Argument is not type string: '#{string}' is #{string.class}"
    end

    # Checks if a string is upcase.
    def self.is_upcase?(string=nil)
      string == string.upcase
    end
end