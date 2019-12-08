class Animal
  attr_accessor :noise, :color
  
  def initialize(options={})
    @noise = options[:noise] || 'Ooof!'
    @color = options[:color] || 'white'
  end

  def self.types
    [
      'mammalia 🐻', 
      'actinopterygii 🐟', 
      'chondrichthyes 🐡', 
      'aves 🦜', 
      'amphibia 🐸', 
      'anthropods 🦀', 
      'reptilia 🐍'
    ]
  end

  def self.create_a_pig
    Animal.new({noise: 'Oink', color: 'pink'})
  end
end