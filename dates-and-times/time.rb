#!usr/bin/env ruby

# The simplest form of accessing current time.
puts Time.now

# Methods can be ran on time to change its data type. The following statement returns a Unix timestamp.
puts Time.now.to_i

# Passing a Unix timestamp will return a timestamp at that time.
puts Time.at(1577100912)

# A custom time can be defined by creating a new instance of Time.
puts Time.new(2020, 11, 05, 00, 00, 00, "+02:00")
puts Time.new(2020, 03, 01)

# Addition and subtraction can be performed to acquire different times.
a_day = (60 * 60 * 24)
yesterday = Time.now - a_day
tomorrow = Time.now + a_day
next_week = Time.now + a_day * 7
next_year = Time.now + a_day * 365

puts yesterday
puts tomorrow
puts next_week
puts next_year

# There are multiple methods that can be called on a Time instance.

current = Time.now
puts current.year
puts current.month
puts current.day
puts current.hour
puts current.min
puts current.sec
puts current.nsec

# Returns the day of the year, for example it could be the 200th day in a year.
puts current.yday

# The day of the week can also be retrieved.
puts current.wday

# Boolean methods available to check whether it is a specific day of the week.
puts "Is it Monday? > #{current.monday?}" 
puts "Is it Friday? > #{current.friday?}"

# A string can be provided to format a time output.
puts current.strftime("Printed on %m/%d/%Y") 
puts current.strftime("at %I:%M%p")

# There are multiple methods to work with time zones:
puts "Time zone is #{current.zone}"
puts "Is it UTC? > #{current.utc?}"
puts "Is it GMT? > #{current.gmt?}"
puts "Is it DST? > #{current.dst?}"

puts current.gmt_offset
puts current.getutc
puts current.getlocal
puts current.utc
puts current.gmtime
puts current.localtime

# When comparing time with Time.now, will always return false as it is compared down to the nanosecond.
puts Time.now == Time.now
puts Time.now.nsec == Time.now.nsec
puts Time.now.day == Time.now.day