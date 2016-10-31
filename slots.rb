

@slot_coins = 0
def slots_menu
  puts "\nWelcome to the SLOTS!"
  puts "Make yourself comfortable #{@player_1.name}, you could be here awhile!"
  puts "1: Play Slots"
  puts "2: Cash Out"
  puts "3: Exit"
  case gets.strip
  when "1", "play", "slots", "play slots"
    puts "\nLets Begin!"
    puts "MAY THE ODDS BE IN YOUR FAVOR!"
    slots_initial_coins
  when "2", "cash", "out", "cash out"
    slots_cash_out
  when "3", "exit"
    puts "Come back later!"
    ruby_casino_menu
  else
    puts "Invalid Selection, type 1, 2 or 3."
    slots_menu
  end
end

def slots_initial_coins
  puts "\n\nBefore you begin you will need to buy a few coins."
  puts "Each coin costs $2."
  puts "You have $#{@player_1.money}."
  puts "How many coins would you like to buy?"
  @slot_coins = gets.strip.to_i
  if @slot_coins * 2 > @player_1.money
    puts "You dont have enough money for that many coins!"
    slots_menu
  else
    @player_1.money -= @slot_coins * 2
  end
  puts "\n\nThat will be $#{@slot_coins * 2}."
  puts "\n~~~~ Money Received ~~~~"
  puts "\nYou have $#{@player_1.money} left."
  puts "\nThank You, Lets get going!"
  slots_begin
end

def slots_begin
  puts "\nYou have #{@slot_coins} coins."
  if @slot_coins == 0
    puts "\nYou are out of coins!"
    buy_more
  else
  end
  puts "Your goal is to get all 3 numbers the same each time you pull the lever."
  puts "Each LEVER PULL will cost 1 coin."
  puts "Pull the Lever? yes or no? Saying no will take you back to Main Menu."
  lever_pull = gets.strip.downcase
  case lever_pull
  when "yes", "y"
    slots_result
  when "no", "n"
    puts "Thanks for playing!"
    slots_menu
  else
    puts "Invalid Selection"
    slots_begin
  end
end


def buy_more
  puts "\nBuy more coins? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    puts "How many more coins would you like to buy? $2 each."
    selection = gets.strip.to_i
    puts "\nThat will be $#{selection * 2}!"
    puts "\n~~~~ Money Received ~~~~"
    if selection * 2 > @player_1.money
      puts "You don't have enough money for that many coins!"
      buy_more
    else
      @slot_coins = selection
      @player_1.money -= @slot_coins * 2
      slots_begin
    end

  when "no", "n"
    puts "\nToday isn't your day huh?"
    puts "Maybe you'll have better luck back in #{@player_1.from}!"
    puts "\nWe hope to take your money ..ermm... see you again!"
    slots_menu
  else
  end
end

@losing_array = [
    "Better luck next time!",
    "Wow It just isnt your day.",
    "Come on, spin again!",
    "You got this next spin!",
    "Don't give up now!",
    "Dang, thats not good."
]


def slots_result
  puts "\nSpinning..."
  puts
  roll
  print @roll_array
  if @roll_array.uniq.count == 1
    puts "\n\nding ding ding JACKPOT!!!"
    puts "\nYou won 1000 coins!"
    @slot_coins = (@slot_coins - 1)
    @slot_coins = (@slot_coins + 1000)
    slots_cash_out
    # puts "cash out while your ahead? yes or no"
    # case gets.strip.downcase
    # when "yes"
    #   cash_out_yes
    # when "no"
    #   slots_begin
    # else
    #   puts "Invalid Selection"
    #   cash_out
    # end
  else
    puts "\n\nAhhh!"
    #puts "\nBetter luck next time!"
    puts
    puts "#{@losing_array.sample}"
    @slot_coins = (@slot_coins - 1)
    slots_begin
  end



end

def roll()
  @roll_array = []
  3.times do
    roll_value = rand(4) + 1
    @roll_array << roll_value
  end
  # #total = 0
  # roll_array.each do |roll|
  #   new_total = total + roll
  #   total = new_total
  # end
  # total
end

def slots_cash_out
  puts "\n\n\ncash out while your ahead? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    slots_cash_out_yes
  when "no", "n"
    slots_begin
  else
    puts "Invalid Selection"
    slots_cash_out
  end
end

def slots_cash_out_yes
  puts "\n\nYou finished with #{@slot_coins} coins."
  if @slot_coins > 0
    puts "Wow! You made a KILLING!"
    puts "Here you go...."
    puts "\nYou received $#{@slot_coins * 2}!"
    @player_1.money = (@player_1.money + @slot_coins * 2)
    @slot_coins = 0
    puts "You have $#{@player_1.money}."
     if @player_1.money > @casino_1.value
       buy_casino
    #   puts "Whoa.... Thats a lot of money you have there..."
    #   puts "Let me grab the owner."
    #   puts "----- Owner Arrives -----"
    #   puts "Seems like you have done really well at the #{@casino_1.name}!"
    #   puts "Would you be interested in buying the #{@casino_1.name}?"
    #
    else
    end
    puts "\nCome Again!"
    slots_menu
  else
    puts "\nYou received $0 because you had no coins!"
    slots_menu
  end
end

def buy_casino
    puts "\nWhoa.... Thats a lot of money you have there..."
    puts "Let me grab the owner."
    puts "----- Owner Arrives -----"
    puts "Seems like you have done really well at the #{@casino_1.name}!"
    puts "Would you be interested in buying the #{@casino_1.name} for $#{@casino_1.value}? yes or no"
    case gets.strip.downcase
    when "yes", "y"
      puts "You won't regret this!"
      puts "That will be $#{@casino_1.value}."
      @player_1.money = (@player_1.money - @casino_1.value)
      puts "\n----- Money Received -----"
      puts "\nYou have $#{@player_1.money}"
      puts
      puts "What would you like to rename the #{@casino_1.name}? ('Example Casino')"
      @casino_1.name = gets.strip
      puts "\nIt's done! It's officially the #{@casino_1.name}!"
      slots_menu
    when "no", "n"
      puts "Ahhh. Thats too bad."
    else
      puts "I need a yes or a no"
      buy_casino
    end

end
