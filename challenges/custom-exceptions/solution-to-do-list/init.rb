#!usr/bin/env ruby

require_relative 'classes/to_do_list'

items = ['dishes', 'nap', 'laundry', 'vacuum']
list = ToDoList.new(items)

puts
puts "First: " + list.first
puts
puts "Longest: " + list.find {|item| item.length > 6}
puts
puts "Original list:"
puts list.map {|item| "> #{item.capitalize}"}

list << "sweep"
puts
puts "Updated list:"
puts list.map {|item| "> #{item.capitalize}"}

puts
puts "Sorted:"
list.sort.each_with_index do |item, index|
  puts "#{index + 1}: #{item.capitalize}"
end
puts