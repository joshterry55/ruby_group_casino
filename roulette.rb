@roulette_array = [
  [1, "Red", "Odd"],
  [2, "Black", "Even"],
  [3, "Red", "Odd"],
  [4, "Black", "Even"],
  [5, "Red", "Odd"],
  [6, "Black", "Even"],
  [7, "Red", "Odd"],
  [8, "Black", "Even"],
  [9, "Red", "Odd"],
  [10, "Black", "Even"],
  [11, "Black", "Odd"],
  [12, "Red", "Even"],
  [13, "Black", "Odd"],
  [14, "Red", "Even"],
  [15, "Black", "Odd"],
  [16, "Red", "Even"],
  [17, "Black", "Odd"],
  [18, "Red", "Even"],
  [19, "Red", "Odd"],
  [20, "Black", "Even"],
  [21, "Red", "Odd"],
  [22, "Black", "Even"],
  [23, "Red", "Odd"],
  [24, "Black", "Even"],
  [25, "Red", "Odd"],
  [26, "Black", "Even"],
  [27, "Red", "Odd"],
  [28, "Black", "Even"],
  [29, "black", "Odd"],
  [30, "Red", "Even"],
  [31, "Black", "Odd"],
  [32, "Red", "Even"],
  [33, "Black", "Odd"],
  [34, "Red", "Even"],
  [35, "Black", "Odd"],
  [36, "Red", "Even"],

]

def roulette_menu
  puts `clear`
  roulette_logo
  puts "\n1: Play Roulette"
  puts "2: Learn the rules"
  puts "3: Exit"
  case gets.strip
  when "1", "play", "roulette", "play roulette"
    roulette_begin
  when "2", "learn", "learn the rules"
    roulette_rules
  when "exit", "3"
    ruby_casino_menu
  else
    puts "Invalid Selection"
    sleep 2
    roulette_menu
  end
end

def roulette_logo
  puts '''

------------------------------------------------------------------------
_______  _______           _        _______ __________________ _______
(  ____ )(  ___  )|\     /|( \      (  ____ \\__   __/\__   __/(  ____ \
| (    )|| (   ) || )   ( || (      | (    \/   ) (      ) (   | (    \/
| (____)|| |   | || |   | || |      | (__       | |      | |   | (__
|     __)| |   | || |   | || |      |  __)      | |      | |   |  __)
| (\ (   | |   | || |   | || |      | (         | |      | |   | (
| ) \ \__| (___) || (___) || (____/\| (____/\   | |      | |   | (____/\
|/   \__/(_______)(_______)(_______/(_______/   )_(      )_(   (_______/
------------------------------------------------------------------------
  '''
end

def roulette_begin
  puts `clear`
  roulette_logo
  if @current_player.money < 1
    puts "\nYou dont have enough money to play Roulette!"
    puts "Get more and come back!"
    sleep 3
    roulette_menu
  else
  end
  puts "\nCash On Hand: #{@current_player.money}"
  puts "\nHow much money are you wanting to wager?"
  @wager = gets.strip.to_i
  if @wager > @current_player.money
    puts "\nYou can't wager more money than you have!"
    sleep 2
    roulette_begin
  else
  end
  puts "\nCurrent Wager: #{@wager}"
  puts "\nChoose which type of bet you would like to make."
  puts "1: Straight Up"
  puts "2: Odd"
  puts "3: Even"
  puts "4: Red"
  puts "5: Black"
  puts "6: Exit"
  case gets.strip.downcase
  when "1", "straight", "straight up", "up"
    straight_bet
  when "2", "odd"
    odd_bet
  when "3", "even"
    even_bet
  when "4", "red"
    red_bet
  when "5", "black"
    black_bet
  when "6", "quit", "exit"
    roulette_menu
  else
    puts "Invalid Selection"
    sleep 2
    roulette_begin
  end
end

def straight_bet
  puts `clear`
  roulette_logo
  puts "\nYou have selected Straight Up bet."
  puts "\nYour current wager is: $#{@wager}"
  puts "\nWhat number is the ball going to land on? 1-36"
  answer = gets.strip.to_i
  if answer > 36
    puts "Choose between 1-36"
    sleep 2
    straight_bet
  else
  end
  puts "\nOkay your betting on lucky number #{answer}"
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  puts "#{new_array[0]}"
  if answer == new_array[0]
    puts "works"
    @current_player.money = (@current_player.money + (@wager * 35))
    sleep 3
    roulette_begin
  else
    puts "\nYour out of luck!"
    puts "\nMaybe you should go back to #{@current_player.from}!"
    @current_player.money = (@current_player.money - @wager)
    puts "\nYou lost $#{@wager}"
    sleep 3
  end
  roulette_begin
end

def odd_bet
  puts `clear`
  roulette_logo
  puts "\nYou have selected a bet on Odd numbers."
  puts "\nYour current wager is: $#{@wager}"
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  puts "#{new_array[0]}"
  if new_array[2] == "Odd"
    puts "\nIt's Your Lucky Day!"
    @current_player.money = (@current_player.money + @wager)
    sleep 3
    roulette_begin
  else
    puts "\nYou're Out of Luck!"
    @current_player.money = (@current_player.money - @wager)
    puts "\nYou lost $#{@wager}"
    sleep 3
  end
  roulette_begin
end

def even_bet
  puts `clear`
  roulette_logo
  puts "\nYou have selected to bet on Even numbers."
  puts "\nYour current wager is: $#{@wager}"
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  puts "#{new_array[0]}"
  if new_array[2] == "Even"
    puts "\nIt's Your Lucky Day!"
    @current_player.money = (@current_player.money + @wager)
    sleep 3
    roulette_begin
  else
    puts "\nYou're Out of Luck!"
    @current_player.money = (@current_player.money - @wager)
    puts "\nYou lost $#{@wager}"
    sleep 3
  end
  roulette_begin
end

def red_bet
  puts `clear`
  roulette_logo
  puts "\nYou have selected to bet on Red."
  puts "\nYour current wager is: $#{@wager}"
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  puts "It's a #{new_array[1]} #{new_array[0]}!!"
  if new_array[1] == "Red"
    puts "\nIt's Your Lucky Day!"
    @current_player.money = (@current_player.money + @wager)
    sleep 3
    roulette_begin
  else
    puts "\nYou're Out of Luck!"
    @current_player.money = (@current_player.money - @wager)
    puts "\nYou lost $#{@wager}"
    sleep 3
  end
  roulette_begin
end

def black_bet
  puts `clear`
  roulette_logo
  puts "\nYou have selected to bet on Black."
  puts "\nYour current wager is: #{@wager}"
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  puts "It's a #{new_array[1]} #{new_array[0]}!!"
  if new_array[1] == "Black"
    puts "\nIt's Your Lucky Day!"
    @current_player.money = (@current_player.money + @wager)
    sleep 3
    roulette_begin
  else
    puts "\nYou're Out of Luck!"
    @current_player.money = (@current_player.money - @wager)
    puts "\nYou lost $#{@wager}"
    sleep 3
  end
  roulette_begin
end

def roulette_rules
  puts `clear`
  roulette_logo
  puts "\n~~~~~ Roulette Rules ~~~~~"
  puts "\nThere are 5 ways you can bet."
  puts "\nStraight up:"
  puts "Betting the ending number will any number 0-35."
  puts "Pays out $35 dollars for every one you bet."
  puts "\nOdd: "
  puts "Betting the number will be odd."
  puts "Pays out $1 for every one you bet"
  puts "\nEven:"
  puts "Betting the number will be even."
  puts "Pays out $1 for every one you bet"
  puts "\nRed:"
  puts "Betting the number will be red."
  puts "Pays out $1 for every one you bet"
  puts "\nBlack:"
  puts "Betting the number will be black."
  puts "Pays out $1 for every one you bet"
  puts "\nGo back to menu? yes or no"
  case gets.strip
  when "yes", "y"
    roulette_menu
  when "no", "n"
    roulette_begin
  else
    puts "Invalid Selection"
    sleep 2
    roulette_begin
  end

end
