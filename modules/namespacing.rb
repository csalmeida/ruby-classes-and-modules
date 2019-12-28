#!usr/bin/env ruby

require 'date'

# A class can be namespaced to avoid conflits with another.
# In this case this date class is name spaced to MakeSparks.
module MakeSparks
  class Date

    def initialize(double_date=false)
      @double_date = double_date
    end

    def booking
      "A date is booked for #{is_double?} at Tulsa's Botanical Garden's Restaurant by 7:30PM."
    end

    private

      def is_double?
        @double_date ? 4 : 2
      end
  end 
end

# Date will instantiate Ruby's Standard Library version of the class.
someday = Date.new(2077)
puts "Someday it will be #{someday.year}."

# MakeSparks' Date class needs to be prefixed with it's namespace in order for Ruby to run it.
date_for_two = MakeSparks::Date.new
date_for_four = MakeSparks::Date.new(true)

puts date_for_two.booking
puts date_for_four.booking