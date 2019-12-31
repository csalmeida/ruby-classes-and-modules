module StringToInteger
  def string_to_integer(value)
    unless value.is_a?(String) && in_alphabet?(value)
      return value.to_i
    end
    nil
  end

  private
    def in_alphabet?(string)
      @alphabet = [*'A'..'Z'] + [*'a'..'z']
      string.chars.any? {|char| @alphabet.include?(char) }
    end
end