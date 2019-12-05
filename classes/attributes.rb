#!usr/bin/env ruby

# Sets an attribute to Animal using an instance variable.
class Animal
  def make_noise
    @noise
  end

  def set_noise
    @noise = 'Oink!'
  end
end

pig = Animal.new
pig.set_noise
puts pig.make_noise

# Traditional way of setting reader/write methods:
class Animal
  def get_noise
    @noise
  end

  def set_noise(value)
    @noise = value
  end
end

# Ruby's convention of setting read/write methods:
class Animal
  def noise
    @noise
  end

  def noise=(value)
    @noise = value
  end
end

# With regular method syntax this is how a value would be set.
pig.noise=('Oink, oink, oink!')
# Using Rybu's syntax sugar, it looks like a value is being set with the noise= method.
pig.noise = 'Oink, oink!'
puts pig.noise

# Ruby's shorthand of setting read/write methods:
class Animal
  attr_reader :noise
  attr_writer :noise
end

pig.noise = 'Oink?'
puts pig.noise

# Ruby's most common of setting read/write methods:
class Animal
  attr_reader :noise
end

pig.noise = 'Oink...'
puts pig.noise