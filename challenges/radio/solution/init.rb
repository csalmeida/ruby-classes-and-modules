#!usr/bin/env ruby

require_relative 'classes/radio'

fm = Radio.new

puts fm.volume
fm.volume = 11
puts fm.volume
fm.volume = 3
puts fm.volume

puts Radio.bands_range
puts fm.band
puts fm.freq