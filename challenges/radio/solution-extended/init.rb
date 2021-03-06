#!usr/bin/env ruby

require_relative 'classes/tuner'
require_relative 'classes/radio'

puts "Creating a radio..."
radio = Radio.new
puts radio.status

puts "Lowering volume..."
radio.volume = 1
puts radio.status

puts "Changing station..."
radio.tuner.freq = 92.2
puts radio.status

puts "---------------------------------"

puts "Creating an FM radio..."
fm = Radio.fm
puts fm.status

puts "Changing volume..."
fm.volume = 6
puts fm.status

puts "Changing station..."
fm.tuner.freq = 88.6
puts fm.status

puts "---------------------------------"

puts "Creating an AM radio..."
am = Radio.am
puts am.status

puts "Changing volume..."
am.volume = 3
puts am.status

puts "Changing station..."
am.tuner.freq = 541.13
puts am.status

puts "---------------------------------"
