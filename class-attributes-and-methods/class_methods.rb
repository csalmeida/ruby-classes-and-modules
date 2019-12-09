#!usr/bin/env ruby

class Animal
  # A class method that list all classes (way to organise animals into groups) an animal can be in.
  def self.list_classes
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
end

# Class methods can be called directly on a class, without the need to create an instance of it.
puts "Animal classes:"
puts Animal.list_classes
puts


# It is a common pattern to use class methods to create instances of a class with custom values. Also known as factory pattern.
class Product
  # read/write instance methods and attributes.
  attr_accessor :name, :price

  # Initialize is an instance method and is bound to an instance.
  def initialize(price=0.0)
    @price = price
  end

  # A class method creates an instance of a product with raised prices.
  def self.exclusive
    Product.new(45.0)
  end

  # Other class methods create instances with different prices.
  def self.standard
    Product.new(30.0)
  end

  def self.discounted
    Product.new(15.0)
  end
end

puts "Deals of the day: "
exclusive_product = Product.exclusive
discounted_product = Product.discounted
puts "Exclusive: #{exclusive_product.price}"
puts "Discounted: #{discounted_product.price}"

# Redefining class to exemplify class and instance method syntax.
class Animal
  attr_accessor :name, :age

  def initialize(name,age)
    @name = name
    @age = age
  end

  # A class method that list all classes (way to organise animals into groups) an animal can be in.
  def self.list_classes
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

  # Show information on an animal using an instance method.
  def show_details
    "This animal is a #{@name} and is #{@age} years old."
  end
end


cat = Animal.new('cat', '2')
puts cat.show_details

