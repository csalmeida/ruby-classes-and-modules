#!usr/bin/env ruby

require_relative 'classes/tuner'
# require_relative 'classes/radio'

# puts "Creating a radio..."
# radio = Radio.new
# puts radio.status

# puts "Lowering volume..."
# radio.volume = 1
# puts radio.status

# puts "Changing station..."
# radio.freq = 92.2
# puts radio.status

puts "---------------------------------"

puts "Creating a tuner..."
tuner = Tuner.new
puts "Station: #{tuner.freq} #{tuner.band}"
tuner.freq = 92.2
puts "Frequency change: #{tuner.freq} #{tuner.band}"

tuner.switch_band
puts "Switching band to #{tuner.band}"
puts "Frequency change: #{tuner.freq} #{tuner.band}"

tuner.switch_band
puts "Switching band a second time to #{tuner.band}"
puts "Frequency change: #{tuner.freq} #{tuner.band}"

tuner.switch_band
puts "Switching band a third time to #{tuner.band}"
puts "Frequency change: #{tuner.freq} #{tuner.band}"
