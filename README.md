# Ruby – Classes and Modules

This document expands on [Ruby's](https://www.ruby-lang.org) features, focusing on classes and modules.

**Official Documentation:** https://ruby-doc.org/

## Table of Contents
<details>
<summary>Click to expand contents</summary>

- [Getting Started](#getting-started)
- [Introduction](#introduction)
- [Classes](#classes)
  - [Define a class](#define-a-class)
  - [Instances](#instances)
  - [Attributes](#attributes)
  - [Method Access Control](#method-access-control)
  - [Initialize Method](#initialize-method)
  - [Challenge: Dice](challenges/dice/dice-challenge.md)
- [Class Attributes and Methods](#class-attributes-and-methods)
  - [Class Methods](#class-methods)
- [Further Resources](#further-resources)
</details>

# Getting Started

This repository follows [Kevin Skoglund's Ruby Classes and Modules course](https://www.linkedin.com/learning/ruby-classes-and-modules/learn-to-use-custom-classes-in-ruby) and makes use of concepts mentioned on the [Ruby Fundamentals]() repo.

To get started Ruby needs to be installed on the machine:
```
ruby -v 
```

Should return something similar to:
`ruby 2.3.7p456 (2018-03-28 revision 63024) [universal.x86_64-darwin18]`

> If the `ruby` command is not found, [install Ruby](https://www.ruby-lang.org/en/documentation/installation/).

# Introduction

Ruby is an Object Oriented Programming (OOP) language and custom classes and modules can be defined to improve how code is organized with the aim to make it easier to maintain and add new features.

Classes provide templates for creating objects or instances of a class that have unique attributes and behavior and can interact with each other in complex ways.

# Classes

The important concept of OOP is likely to be classes. This section will look at defining custom classes.

A class defines code grouped by a common theme or purpose that provides a template of the state and behavior of objects created from it.

Objects that exist in Ruby have classes as well such as 'Integer', 'String', 'Symbol', the 'NilClass' and many more.

Ruby can be asked what class an object belongs to by using the `class` method:

```ruby
# classes/define-class.rb
word = 'Ruby'
word.class # String

[1..5].class # Array
```

There are built-in Ruby classes, however custom ones can be defined.

## Define a class

Classes are defined in a block wrapped by the `class` keyword, followed by the name of the class, and `end`.

```ruby
# classes/define-class.rb
class ShoppingCart
  #...
end
```

Classes are typically defined within the following guidelines:

- Named using singular nouns.
- Capitalized and camel cased names. (e.g, "ShoppingCart")
- Define each class in a separate file
- Grouped class files in a directory

Classes can be redefined and modified without error which is not common is most programming languages.

Classes can have _attributes_ which hold the current state of an object and _methods_ which define behavior of the object, similar to [custom methods](https://github.com/csalmeida/ruby-fundamentals#define-and-call-methods).

Additionally, [the Ruby path](https://github.com/csalmeida/ruby-fundamentals#best-practices) does not need to be added to class files, only to the main script file:

```ruby
#!/usr/bin/env ruby
```

## Instances

An instance is a single object that is created from a class definition. For example assigning a `String` to a variable is creating a new instance of the `String` class:

```ruby
# classes/instances.rb
food = "pasta" # Instance of String
food = String.new # Also an instance of a string
array = Array.new # Instance of an array
hash = Hash.new # Instance of a hash
```

Objects can be instantiated from custom classes as well:

```ruby
# classes/instances.rb
class Person
end

person_1 = Person.new
person_2 = Person.new
```

Each instance is based on its respective class, however they might hold different values. For example, a `String` class can hold any combination of characters, `"Ruby"` or `7u3y`. Both are strings but have different values.

This can be observed by checking the `object_id` of both instances of `Person`. Each value will be different, meaning that each one is taking a different part of memory to run.

```ruby
person_1.object_id # 70142496862940
person_2.object_id # 70142496862780
```

A [custom method](https://github.com/csalmeida/ruby-fundamentals#custom-methods) can be added to a class and used on any instance:

```ruby
# classes/instances.rb
class Person
  def greet
    "Hello!"
  end
end

person_3 = Person.new
puts person_3.greet # Hello!
```

Additionally, it is more common for classes to be defined on a single file. These are then required into other scripts, it could even be a main script file. Usually the main script file will be named `init.rb` and other files might be imported:

```ruby
# ruby_project/init.rb
require_relative 'classes/person'
person = Person.new
puts person.greet # Hello!
```

The example above shows the file where the `Person` class is defined being imported into a main script file. Then a `Person` can be instantiated and methods associated with that object can be used.

## Attributes

Attributes are values that persist in the instance of a class and are what makes an instance unique. For instance, a `Person` might be named `Salia` and another named `Joe`, this value would live in an attribute, part of that instance.

Attributes can be seen as properties of an object and in some programming languages that is how they are called.

It might be easier to think of it as properties in some cases, as for instance a car could be *green*. Green is a property of a car but it could be any other color and different cars will have other colors.

A house might have *two rooms* and *one bathroom* but other might have a different number of rooms and bathrooms. These are all properties a house can have but in Ruby they are called attributes.

Attributes will be stored inside instance variables and are set using [variable scope indicators](https://github.com/csalmeida/ruby-fundamentals#variable-scope-indicators).

```ruby
# classes/attributes.rb
class Animal
  def make_noise
    @noise
  end

  def set_noise
    @noise = 'Oink!'
  end
end
```

In the example above the instance variable `@noise` is used in two methods, one to set it and another to return it.

```ruby
# classes/attributes.rb
pig = Animal.new
pig.set_noise
puts pig.make_noise
```

When an instance of `Animal` is created, the value of `@noise` persists in the instance. It can be accessed in both methods and this is [an important difference from local variables in terms of scope](https://github.com/csalmeida/ruby-fundamentals#variable-scope). **An instance of a class always has access to its instance variables.** From anywhere inside its class definition it can pull values from instance variables.

### Reader/Writer Methods

In some cases instance variables might require to be accessed outside an instance. It was already established this is not possible but since methods are accessible outside an instance, these can be used to get access to an instance variable.

These methods are called reader/writer methods, also known as getter/setter methods in other programming languages. These are methods that allow reading or writing to an attribute.

A more traditional way of naming these methods would be using the `get` and `set` keywords to name them, with set taking an argument:

```ruby
# classes/attributes.rb
class Animal
  def get_noise
    @noise
  end

  def set_noise(value)
    @noise = value
  end
end
```

However, Ruby has a convention for setting these methods which aid their use when an object is instantiated:

```ruby
# classes/attributes.rb
class Animal
  def noise
    @noise
  end

  def noise=(value)
    @noise = value
  end
end
```

This means that when, for instance, `pig.noise` is called it will return the value for `@noise`. However, when `pig.noise('Oooooink!')` is called it *won't* set the value for `@noise` in that instance since that is not the name of the method defined, `noise=` is:

```ruby
# classes/attributes.rb
pig.noise=('Oink, oink, oink!')
pig.noise # Oink, oink, oink!
```

This syntax is not the most common but it conveys that `noise=` is the name of the method. Defining a method with that name allows Ruby's sugar syntax to be used and call it in a way that it seems the instance variable value is being set instead:

```ruby
# classes/attributes.rb
pig.noise = 'Oink, oink!'
pig.noise # Oink, oink!
```

Ruby is aware that it is a method despite being called this way. It one of these methods is left out it would create a case where an instance variable is either read only or write only.

### Attribute Methods

Attribute methods are sometimes called `attr_*`, with `*` being a placeholder for the three methods currently available:

- `attr_reader`
- `attr_writer`
- `attr_accessor`

Attribute start with `attr_` and they are referenced as *attribute writer*, *attribute accessor* even if not all of it is typed out.

This adds another way of making attributes available outside an instance. For example, using `attr_reader :noise` replaces the method defined earlier to access it:

```ruby
# Using attribute reader is the same as the method below.
attr_reader :noise
# Replaced by attr_reader
def noise
  @noise
end
```

The writer method could be replaced with `attr_writer` and would have the same effect:

```ruby
# Using attribute reader is the same as the method below.
attr_writer :noise

# Replaced by attr_writer
def noise=(value)
  @noise = value
end
```

The third method (`attr_accessor`) can be used when both read/write is needed. This allows an attribute to be both read and set in one line:

```ruby
# Using attribute reader is the same as the method below.
attr_accessor :noise
# Replaced by attr_accessor
def noise
  @noise
end
# Replaced by attr_accessor
def noise=(value)
  @noise = value
end
```

The `attr_accessor` method is commonly used in classes, multiple attributes can be added in one go:

```ruby
# classes/attributes.rb
attr_accessor :noise, :age
```

These can be used interchangeably with methods since there might be cases where it could make sense to have a custom read/write method.

For example, in the class `Radio` below, `@volume` is readable and a custom method is defined to set it. This allows to control how the value is received.

However, the instance variable is being changed directly in `crank_it_up` and being accessed directly in `volume_status` instead of using `attr_reader`.

```ruby
class Radio
  # Volume attribute can be read.
  attr_reader :volume
  
  # Write method is custom and checks if the value is as expected before setting it.
  def volume=(value)
    return if value < 1 || value > 10
    @volume = value
  end

  # Bypasses the writter method and sets volume to a value it wouldn't normally accept.
  def crank_it_up
    @volume = 11
  end

  def volume_status
    "Current volume #{@volume}"
  end
```

The example above is valid, however the convention is to use the `self` keyword when setting an attribute (`self.volume`) and omit it when `volume` is being read:

```ruby
  #...
  def crank_it_up
    self.volume = 11
  end

  def volume_status
    "Current volume #{volume}"
  end
  #...
```

When setting a value, `self` is used to make it clear to Ruby that the value is being set to an instance variable rather than a local one. When a value is being read it is convention to omit it but it would be valid if `self` was present there.

Using `self` boils down to a few points:

- Use `self` to reference the current instance from inside the instance.
- Add `self` when calling writer methods (`self.first_name=`)
  - Helps Ruby understand that it is calling a method.
- Omit `self` when calling any other method (`first_name`)
- Including `self` is always going to be the safest choice.

## Method Access Control

Methods are the primary interfaces to a class, they can be used to set values and execute other actions. These interfaces should only be exposed when necessary, not all methods will require to run outside its class definition.

This is where access control comes in, restricts access to methods from outside an instance. It defines which methods are callable and which ones aren't.

There are three level of method access control:

|    Access control level |    Description    |
| ------------- |:-------------:|
| **public**     | Anyone can access the method (default) |
| **protected**      | Can only be called by instances of the class and its subclasses |
| **private**   | Can only be called by instances of a class |

> The focus of this section will be on `public` and `private` access for not as `protected` is better covered when class inheritance in introduced.

One method can be made `private` by adding the keyword above them to a class. It only needs to be added once and will make any methods below restricted to run inside the class only:

```ruby
# classes/method_access_control.rb
class Person
  attr_accessor :first_name, :last_name
  
  def full_name
    "#{first_name} #{last_name}"
  end  

  def initial_and_last_name
    "#{get_initial(first_name)} #{last_name}"
  end  

  private
    def get_initial(name)
      name.chars.first + '.'
    end
end

ree = Person.new
ree.first_name = "Rhianon"
ree.last_name = "Farrow"
puts ree.full_name
puts ree.initial_and_last_name
```

The `initial_and_last_name` can be called from an instance outside its class definition and it makes use of a method that is private to format its return value.

Additionally, the `public` keyword was not used since it can be omitted, any methods above the `private` keyword will be public.

There could also be `protected` methods by adding the keyword to the class.

```ruby
# classes/method_access_control.rb
class Person
  attr_accessor :first_name, :last_name
  
  def full_name
    "#{first_name} #{last_name}"
  end  

  def initial_and_last_name
    "#{get_initial(first_name)} #{last_name}"
  end

  protected
    def another_method
      "A protected method"
    end

  private
    def get_initial(name)
      name.chars.first + '.'
    end
end
```

When defining classes it is important to think about the access control of its methods as it is best practice to only allow access to methods when necessary.

## Initialize Method

The `initialize` method can be used to instantiate objects with default or customizations. It is called automatically whenever a new instance of a class is created. For example, is `Animal.new` is called, `initialize` will be called with it. 

```ruby
# classes/initialize_method.rb
class Animal
  attr_accessor :noise

  def initialize
    @noise = 'Ooof!'
    puts "New animal instantiated."
  end
end
```

It is useful to set attributes to a default or specific state. this is done by passing arguments to the `new` method which get passed on to the `initialize` method. Typically, this is done using an `options` hash.

```ruby
# classes/initialize_method.rb
def initialize(options={})
  @noise = options[:noise] || 'Ooof!'
end
#...

pig = Animal.new({noise: "Oink!"})
puts pig.noise
```

> There's a challenge available for this chapter: [Dice](challenges/dice/dice-challenge.md)

# Class Attributes and Methods

This sections will introduce class attributes and methods. These are different to intance attributes and methods since they can run with a class without it being instantiated.

## Class Methods

Class methods are used to define behaviors related to a class generally and not a specific instance. These methods are called directly on the class, not an instance.

An example is the `new` method. When `Animal.new` is called there is not instance yet. The `new` method is a class method that is being called directly on the `Animal` class.

Perhaps a more practical example would be `Bicycle.all_brands`. Calling this method would likes all brands a bicycle can have. However, an instance only has one. The `all_brands` methods does not apply to a specific bicycle but returns information of what brand one might have.

To define a *class method*, `self` is added to the method name. The name of the class would also work but most Rubyists would prefer `self`.

```ruby
# class-attributes-and-methods/class_methods.rb
class Animal
  def self.list_classes
    [
      'mammalia', 
      'actinopterygii', 
      'chondrichthyes', 
      'aves', 
      'amphibia', 
      'anthropods', 
      'reptilia'
    ]
  end
end

puts Animal.list_classes
```

The class method returns array of [classes an animal can belong to](https://en.wikipedia.org/wiki/List_of_animal_classes), and can be called on the `Animal` class itself without the using an instance.

A common pattern is to use class methods to create instances of class with custom values. This is called the factory pattern:

```ruby
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
```

The example above uses class methods to create instances of different types of products whilst using instance attributes for the name and price as these can be different for each instance.

#### Ruby documentation convention on class and instance methods
In Ruby documentation there is a convention for referencing both class and instance methods that aid in knowing which one is being used. Typically, when using a class method, dot notation is used (`Array.new`) and when using an instance method a hash sign is used instead (`Array#size`):

- Class method: `Array.new`
- Instance method: `Array#size`

This only applies to documentation and dot notation should be used on both bases when writing Ruby scripts.

# Further Resources
- [Ruby: Classes and Modules - LinkedIn Learning](https://www.linkedin.com/learning/ruby-classes-and-modules/class-attributes)
- [Ruby Monstas: Ruby for beginners](http://ruby-for-beginners.rubymonstas.org/index.html)
- [Ruby on Rails](https://rubyonrails.org/)