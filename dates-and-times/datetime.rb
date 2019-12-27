#!usr/bin/env ruby

# DateTime belong to the same library as Date.
require 'date'

# DateTime has similar methods to Time and Date.
puts DateTime.now
puts DateTime.new(2020, 11, 05, 00, 00, 00, "+02:00")

# DateTime can be converted to a Time and vice versa.
puts Time.now.to_datetime
puts DateTime.now.to_time

# Most Time and Date methods are available.
date = DateTime.now
puts date.day
puts date.month
puts date.year