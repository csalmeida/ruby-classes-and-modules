class ToDoList
  # This module is part of Ruby's core and can be imported without 'require'.
  include Enumerable

  attr_reader :items

  def initialize(items=[])
    unless items.is_a?(Enumerable)
      raise TypeError
    end

    @items = items

  rescue TypeError => e
    puts "Exception: Expected Enumerable got #{items.class}, '#{items}'."
    puts e.full_message
  end

  # Appends a new item to the front of the array.
  def <<(item)
    @items.unshift(item)
  end

  # Each is required for the Enumerable module to be usable.
  def each
    @items.each {|item| yield(item)}
  end
end