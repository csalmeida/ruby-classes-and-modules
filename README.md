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
  - [Class Attributes](#class-attributes)
  - [Class read/write methods](#class-read/write-methods)
  - [Challenge: Radio](challenges/radio/radio-challenge.md)
- [Inheritance](#inheritance)
  - [Class Inheritance](#class-inheritance)
  - [Override and Extend](#override-and-extend)
  - [Access the superclass](#access-the-superclass)
  - [Challenge: Secure Radio](challenges/secure-radio/secure-radio-challenge.md)
- [Dates and Times](#dates-and-times)
  - [Time](#time)
  - [Date](#date)
  - [DateTime](#datetime)
  - [Challenge: Birth Date Analysis](challenges/birth-date-analysis/birth-date-analysis-challenge.md)
- [Modules](#modules)
  - [Namespacing](#namespacing)
  - [Mixins](#mixins)
  - [Load, Require and Include](#load-require-and-include)
  - [Challenge: To-do List](challenges/to-do-list/to-do-list-challenge.md)
- [Exceptions](#exceptions)
  - [Handle Exceptions](#handle-exceptions)
  - [Handle Specific Exceptions](#handle-specific-exceptions)
  - [Exception Methods](#exception-methods)
  - [Raise Exceptions](#raise-exceptions)
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

### Read/Write Methods

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

This sections will introduce class attributes and methods. These are different to instance attributes and methods since they can run with a class without it being instantiated.

## Class Methods

Class methods are used to define behaviors related to a class generally and not a specific instance. These methods are called directly on the class, not an instance.

An example is the `new` method. When `Animal.new` is called there is not instance yet. The `new` method is a class method that is being called directly on the `Animal` class.

Perhaps a more practical example would be `Bicycle.all_brands`. Calling this method would likes all brands a bicycle can have. However, an instance only has one. The `all_brands` methods does not apply to a specific bicycle but returns information of what brand one might have.

To define a *class method*, `self` is added to the method name. The name of the class would also work but most *Rubyists* would prefer `self`.

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
# class-attributes-and-methods/class_methods.rb
class Product
  attr_accessor :name, :price

  def initialize(price=0.0)
    @price = price
  end

  def self.exclusive
    Product.new(45.0)
  end

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

## Class Attributes

Similar to class methods, class attributes relate to a class generally and not to any specific instance. This is what makes them different from instance attributes.

These are stored in a class and become shared values among all instances of the class and any instance can access it. Class attributes are used less frequently than class methods.

The first aspect to understand is how to define a `class` variable. Class variables will be defined with `@@` (double at sign) prefixing its name, see [variable scope indicators](https://github.com/csalmeida/ruby-fundamentals#variable-scope-indicators) for more whole table of variable declarations.

```ruby
# class-attributes-and-methods/class_attributes.rb
class Animal
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']

  def self.species
    @@species
  end
end

Animal.species # 
```

A class attributes is defined and a class method is used to return its value. Class attributes can also be used to track how many instances of a class were created:

```ruby
# class-attributes-and-methods/class_attributes.rb
class Animal
  @@current_animals = []

  def initialize
    @@current_animals << self
  end

  def self.current_animals
    @@current_animals
  end

  def self.count
    @@current_animals.count
  end
end

cat = Animal.new
dog = Animal.new
chicken = Animal.new
sheep = Animal.new

Animal.count # 4
Animal.current_animals # [#<Animal:0x00007fd0292a83d8>,#<Animal:0x00007fd0292a8388>, #<Animal:0x00007fd0292a8360>, #<Animal:0x00007fd0292a8338>]
```

## Class read/write methods

Class read/write methods are similar to [instance read/write methods](#read/write-methods). However, there are not equivalent to `attr_*` methods except on the [Ruby on Rails](https://rubyonrails.org/) framework as the `cattr_*` but not on Ruby yet. This could be because they're not used that often.

Read/write methods are defined almost the same way as instance read/write methods with the different of class ones using the `self` keyword:

```ruby
# class-attributes-and-methods/class_read_write_methods.rb
class Animal
  @@species = ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']

  def self.species
    @@species
  end

  def self.species=(array)
    return unless array.is_a(Array)
    @@species = array
  end
end
```

In the example above there is a method to access `Animal.species` and another to set it, using the same syntactic sugar mentioned when defining these methods for instance variables:

```ruby
# class-attributes-and-methods/class_read_write_methods.rb
Animal.species # ['cat', 'cow', 'dog', 'duck', 'horse', 'pig']
Animal.species = ['elephant', 'crocodile']
```

The `species` class attribute can read and reset with other values when read/write methods are in place.

> There's a challenge available for this chapter: [Radio](challenges/radio/radio-challenge.md)

# Inheritance

The concept of inheritance is a fundamental part of object-oriented programming (OOP). Classes can inherit methods and attributes from others, further extending their functionality.

## Class Inheritance

It is the bestowal of behaviors from another class. A class can be extended by another to make use of its methods and attributes.

In previous sections an `Animal` class was defined and different animals would be instantiated from it. This approach is completely valid, however, inheritance could also be applied to create classes that inherit `Animal` behavior. For example a `Cow`, `Lion` or `Snake` class could all inherit from `Animal`.

This means that `Animal` would become a `superclass` or parent class whilst any others that inherit from it would become `subclass`es or children classes.

```ruby
# inheritance/class_inheritance.rb
class Animal
  attr_accessor :noise
end

class Pig < Animal
  def initialize
    @noise = "Oink!"
  end
end

class Cow < Animal
  def initialize
    @noise = "Moo!"
  end
end
```

In the example above the `Pig` and `Cow` classes inherit `@noise` from `Animal`. A parent class must be defined before a subclass can inherit from it, so any superclass files need to be required before any subclasses are used.

Inheritance can be useful to organize code and make it easier to stick to DRY (Don't Repeat Yourself) principles.

## Override and Extend 

In short, subclasses override and extend behaviors of its parent class.

When creating a `subclass` with inheritance, the same behaviors and attributes of its parent (`superclass`) are passed down. Overriding and extending a `subclass`'s behaviors is useful in order to create more complex functionality. Otherwise, if just inheritance was used a new class would be created from its parent but everything aside from a few values would differ between the two, it would act exactly like the parent.

```ruby
# inheritance/override_extend.rb
class Sofa
  @@can_open = false
  attr_accessor :width, :length

  def area
    width * length
  end
end

class SofaBed < Sofa
  @@can_open = true
  attr_accessor :length_opened
  attr_reader  :is_open

  def area
    @is_open ? width * @length_opened : width * length
  end
  
  def open
    @is_open = true
  end

  def close
    @is_open = false
  end
end
```

In the example above, the `SofaBed` class is extended to have two additional attributes. The `SofaBed#area` method is overridden to make use of these extra attributes.

It also has two additional methods to open or close the sofa. These do not exist in the `Sofa` class and can only be used when a `SofaBed` is instantiated.

## Access the superclass

This section will describe a technique to access the `superclass` (parent class) from a `subclass` (child class). After overriding methods, the parent methods can still be accessed.

There are two main reasons why this might be useful. One is to perform additional code before and/or after a parent method is executed, adding some extra steps in the beginning or cleanup in the end.

```ruby
class Chef
  def make_dinner
    puts "Cook food."
  end
end

class AmateurChef < Chef
  def make_dinner
    puts "Read recipe"
    super
    puts "Clean up mess."
  end
end
```

In the example above, the `Chef` class is able to `make_food` in one step. `AmateurChef` however, has to read the recipe and clean up the mess afterwards. The `AmateurChef#make_dinner` is overridden to add these extra steps but `Chef#make_dinner` is called in between them using the `super` keyword.

When `super` is called, it will run `Chef#make_dinner`, and if this method changes, the `AmateurChef` class will inherit this behavior as well.

The second reason to use this technique is as a fallback to the parent method if a condition is not met.

```ruby
class Image
  attr_accessor :resizable

  def geometry
    "800x600"
  end
end

class ProfileImage < Image
  def initialize
    @resizable = true
  end

  def geometry
    @resizable ? "100x100" : super
  end
end
```

In this second example `Image` returns a geometry. `ProfileImage` is defined as a subclass of `Image` and overrides the `ProfileImage#geometry` method to let `Image#geometry` take over when the image is not `@resizable`, using `super`.

### Further notes on superclass access

Additionally, `super` can be assigned to a variable, for example `x = super`. If the parent class method takes arguments, these can also be passed to `super` as it is a method and works the same way.

> There's a challenge available for this chapter: [Secure Radio](challenges/secure-radio/secure-radio-challenge.md)

# Dates and Times

Date and time based classes are useful in Ruby and when writting program in general, section is an introduction to these classes.

## Time

Times are stored as the number of seconds since January 1st, 1970. Otherwise known as [Unix time or seconds since the Epoch](https://en.wikipedia.org/wiki/Unix_time).

All times include fractions of a second which is important for comparisons.

The fastest way to get the current time in Ruby is using `Time.now` class. It will return the current time with the default format. Alternatively, a Unix timestamp can also be retrieved.

```ruby
# dates-and-times/time.rb
Time.now # 2019-12-23 12:51:12 +0000
Time.now.to_i # 1577105472
Time.at(1577100912) # 2019-12-23 11:35:12 +0000
```

However, it is more common that more readable date formats are used instead. Using `Time.new` a custom format can be retrieved instead.

```ruby
Time.new(year, month, day, hour, minute, second, utc_offset)
```

```ruby
# dates-and-times/time.rb
Time.new(2020, 11, 05, 00, 00, 00, "+02:00") # 2020-11-05 00:00:00 +0200
Time.new(2020, 03, 01) # 2020-03-01 00:00:00 +0000
```

Addition and subtraction can be applied to find different times:

```ruby
# dates-and-times/time.rb
a_day = (60 * 60 * 24)
yesterday = Time.now - a_day # 2019-12-23 11:05:08 +0000
tomorrow = Time.now + a_day # 2019-12-25 11:05:08 +0000
next_week = Time.now + a_day * 7 # 2019-12-31 11:05:08 +0000
```

Additionally, there are multiple methods that can be called to retrieve a single part of time:

```ruby
# dates-and-times/time.rb
current = Time.now
current.year # 2019
current.month # 12
current.day # 24
current.hour # 12
current.min # 18
current.sec # 56
current.nsec # 516215000
```

There are methods that can get more specific parts of time such as the day of the year (`Time#yday`), the day of the week (`Time#wday`) and boolean methods that allow to understand if the date is on a certain day of the week (`friday?`):

```ruby
# dates-and-times/time.rb
current.yday # 358
current.wday #  2
current.monday? # false
current.friday? # true
```

Ruby also supports `strftime` (string for time or string-formatted time). This method is common to a lot of programming languages and [a format can be provided with a string](https://apidock.com/ruby/DateTime/strftime), defining how a date should be returned:

```ruby
# dates.and-times/time.rb
current.strftime("Printed on %m/%d/%Y") # Printed on 12/24/2019
current.strftime("at %I:%M%p") # at 12:56PM
```

Additional methods can be used to work with time zones:

```ruby
# dates-and-times/time.rb
current.zone # WET
current.utc? # false
```

Consult `ri` or the Ruby documentation for more notes on the `Time` class.

Finally, when comparing time, the following statement will always return `false`:

```ruby
# dates-and-times/time.rb
Time.now == Time.now # false
Time.now.nsec == Time.now.nsec # false
Time.now.day == Time.now.day # true
```

This is because Ruby compares time down to the nanosecond so each of these instances will have a different time when they were instantiated.

## Date

The `Date` class is similar to `Time` and can be useful when working with dates without the need of the time. The `Date` class includes methods that are not available in `Time`.

The `Date` class is part of Ruby's Standard Library. When Ruby is installed, the `Date` class is added as well but it is not loaded. This means `Date` won't be available on `irb` or Ruby scripts until specified.

All _Core_ methods are loaded automatically, whilst _Standard Library_ methods need to be referenced before use. Consult the [Ruby Documentation](https://ruby-doc.org/) for a complete list.

To use `Date` or any Standard Library class, a `require` statement needs to be added to `irb` or the Ruby script.

```ruby
# dates-and-times/date.rb
require 'date'
Date.today
Date.today.month
Date.today.to_time
```

Additional methods are only present in the `Date` class:

```ruby
# dates-and-times/date.rb
date = Date.new(1970, 01, 13)

date.leap?
date.cweek
date.cwday
date.cwyear

date.next_day
date.next_month
date.next_year
```

## DateTime

The `DateTime` class is also part of the Ruby Stardard Library and it needs to be included in a script before being used. It is a subclass of `Date` so it does inherit some of its behavior.

To use `DateTime` the `date` library must be required, than similar methods to `Date` and `Time` might be used:

```ruby
# dates-and-times/datetime.rb
require 'date'
DateTime.now
DateTime.new(2020, 11, 05, 00, 00, 00, "+02:00")
```

However, why wouldn't `Time` be used instead? `DateTime` know how to distinguish between the Gregorian and Julian calendars, so it is useful when working with historical dates. When working with modern dates, `Time` would be most appropriate in most cases.

If required a `Time` object can be converted to `DateTime` and vice versa:

```ruby
# dates-and-times/datetime.rb
DateTime.now.to_time
Time.now.to_datetime
```

The `Time` class tends to be the most useful class when working with dates and times. However, `Date` and `DateTime` add further functionality for more complex cases.

> There's a challenge available for this chapter: [Secure Radio](challenges/birth-date-analysis/birth-date-analysis-challenge.md)

# Modules

Modules are wrappers around Ruby code like Classes. However, unlike classes, modules cannot be instantiated.

Modules are typically used in use for namespacing and in mixins.

## Namespacing

Namespacing is used to prevent conflicts when code has similarly named classes and methods.

For example, in a classroom two people might have the same name, like Sophia.

To differenciate between the two, the surname initially might be added when refering or calling them. In code, namespacing works the same way.

A pratical example could be the definition of a `Date` class for MakeSparks a fictitious online dating site. `Date` exists within Ruby's Standard Library, so the new class should be namespaced to avoid conflicts, by wrapping it in a module:

```ruby
# modules/namespacing.rb
module MakeSparks
  class Date

    def initialize(double_date=false)
      @double_date = double_date
    end

    def booking
      "A date is booked for #{is_double?} at Tulsa's Botanical Garden's Restaurant by 7:30PM."
    end

    private

      def is_double?
        @double_date ? 4 : 2
      end
  end 
end
```

The `MakeSparks` module has its own `Date` class which can be used and instantiated by prefixing it with its namespace:

```ruby
# modules/namespacing.rb
date_for_two = MakeSparks::Date.new # A date is booked for 2 at Tulsa's Botanical Garden's Restaurant by 7:30PM.
```

Using namespaces not only prevents conflicts with Ruby classes but also other code part of a project's codebase. As it grows there might be reasons to reuse a class name and differentiate them using namespacing. 

Namespacing is frequently used to namespace classes in open-source plugins.

## Mixins

Ruby only allows subclasses to inherit from a single superclass, meaning a subclass can only have one parent.

Mixing modules allow for shared functionality to be packaged up and then be mixed in one or multiple classes without having to inherit from it.

Considering an arbitrary `Person` class, it could be used as a parent class to other subclasses such as `Customer` or `Supplier`:

```ruby
# modules/mixins.rb
class Person
  attr_accessor :first_name, :last_name
  attr_accessor :city, :state, :zip
  attr_accessor :age, :gender

  def full_name
    "#{first_name} #{last_name}"
  end

  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end 

class Customer < Person
end

class Supplier < Person
end
```

Using class inheritance in the example above, both `Customer` and `Supplier` will inherit all `Person` functionality. However, `Customer` and `Supplier` only need some functionality shared between them, `Person#age` and `Person#gender` are not needed in its subclasses.

In this case code can be packaged up in mixins and be included in other classes as needed. For example a `Nameable` and a `ContactInfo` module:

```ruby
# modules/mixins.rb
module Nameable
  attr_accessor :first_name, :last_name

  def full_name
    "#{first_name} #{last_name}"
  end
end

module Contactinfo
  attr_accessor :city, :state, :zip

  def city_state_zip
    "#{city}, #{state} #{zip}"
  end
end
```

In this case, all functionality aside from `Person#age` and `Person#gender` has been split into modules and can now be shared across multiple classes without them inheriting unwanted behavior:

```ruby
# modules/mixins.rb
class Person
  include Nameable
  include Contactinfo
  attr_accessor :age, :gender
end

class Customer
  include Nameable
  include Contactinfo
end 

class Supplier
  include Nameable
  include Contactinfo
end
```

### Class Inheritance vs. Mixins

It might be difficult to identify when to use class inheritance and mixins as it might seem that both accomplish the same goal.

In general, class inheritance is used when a class needs to modify or extend the behavior of another class. Something similar to its parent class but with slight differences.

Mixins on the other hand are used when several classes need to utilize a single set of behaviors.

There might also be cases where it would make little difference between using one or the other and it is up to developer to make the decision on which one would be best.

## Load, Require and Include

When splitting scripts in multiple files and coding with the DRY (Don't Repeat Yourself) principle in mind, it becomes important to understand different ways of adding them and use them in a script.

There are three ways of adding code from another file or module into scripts, `load`, `require` and `include`.

`load`, loads a source file everytime it is called and it returns a boolean on whether the file was loaded successfully. However, it does 

It is not used very often since `require` is more frequently.

`require` works exactly the same as `load` but it loads a source file only once and keeps track of it for the duration of the script.

It only returns `true` if a file has been loaded successfully and has not been loaded before.

`require` must be either provided a full path to a file, or a Standard Library path which is part of `$LOAD_PATH`.

> `$LOAD_PATH` is an array of paths Ruby makes use when looking to load libraries or classes part of its Standard Library. `require` looks in those paths for them or in a full path when provided.

`include` is only used when including modules in classes and *cannot* be used with files. An important difference when compared with the two other keywords above.

> Other programming languages might change the meaning and functionality of these keywords.

```ruby
require 'date'

require 'Users/grivia/project/classes/customer'

require_relative 'modules/addressable'

class Customer
  include Addressable
end
```

In the example above, the `Date` class is required from Ruby's Stardard Library and no further path is required.

The `Customer` class is imported into the file using `require` a second time. In this case it is a custom file and therefore the whole path needs to be specified.

Next the `Addressable` module is added to the script using `require_relative`. This is the same as `require` with the difference that the file path provided can be shortnened relatively to the file requiring it.

Lastly, `Customer` is overwritten and the `Addressable` module is added by using `include`.

> There's a challenge available for this chapter: [To-do List](challenges/to-do-list/to-do-list-challenge.md)

## Exceptions

Exceptions are classes for handling exceptional events. Unexpected behaviour or events, most often (but not always) are errors. Error exceptions can be thrown as, for instance, `SyntaxError`s or `NoMethodError`s.

Errors belong to Ruby's exception class and they could be referred as in _"an exception as been raised"_. Ruby [has many built in exceptions as subclasses of the `Exception` class](https://ruby-doc.org/core-2.7.0/Exception.html).

Most common exceptions thrown in Ruby are usually a `StandardError`.

## Handle Exceptions

A way to throw an exception in Ruby is to divide a number by zero, a `ZeroDivisionError` is thrown:

```ruby
1 / 0 # ZeroDivisionError
```

When running this code in `irb`, a list of all the places where it broke is printed to the console. This is useful when programming and debugging code, however, this output is not useful to users and should be ommited.

To do this, additional code can be put in place to handle the exception, allowing the script to fail gracefully.

```ruby
# exceptions/handle-exceptions.rb
begin
  1 / 0
rescue
  puts "Exception: Cannot divide number by zero."
end
```

The code which could raise an exception is put under the `begin` keyword, and code that handles the exception is put under the `rescue` keyword.

The code is really put between a `begin` and `end` block and aids in letting Ruby know that `rescue` applies to all code in that block.

If anything goes wrong anywhere in that block, Ruby will jump to the `rescue` line and run the code there instead. It could run another method, or it could return another error message instead.

`rescue` can also be used in method definitions, `def` and `end` blocks act as the delimiters of which code `rescue` applied to:

```ruby
# exceptions/handle-exceptions.rb
def divide(x,y)
  x / y
rescue
  puts "Exceptions raised, cannot divide #{x} with #{y}."
end
```

Furthermore, exceptions do not need to be handled inside the method:

```ruby
# exceptions/handle-exceptions.rb
def divide(x,y)
  x / y
end

begin
  divide(1,0)
rescue
  puts "Exceptions raised when trying division."
end
```

This is because exceptions get returned like any other value in Ruby, and even if it was thrown in a method deep in the code of a script it will keep getting returned until it's handled or it is the end of the script.

## Handle Specific Exceptions

In the previous section, only the `rescue` keyword was used to handle any exceptions thrown in a code block. However, `rescue` defaults to handling `StandardError` and its subclasses and sometimes it might be useful to specify exacly what kind of exception is to be handled.

This can be achieved by adding the exception name after `rescue`:

```ruby
# exceptions/handle-specific-exceptions.rb
def divide(x,y)
  x / y
rescue ZeroDivisionError
  puts "ZeroDivisionError handled"
rescue TypeError
  puts "TypeError handled"
rescue
  puts "Some other StandardError handled"
end
```

Multiple exceptions may be specified, separated by a comma:

```ruby
# exceptions/handle-specific-exceptions.rb
def divide(x,y)
  x / y
end

begin
  divide(4,0)
  divide(4, "2")
  divide(4)
rescue ZeroDivisionError
  puts "Cannot divide by zero"
rescue TypeError, ArgumentError
  puts "Requires two integer arguments"
end
```

In the example above the exceptions were moved outside of the method, since `ArgumentError` gets thrown even before the code inside `divide` has a chance to run. Depending on the exception being handled, the place where it needs to run may differ. A refactored example could look like:

```ruby
def divide(x,y)
  x / y
rescue ZeroDivisionError
  puts "ZeroDivisionError handled"
rescue TypeError
  puts "TypeError handled"
end

begin
  puts divide(4,2)
  divide(4,0)
  divide(4,"2")
  divide(4)
rescue ArgumentError
  puts "Requires two integer arguments."
end
```

However, one gotcha is that the `Exception` class will also be accepted by `rescue`. This should not be used since it will take over other exceptions Ruby uses internally:

```ruby
# Don't do this!
begin
  1 / 0
rescue Exception
  puts "Puts every exception is handled"
  puts "Even those Ruby uses internally to work"
end
```

## Exception Methods

The `Exception` class contains a multitude of methods that can be used alongside `rescue` to aid in exception handling.

The first step is to hold an instance of `Exception` in a local variable (usually named `e`) using the hash rocket sign `=>`. Assigning the exception to a variable allows it to be used inside the rescue block, and methods can be called on them:

```ruby
# exceptions/exceptions_methods.rb
begin
  1 / 0
rescue ZeroDivisionError => e
  puts "#{e.class} handled"
rescue => e
  puts "#{e.class} handled"
end
```

In the example above, the first rescue block will always print `ZeroDivision handled`, as the block only handles a single exception.

The subsequent block handles all `StandardError` exceptions and could print for instance a `TypeError` or an `ArgumentError` when using `e.class`.

There is a choice of methods that can be run on an `Exception` instance, consult Ruby's documentation for further notes:

|  Methods  |  Description  |
| ------------- |:-------------:|
| `Exception#class`    | Useful to understand which exception was raised and when handling each exception a different way within a `rescue` |
| `Exception#message`      | Short error message that points out what went wrong. |
| `Exception#backtrace`   | Returns the path the code has taken through various files and method calls. can be useful to trackdown issues that occur when coding a script. |
| `Exception#full_message`   | Combines `Exception#class`, `Exception#message` and `Exception#backtrace` into a single message. |

Methods listed above can all be used inside a `rescue` block:

```ruby
#exceptions/exception_methods.rb
def divide(x,y)
  x / y

  rescue ZeroDivisionError => e
    puts "ZeroDivisionError handled when dividing #{x} with #{y}"
    puts "Backtrace: #{e.backtrace}"
  rescue TypeError => e
    puts "TypeError handled: #{e.message}"
  rescue => e
    puts "#{e.class} handled"
end
```

## Raise Exceptions

Ruby will raise exceptions when code goes wrong. Additionally exceptions can alse be intentionally raised in custom Ruby scripts.

This can be achieved either by using Ruby's built-in exception classes or by writting custom exceptions.

The `Exception` class has a list of subclasses available in [Ruby's documentation](https://ruby-doc.org/core-2.7.0/Exception.html).

When raising an exception, the developer can pick which exception is being raised from that list of subclasses. However, the default is `RuntimeError` if no particular exception is specified:

```ruby
# exceptions/raise_exceptions.rb
def even_numbers(array)
  unless array.is_a?(Array)
    raise ArgumentError
  end

  if array.length == 0
    raise StandardError.new("Too few elements: #{array.length}")
  end

  array.find_all {|item| item.to_i % 2 == 0}
end
```

The example above will raise an `ArgumentError` exception when the data type of its argument is not an `Array`. It will also raise a `StandardError` exception for when the array provided is empty. `StandardError.new` takes in a message which will print to the console when the exception is raised.

In previous examples, a `Radio` class has been used. In it's volume method it wouldn't return anything unless the volume was between `1` and `10`. An exception could be raised here:

```ruby
class Radio
  attr_accessor :volume

  def volume=(value)
    if value < 1 || value > 10
      raise "Too loud!"
    end
    @volume = value
  end
end

begin
  radio = Radio.new
  radio.volume = 20
rescue RuntimeError => e
  puts e.message
end
```

The `raise "Too loud!"` statement raises an `RuntimeError` exception by default and is taking a message as its argument. This exception is rescued later on inside a `begin` and `end` block.

# Further Resources
- [Ruby: Classes and Modules - LinkedIn Learning](https://www.linkedin.com/learning/ruby-classes-and-modules/class-attributes)
- [Ruby Monstas: Ruby for beginners](http://ruby-for-beginners.rubymonstas.org/index.html)
- [Ruby on Rails](https://rubyonrails.org/)