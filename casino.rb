require 'pry'
require 'colorize'
require 'sounder'

require_relative 'player'
require_relative 'slots'
require_relative 'high_low'
require_relative 'blackjack'
require_relative 'roulette'
require_relative 'rock_paper_scissors'
require_relative 'blackjack_deck'

require_relative 'josh_cards'

@winning_sound = Sounder::Sound.new "assets/winning.mp3" # @winning_sound.play to use
@losing_sound = Sounder::Sound.new "assets/losing.mp3" # @losing_sound.play to use
@wahwah_sound = Sounder::Sound.new "assets/wahwah_lose.mp3" # @wahwah_sound.play to use
@money_sound = Sounder::Sound.new "assets/cashmoney.mp3" # @money_sound.play to use
@shuffle_sound = Sounder::Sound.new "assets/card_shuffle.mp3" # @shuffle_sound.play to use

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
@player_2 = 0
@casino_1 = Casino.new("Ruby Casino", "Salt Lake City", 21, 1000)


#puts "Welcome to the #{@casino_1.name}!"

def player_selection
  puts `clear`
  puts "\nWhich player would you like to be?"
  puts "1: #{@player_1.name}"
  if @player_2 == 0
    puts "2: Create A Player"
    puts "3: Exit"
    selection = gets.strip.downcase
    case selection
    when "1", "#{@player_1.name}"
      puts "You have selected to play with #{@player_1.name}!"
      @current_player = @player_1
      @other_player = @player_2
      sleep 2
      greeting
    when "2"
      @player_2 = Person.new
      player_selection
    when "3", "exit"
      puts "Come Again"
      exit
    else
      puts "Invalid Selection"
      sleep 2
      player_selection
    end
  else
    puts "2: #{@player_2.name}"
    puts "3: Exit"
    selection = gets.strip.downcase
    case selection
    when "1", "#{@player_1.name}"
      puts "You have selected to play with #{@player_1.name}!"
      @current_player = @player_1
      @other_player = @player_2
      sleep 2
      greeting
    when "2", "#{@player_2.name}"
      puts "You have selected to play with #{@player_2.name}!"
      @current_player = @player_2
      @other_player = @player_1
      sleep 2
      greeting
    when "3", "exit"
      puts "Come Again"
      exit
    else
      puts "Invalid Selection"
      sleep 2
      player_selection
    end
  end
end

def greeting
	puts `clear`
  puts "\nWelcome to the wonderful world of Gambling #{@current_player.name}!"
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
    sleep 3
    greeting
  when "3", "exit"
    puts "Thank you for coming!"
    sleep 3
    player_selection

  else
    "We dont have access to that Casino!"
    greeting
  end
end

def ruby_casino
  puts
  puts "~~~~~ Welcome to the #{@casino_1.name} #{@current_player.name}! ~~~~~"
  puts "\nWe are thrilled to have your money... I mean you!"
  if @current_player.age < @casino_1.minimum_age
    puts "\nOhh wait... Our minimum age at the #{@casino_1.name} is #{@casino_1.minimum_age}..."
    puts "\nCome back in #{@casino_1.minimum_age - @current_player.age} year(s)!"
    puts
    exit
  else
  end
  ruby_casino_menu
end

def ruby_casino_menu_logo
  puts '''
  ▄████████    ▄████████    ▄████████  ▄█  ███▄▄▄▄    ▄██████▄
███    ███   ███    ███   ███    ███ ███  ███▀▀▀██▄ ███    ███
███    █▀    ███    ███   ███    █▀  ███▌ ███   ███ ███    ███
███          ███    ███   ███        ███▌ ███   ███ ███    ███
███        ▀███████████ ▀███████████ ███▌ ███   ███ ███    ███
███    █▄    ███    ███          ███ ███  ███   ███ ███    ███
███    ███   ███    ███    ▄█    ███ ███  ███   ███ ███    ███
████████▀    ███    █▀   ▄████████▀  █▀    ▀█   █▀   ▀██████▀
  '''.colorize(:light_red)
end
def ruby_casino_menu
	if @current_player.money > @casino_1.value
		buy_casino
	else
 	end
	puts `clear`
  ruby_casino_menu_logo
  puts "Feeling Lucky?"
  puts "Where are we starting today?"
  puts
  puts "$$$ #{@casino_1.name} Games $$$"
  puts "1: Slots"
  puts "2: High-Low"
  puts "3: Blackjack"
	puts "4: Roulette"
  puts "5: Rock, Paper, Scissors"
  puts "6: Exit"
  if @casino_1.name != "Ruby Casino"
    puts "7: My Casino Settings"
  else
  end
  puts "-- Make Selection --"
  selection = gets.strip.downcase
  case selection
  when "1", "slots"
      show_slots_logo
  when "2", "high", "low", "high-low"
    high_low_menu
  when "3", "blackjack", "black", "jack"
    blackjack_menu
  when "4", "roulette"
    roulette_menu
  when "5", "Rock", "Paper", "Scissors"
    start_rps
  when "6", "exit"
    puts "\nI hope you enjoyed your time at the #{@casino_1.name}!"
    puts "Come Again"
    greeting
  when "7", "settings"
    casino_settings
  else
    puts "Invalid Selection, Please choose from the list above."
    ruby_casino_menu
  end
end

def casino_settings
	puts `clear`
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
		sleep 3
    casino_settings
  when "2"
    puts "Now that your the big shot here, what would you like everyone to call you?"
    new_name = gets.strip
    @current_player.name = new_name
    puts "Alright, from now on we call you #{@current_player.name}"
		sleep 3
    casino_settings
  when "3", "exit"
    ruby_casino_menu
  else
    puts "Invalid Selection"
		sleep 3
    casino_settings
  end
end

def buy_casino
  if @casino_1.name == "Ruby Casino"
    puts "\nWhoa.... Thats a lot of money you have there..."
    puts "Let me grab the owner."
    puts "----- Owner Arrives -----"
    puts "Seems like you have done really well at the #{@casino_1.name}!"
    puts "Would you be interested in buying the #{@casino_1.name} for $#{@casino_1.value}? yes or no"
    case gets.strip.downcase
    when "yes", "y"
      @money_sound.play
      puts "You won't regret this!"
      puts "That will be $#{@casino_1.value}."
      @current_player.money = (@current_player.money - @casino_1.value)
      puts "\n----- Money Received -----"
      puts "\nYou have $#{@current_player.money}"
      puts
      puts "What would you like to rename the #{@casino_1.name}? ('Example Casino')"
      @casino_1.name = gets.strip
      puts "\nIt's done! It's officially the #{@casino_1.name}!"
      ruby_casino_menu
    when "no", "n"
      puts "Ahhh. Thats too bad."
    else
      puts "I need a yes or a no"
      buy_casino
    end
  else
  end
end


while true
  player_selection
end
