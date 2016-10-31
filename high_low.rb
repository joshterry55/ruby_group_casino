
@indian_chips = 0

def indian_menu
  puts "\nWelcome to the INDIAN POKER!"
  puts "Take a seat #{@player_1.name}, here its you against the Dealer!"
  puts "1: Play Indian Poker"
  puts "2: Cash Out"
  puts "3: Exit"
  case gets.strip
  when "1", "play", "indian", "indian poker", "play indian poker"
    puts "\nLets Begin!"
    puts "MAY THE ODDS BE IN YOUR FAVOR!"
    indian_initial_chips
  when "2", "cash", "out", "cash out"
    indian_cash_out
  when "3", "exit"
    puts "Come back later!"
    ruby_casino_menu
  else
    puts "Invalid Selection, type 1, 2 or 3."
    indian_menu
  end
end

def indian_initial_chips
  puts "\n\nBefore you begin you will need to buy a few chips."
  puts "Each chip costs $5."
  puts "You have $#{@player_1.money}."
  puts "How many chips would you like to buy?"
  @indian_chips = gets.strip.to_i
  if @indian_chips * 5 > @player_1.money
    puts "You dont have enough money for that many chips!"
    indian_menu
  else
    @player_1.money -= @indian_chips * 5
  end
  puts "\n\nThat will be $#{@indian_chips * 5}."
  puts "\n~~~~ Money Received ~~~~"
  puts "\nYou have $#{@player_1.money} left."
  puts "\nThank You, Lets get going!"
  indian_begin
end

def indian_begin
  puts "\nYou have #{@indian_chips} chips."
  if @indian_chips == 0
    puts "\nYou are out of chips!"
    indian_buy_more
  else
  end
  puts "\nHere we have a deck of numbered cards 1-50."
  puts "You and I will both put 1 chip on the table"
  puts "I will draw the first card"
  puts "You will draw the next card"
  puts "Whoever has the highest card takes both chips."
  puts "Are you in? yes or no? Saying no will take you back to Main Menu."
  answer = gets.strip.downcase
  case answer
  when "yes", "y"
    indian_result
  when "no", "n"
    puts "Thanks for playing!"
    indian_menu
  else
    puts "Invalid Selection"
    indian_begin
  end
end

@indian_deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

@indian_losing_array = [
    "Ahh I beat you! Better luck next time.",
    "Yes! Let's go again.",
    "I could do this all day if I keep winning!"
  ]
@indian_winning_array = [
    "Dang! looks like you won this round!",
    "Not Again!",
    "Ahh such good luck you have!"
  ]

def indian_result
  puts "\nOkay, I am going to draw a card"
  dealer_card = @indian_deck.sample
  puts
  puts dealer_card
  puts "\nTry to beat that!"
  puts "\nPress Enter to draw card."
  gets.strip
  my_card = @indian_deck.sample
  puts
  puts my_card
  puts
  if my_card > dealer_card
    puts "#{@indian_winning_array.sample}"
    @indian_chips = (@indian_chips + 1)
    indian_begin
  elsif my_card < dealer_card
    puts "#{@indian_losing_array.sample}"
    @indian_chips = (@indian_chips - 1)
    indian_begin
  else
    puts "Looks like its a tie, lets try again!"
    indian_result
  end
end

def indian_cash_out
  puts "\n\n\ncash out while your ahead? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    indian_cash_out_yes
  when "no", "n"
    indian_begin
  else
    puts "Invalid Selection"
    indian_cash_out
  end
end


def indian_cash_out_yes
  puts "\n\nYou finished with #{@indian_chips} chips."
  if @indian_chips > 0
    puts "Wow! You made a KILLING!"
    puts "Here you go...."
    puts "\nYou received $#{@indian_chips * 5}!"
    @player_1.money = (@player_1.money + @indian_chips * 5)
    @indian_chips = 0
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
    indian_menu
  else
    puts "\nYou received $0 because you had no chips!"
    indian_menu
  end
end

def indian_buy_more
  puts "\nBuy more chips? yes or no"
  case gets.strip.downcase
  when "yes", "y"
    puts "How many more chips would you like to buy? $5 each."
    selection = gets.strip.to_i
    puts "\nThat will be $#{selection * 5}!"
    if selection * 5 > @player_1.money
      puts "\nYou don't have enough money for that many chips!"
      indian_buy_more
    else
      @indian_chips = selection
      @player_1.money -= @indian_chips * 5
      indian_begin
    end

  when "no", "n"
    puts "\nToday isn't your day huh?"
    puts "Maybe you'll have better luck back in #{@player_1.from}!"
    puts "\nIt was a pleasure taking your money!"
    indian_menu
  else
  end
end
