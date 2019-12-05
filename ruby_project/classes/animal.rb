class Animal
  # Instance variable is used on this method but it is set on another method.
  def noise
    @noise
  end

  # Instance variables can be used anywhere in the class.
  def noise=(value)
    @noise = value
  end
end