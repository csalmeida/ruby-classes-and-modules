#!usr/bin/env ruby

require 'date'

puts Date.today
puts Date.today.month
# Convert to Time.
puts Date.today.to_time

# Dates can also be instantiated.
date = Date.new(1970, 01, 13)
puts date

# Is this a leap year?
puts "Is 1970 a leap year? > #{date.leap?}"

# Calendar week.
puts date.cweek
# Calendar weekday.
puts date.cwday

# Next day, next month and next year.
puts date.next_day
puts date.next_month
puts date.next_year

# Similar the previous day, month and year can be retrieved.
puts date.prev_day
puts date.prev_month
puts date.prev_year

# Which calendar is applied.
puts date.gregorian?
puts date.julian?