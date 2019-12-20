class ShiftCipher
  @@alphabet = [*'a'..'z']

  # The encode method takes a plain string and shifts it by a certain amount of characters.
  def self.encode(plain_string, shift=3)
    # Takes each word and splits it into charactes to be shifted.
    words = plain_string.split
    encoded_words = self.shift(words, shift)
    # Turns encoded array back into a string.
    encoded_words.join
  end

  # Reverts an encoded string. Requires previous used shift.
  def self.decode(cipher_string, shift=3)
    words = cipher_string.split
    decoded_words = self.shift(words, shift, true)
    decoded_words.join
  end

  private

    # Shifts characters. Used in encoding and decoding.
    def self.shift(words, shift, revert=false)
      words.map.with_index do |word, index|
        # Each character is shifted using @@alphabet.
        new_word = word.split("").map do |char|
          # Position of letter in the alphabet with shift applied.
          alpha_index = !revert ? @@alphabet.find_index(char.downcase) + shift : @@alphabet.find_index(char.downcase) - shift
          # If character shift falls out of alphabet, uses reverse shift.
          shifted_char = alpha_index < @@alphabet.length ? @@alphabet[alpha_index] : @@alphabet[alpha_index % @@alphabet.length]
          # Returns the shifted character with correct casing.
          self.is_upcase?(char) ? shifted_char.upcase : shifted_char
        end
        # Adds space to each word but the last.
        space = (index + 1) != words.count ? " " : ""
        new_word.join + space
      end
    end

    # Checks if a string is upcase.
    def self.is_upcase?(string=nil)
      string == string.upcase
    end
end