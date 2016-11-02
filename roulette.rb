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
  if @player_2 == 0
    puts "3: Exit"
    case gets.strip.downcase
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
  else
    puts "3: Play Multiplayer Roulette"
    puts "4: Exit"
    case gets.strip.downcase
    when "1", "play", "roulette", "play roulette"
      roulette_begin
    when "2", "learn", "learn the rules"
      roulette_rules
    when "3", "multiplayer"
      puts "Get #{@other_player.name} and lets get going!"
      sleep 2
      roulette_multiplayer
    when "4", "exit"
      ruby_casino_menu
    else
      puts "Invalid Selection"
      sleep 2
      roulette_menu
    end
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
  '''.colorize(:light_blue)
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
  puts "\nCurrent Wager: #{@wager}".colorize(:light_yellow)
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
  puts "\nYour current wager is: #{@wager}".colorize(:light_yellow)
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
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
  if answer == new_array[0]
    puts "\nCongrats you won BIG! You won $#{@wager * 35}!"
    @current_player.money = (@current_player.money + (@wager * 35))
    sleep 3
    roulette_begin
  else
    puts "\nYoure out of luck!"
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
  puts "\nYour current wager is: $#{@wager}".colorize(:light_yellow)
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
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
  puts "\nYour current wager is: $#{@wager}".colorize(:light_yellow)
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
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
  puts "\nYour current wager is: $#{@wager}".colorize(:light_green)
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
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
  puts "\nYour current wager is: $#{@wager}".colorize(:light_yellow)
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
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

def red_roulette
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
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

def roulette_multiplayer
  puts `clear`
  roulette_logo
  if @current_player.money < 1 || @other_player.money < 1
    puts "\nYou dont have enough money to play Roulette!"
    puts "Get more and come back!"
    sleep 3
    roulette_menu
  else
  end
  puts
  puts "#{@current_player.name} Cash on hand: #{@current_player.money}                 #{@other_player.name} Cash on hand: #{@other_player.money}".colorize(:light_green)
  puts
  puts "#{@current_player.name}, How much money are you wanting to wager? Wager 0 to return to menu"
  @wager1 = gets.strip.to_i
  if @wager1 == 0
    puts "Come Back Later!"
    sleep 3
    roulette_menu
  else
  end
  if @wager1 > @current_player.money
    puts "\nYou can't wager more money than you have!"
    sleep 2
    roulette_multiplayer
  else
  end
  puts
  puts "#{@other_player.name}, How much money are you wanting to wager? Wager 0 to return to menu"
  @wager2 = gets.strip.to_i
  if @wager2 == 0
    puts "Come Back Later!"
    sleep 3
    roulette_menu
  else
  end
  if @wager2 > @other_player.money
    puts "\nYou can't wager more money than you have!"
    sleep 2
    roulette_multiplayer
  else
  end
  multi_betting
  puts "Alright lets get going!"
  sleep 3
  case @bet1
  when "1", "straight", "straight up", "up"
    @bet1 = "1"
  when "2", "odd"
    @bet1 = "Odd"
  when "3", "even"
    @bet1 = "Even"
  when "4", "red"
    @bet1 = "Red"
  when "5", "black"
    @bet1 = "Black"
  when "6", "quit", "exit"
    roulette_menu
  else
    puts "Invalid Selection"
    sleep 2
    roulette_multiplayer
  end
  case @bet2
  when "1", "straight", "straight up", "up"
    @bet2 = "1"
  when "2", "odd"
    @bet2 = "Odd"
  when "3", "even"
    @bet2 = "Even"
  when "4", "red"
    @bet2 = "Red"
  when "5", "black"
    @bet2 = "Black"
  when "6", "quit", "exit"
    roulette_menu
  else
    puts "Invalid Selection"
    sleep 2
    roulette_multiplayer
  end
  multi_begin
end

def multi_betting
  puts `clear`
  roulette_logo
  puts
  puts "#{@current_player.name} Current Wager: $#{@wager1}                       #{@other_player.name} Current Wager: $#{@wager2}".colorize(:light_yellow)
  puts "\n\n~~~ Betting ~~~."
  puts "1: Straight Up"
  puts "2: Odd"
  puts "3: Even"
  puts "4: Red"
  puts "5: Black"
  puts "6: Exit"
  puts
  puts "#{@current_player.name}, how would you like to bet?"
  @bet1 = gets.strip.downcase
  multi_1_straight
  puts
  puts "#{@other_player.name}, how would you like to bet?"
  @bet2 = gets.strip.downcase
  multi_2_straight
end

def multi_1_straight
  if @bet1 == "1" || @bet1 == "straight up"
    puts
    puts "What number are you betting on? 1-36"
    @my_straight_1 = gets.strip.to_i
    if @my_straight_1 > 36
      puts "Invalid Selection"
      multi_betting
    else
    end
  else
  end
end

def multi_2_straight
  if @bet2 == "1" || @bet2 == "straight up"
    puts
    puts "What number are you betting on? 1-36"
    @my_straight_2 = gets.strip.to_i
    if @my_straight_2 > 36
      puts "Invalid Selection"
      multi_betting
    else
    end
  else
  end
end

def multi_begin
  puts `clear`
  roulette_logo
  puts
  if @bet1 == "1"
    puts "#{@current_player.name} bet on #{@my_straight_1}"
  else
    puts "#{@current_player.name} bet on #{@bet1}"
  end
  puts "Your wager is $#{@wager1}".colorize(:light_yellow)
  puts
  if @bet2 == "1"
    puts "#{@other_player.name} bet on #{@my_straight_2}"
  else
    puts "#{@other_player.name} bet on #{@bet2} "
  end
  puts "Your wager is $#{@wager2}".colorize(:light_yellow)
  puts
  sleep 2
  puts "\n---- Rolling ----"
  new_array = @roulette_array.sample
  puts
  sleep 2
  if new_array[1] = "Red"
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_red)
  else
    puts "It's a #{new_array[1]} #{new_array[0]}!!".colorize(:light_blue)
  end
  puts
  sleep 2
  if @bet1 == "Odd"
    if @bet1 == new_array[2]
      puts "\nCongrats #{@current_player.name}! You won $#{@wager1}!"
      @current_player.money = (@current_player.money + @wager1)
      sleep 3
    else
      puts "\nBetter luck next time #{@current_player.name}! You lost $#{@wager1}."
      @current_player.money = (@current_player.money - @wager1)
      sleep 3
    end
  else
  end

  if @bet1 == "Even"
    if @bet1 == new_array[2]
      puts "\nCongrats #{@current_player.name}! You won $#{@wager1}!"
      @current_player.money = (@current_player.money + @wager1)
      sleep 3
    else
      puts "\nBetter luck next time #{@current_player.name}! You lost $#{@wager1}."
      @current_player.money = (@current_player.money - @wager1)
      sleep 3
    end
  else
  end

  if @bet1 == "Red"
    if @bet1 == new_array[1]
      puts "\nCongrats #{@current_player.name}! You won $#{@wager1}!"
      @current_player.money = (@current_player.money + @wager1)
      sleep 3
    else
      puts "\nBetter luck next time #{@current_player.name}! You lost $#{@wager1}."
      @current_player.money = (@current_player.money - @wager1)
      sleep 3
    end
  else
  end

  if @bet1 == "Black"
    if @bet1 == new_array[1]
      puts "\nCongrats #{@current_player.name}! You won $#{@wager1}!"
      @current_player.money = (@current_player.money + @wager1)
      sleep 3
    else
      puts "\nBetter luck next time #{@current_player.name}! You lost $#{@wager1}."
      @current_player.money = (@current_player.money - @wager1)
      sleep 3
    end
  else
  end

  if @bet1 == "1"
    if @my_straight_1 == new_array[2]
      puts "\nCongrats #{@current_player.name}! You won $#{@wager1 * 35}!"
      @current_player.money = (@current_player.money + (@wager1 * 35))
      sleep 3
    else
      puts "\nBetter luck next time #{@current_player.name}! You lost $#{@wager1}."
      @current_player.money = (@current_player.money - @wager1)
      sleep 3
    end
  else
  end
    puts
  if @bet2 == "Odd"
    if @bet2 == new_array[2]
      puts "\nCongrats #{@other_player.name}! You won $#{@wager2}!"
      @other_player.money = (@other_player.money + @wager2)
      sleep 3
    else
      puts "\nBetter luck next time #{@other_player.name}! You lost $#{@wager2}."
      @other_player.money = (@other_player.money - @wager2)
      sleep 3
    end
  else
  end

  if @bet2 == "Even"
    if @bet2 == new_array[2]
      puts "\nCongrats #{@other_player.name}! You won $#{@wager2}!"
      @other_player.money = (@other_player.money + @wager2)
      sleep 3
    else
      puts "\nBetter luck next time #{@other_player.name}! You lost $#{@wager2}."
      @other_player.money = (@other_player.money - @wager2)
      sleep 3
    end
  else
  end

  if @bet2 == "Red"
    if @bet2 == new_array[1]
      puts "\nCongrats #{@other_player.name}! You won $#{@wager2}!"
      @other_player.money = (@other_player.money + @wager2)
      sleep 3
    else
      puts "\nBetter luck next time #{@other_player.name}! You lost $#{@wager2}."
      @other_player.money = (@other_player.money - @wager2)
      sleep 3
    end
  else
  end

  if @bet2 == "Black"
    if @bet2 == new_array[1]
      puts "\nCongrats #{@other_player.name}! You won $#{@wager2}!"
      @other_player.money = (@other_player.money + @wager2)
      sleep 3
    else
      puts "\nBetter luck next time #{@other_player.name}! You lost $#{@wager2}."
      @other_player.money = (@other_player.money - @wager2)
      sleep 3
    end
  else
  end

  if @bet2 == "1"
    if @my_straight_2 == new_array[2]
      puts "\nCongrats #{@other_player.name}! You won $#{@wager2 * 35}!"
      @other_player.money = (@other_player.money + (@wager2 * 35))
      sleep 3
    else
      puts "\nBetter luck next time #{@other_player.name}! You lost $#{@wager2}."
      @other_player.money = (@other_player.money - @wager2)
      sleep 3
    end
  else
  end
  roulette_multiplayer
end
