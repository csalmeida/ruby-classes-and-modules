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

Classes provide templates for creating objects or instances of a class that have unique attributes and behaviour and can interact with eachother in complex ways.

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

Objects can be instanciated from custom classes as well:

```ruby
# classes/instances.rb
class Person
end

person_1 = Person.new
person_2 = Person.new
```

Each instance is based on its respective class, however they might hold different values. For example, a `String` class can hold any combination of characters, `"Ruby"` or `7u3y`. Both are strings but have different values.

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

The example above shows the file where the `Person` class is defined being imported into a main script file. Then a `Person` can be instanciated and methods associated with that object can be used.