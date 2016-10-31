require 'pry'

require_relative 'player'
require_relative 'slots'
require_relative 'indian_poker'



class Casino
  attr_accessor :name, :location, :minimum_age, :value
  def initialize(name, location, minimum_age, value)
    @name = name
    @location = location
    @minimum_age = minimum_age
    @value = value

  end
end

@player_1 = Person.new
@casino_1 = Casino.new("Ruby Casino", "Salt Lake City", 21, 1000)


#puts "Welcome to the #{@casino_1.name}!"

def greeting
  puts "\nWelcome to the wonderful world of Gambling!"
  puts "What Casino are we visiting today?"
  puts "1: #{@casino_1.name}"
  puts "2: Other Casino"
  puts "3: Exit"
  puts "-- Make Selection --"
  selection = gets.strip.downcase
  case selection
  when "1", "ruby casino", "ruby"
    ruby_casino
  when "2"
    puts
    puts "***** Closed for renovation. Come back later. *****"
    greeting
  when "3", "exit"
    puts "Thank for coming!"
    exit
  else
    "We dont have access to that Casino!"
    greeting
  end
end

def ruby_casino
  puts
  puts "~~~~~ Welcome to the #{@casino_1.name} #{@player_1.name}! ~~~~~"
  puts "\nWe are thrilled to have your money... I mean you!"
  if @player_1.age < @casino_1.minimum_age
    puts "\nOhh wait... Our minimum age at the #{@casino_1.name} is #{@casino_1.minimum_age}..."
    puts "\nCome back in #{@casino_1.minimum_age - @player_1.age} year(s)!"
    puts
    exit
  else
  end
  ruby_casino_menu
end

def ruby_casino_menu
  puts "Feeling Lucky?"
  puts "Where are we starting today?"
  puts
  puts "$$$ #{@casino_1.name} Games $$$"
  puts "1: Slots"
  puts "2: Indian Poker"
  puts "3: Exit"
  if @casino_1.name != "Ruby Casino"
    puts "4: My Casino Settings"
  else
  end
  puts "-- Make Selection --"
  selection = gets.strip.downcase
  case selection
  when "1", "slots"
    slots_menu
  when "2", "indian", "indian poker"
    indian_menu
  when "3", "exit"
    puts "\nI hope you enjoyed your time at the #{@casino_1.name}!"
    puts "Come Again"
    greeting
  when "4", "settings"
    casino_settings
  else
    puts "Invalid Selection, Please choose from the list above."
    ruby_casino_menu
  end
end

def casino_settings
  puts "\nWelcome to #{@casino_1.name} Settings!"
  puts "1: Change Casino Name"
  puts "2: Change Your Name"
  puts "3: Exit"
  selection = gets.strip.downcase
  case selection
  when "1"
    puts "What would you like to change #{@casino_1.name} name to?"
    casino_name = gets.strip
    @casino_1.name = casino_name
    puts "The new name is #{@casino_1.name}!"
    casino_settings
  when "2"
    puts "Now that your the big shot here, what would you like everyone to call you?"
    new_name = gets.strip
    @player_1.name = new_name
    puts "Alright, from now on we call you #{@player_1.name}"
    casino_settings
  when "3", "exit"
    ruby_casino_menu
  else
    puts "Invalid Selection"
    casino_settings
  end
end


while true
  greeting
end
