#!usr/bin/env ruby

# Makes use of the Date class using Ruby's Stardard Library.
require 'date'

# Formats the heading of the script.
def print_heading(heading="")
  formatted_title = "| #{heading} |"
  dashes = "-" * formatted_title.length
  puts dashes
  puts formatted_title
  puts dashes
end

# Number count suffix. e.g '3rd', '29th', '31st'.
def add_count_suffix(number)
  case
    when number.to_s.chars.last == "3"
      number.to_s + "rd"
    when number.to_s.chars.last == "2"
      number.to_s + "nd"
    when number.to_s.chars.last == "1"
      number.to_s + "st"
    else
      number.to_s + "th"
  end
end

# Collects user date of birth with a series of prompts.
def get_date_of_birth
  # Number of prompts the user will address before analysis.
  prompts = [
    'What year were you born in?',
    'What month were you born in?',
    'What day were you born in?'
  ]

  # Used to collect the year, the month and day a user was born.
  prompts.map! do |prompt|
    puts prompt
    gets.chomp.to_i
  end
  
  # Makes use of collected values to create a Date instance. 
  year, month, day = prompts
  Date.new(year, month, day)
end

# Prints information on a provided date.
def analyze_date_of_birth(date_of_birth)
  # When a date is invalid it exits early.
  if date_of_birth.class != Date
    puts "Date is not valid, analysis aborted."
    return nil
  end

  # Uses Date methods to determine analysis results.
  weekday = date_of_birth.strftime("%A")
  yearday = add_count_suffix(date_of_birth.yday)
  yearweek = add_count_suffix(date_of_birth.cweek)
  is_leap = date_of_birth.leap? ? "were" : "were not"

  # Prints results to the console.
  puts "You were born on a #{weekday}."
  puts "The #{yearday} day of the year."
  puts "The #{yearweek} week of the year."
  puts "You #{is_leap} born on a leap year."
end

# Prints scripts heading.
print_heading("Birth Date Analysis")

# Prompts user for a date.
user_dob = get_date_of_birth()

# Analyzes the date provided and prints results.
analyze_date_of_birth(user_dob)