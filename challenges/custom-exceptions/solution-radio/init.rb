#!usr/bin/env ruby

require_relative 'classes/radio'

puts "Creating an FM radio..."
fm = Radio.fm
puts fm.status

puts "Changing volume..."
fm.volume = 1
puts fm.status