#!usr/bin/env ruby

require_relative 'classes/radio'

# FM Radio
puts "Creating an FM radio..."
fm = Radio.fm
puts fm.status

puts "Lowering volume..."
fm.volume = 1
puts fm.status

puts "Changing station..."
fm.freq = 92.2
puts fm.status

puts "---------------------------------"

# AM Radio
puts "Creating an AM radio..."
am = Radio.am
puts am.status

puts "Increasing volume..."
am.volume = 10
puts am.status

puts "Changing station..."
am.freq = 647.9
puts am.status
