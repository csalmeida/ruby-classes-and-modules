class ShiftCipher
  @@alphabet = [*'a'..'z']

  # The encode method takes a plain string and shifts it by a certain amount of characters.
  def self.encode(plain_string, shift=3)
    # Takes each word and splits it into charactes to be shifted.
    words = plain_string.split
    encoded_words = words.each_with_index.map do |word, index|
      # puts "Word '#{word}' number " + (index + 1).to_s
      # Each character is shifted using @@alphabet.
      word.split("").map do |char|
        # Position of letter in the alphabet with shift applied.
        alpha_index = @@alphabet.find_index(char.downcase) + shift
        # If character shift falls out of alphabet, uses reverse shift.
        shifted_char = alpha_index < @@alphabet.length ? @@alphabet[alpha_index] : @@alphabet[alpha_index % @@alphabet.length]
        # Returns the shifted character with correct casing.
        self.is_upcase?(char) ? shifted_char.upcase : shifted_char
      end
    end
    # Turns encoded array back into a string.
    encoded_words.join
  end

  # Reverts an encoded string. Requires previous used shift.
  def self.decode(cipher_string, shift=3)
    words = cipher_string.split
    decoded_words = words.each_with_index.map do |word, index|
      word.split("").map do |char|
        alpha_index = @@alphabet.find_index(char.downcase) - shift
        unshifted_char = alpha_index < @@alphabet.length ? @@alphabet[alpha_index] : @@alphabet[alpha_index % @@alphabet.length]
        self.is_upcase?(char) ? unshifted_char.upcase : unshifted_char
      end
    end
    decoded_words.join
  end

  private

    # Checks if a string is upcase.
    def self.is_upcase?(string=nil)
      string == string.upcase
    end
end