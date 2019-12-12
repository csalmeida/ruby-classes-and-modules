class Animal
  @@types = [
    'mammalia 🐻', 
    'actinopterygii 🐟', 
    'chondrichthyes 🐡', 
    'aves 🦜', 
    'amphibia 🐸', 
    'anthropods 🦀', 
    'reptilia 🐍'
  ]
  @@total_animals = 0
  @@current_animals = []

  attr_accessor :noise, :color
  
  def initialize(options={})
    @noise = options[:noise] || 'Ooof!'
    @color = options[:color] || 'white'

    @@total_animals += 1
    @@current_animals << self
  end

  def self.types
    @@types
  end

  def self.types=(array)
    return unless array.is_a?(Array)
    @@types = array
  end

  def self.current_animals
    @@current_animals
  end

  def self.total_animals
    @@current_animals.count
  end
end