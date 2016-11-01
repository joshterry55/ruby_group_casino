

def high_low_menu
  puts `clear`
  high_low_logo
  puts "\nWelcome to the High-Low!".colorize(:light_green)
  puts "Take a seat #{@current_player.name}, here its you against the Dealer!"
  puts "1: Play High-Low"
  puts "2: Exit"
  case gets.strip
  when "1", "play", "high", "low", "high-low"
    puts "\nLets Begin!"
    puts "MAY THE ODDS BE IN YOUR FAVOR!"
    high_low_begin
  when "2", "exit"
   puts "Come back later!"
   ruby_casino_menu
  else
    puts "Invalid Selection, type 1, 2 or 3."
    high_low_menu
  end
end

def high_low_logo
  puts '''
 /$$   /$$ /$$           /$$               /$$
| $$  | $$|__/          | $$              | $$
| $$  | $$ /$$  /$$$$$$ | $$$$$$$         | $$        /$$$$$$  /$$  /$$  /$$
| $$$$$$$$| $$ /$$__  $$| $$__  $$ /$$$$$$| $$       /$$__  $$| $$ | $$ | $$
| $$__  $$| $$| $$  \ $$| $$  \ $$|______/| $$      | $$  \ $$| $$ | $$ | $$
| $$  | $$| $$| $$  | $$| $$  | $$        | $$      | $$  | $$| $$ | $$ | $$
| $$  | $$| $$|  $$$$$$$| $$  | $$        | $$$$$$$$|  $$$$$$/|  $$$$$/$$$$/
|__/  |__/|__/ \____  $$|__/  |__/        |________/ \______/  \_____/\___/
              /$$  \ $$
             |  $$$$$$/
              \______/
  '''.colorize(:light_yellow)
end

def high_low_begin
  puts `clear`
  high_low_logo
  puts "\nMoney on hand: $#{@current_player.money}".colorize(:light_green)
  puts
  puts "How much would you like to wager? Type 0 to exit to menu"
  selection = gets.strip.to_i
  if selection > @current_player.money
    puts "\nYou can't wager more than you have!"
    sleep 3
    high_low_begin
  elsif selection == 0
    puts "\nCome Again!!"
    sleep 2
    high_low_menu
  else
  @high_low_wager = selection
  end
  if @current_player.money < 1
    puts "\nYou don't have enough money!"
    sleep 3
    greeting

  else
  end
  puts "\nHere we have a normal deck of cards."
  puts "You and I will both put $#{@high_low_wager} on the table"
  puts "I will draw the first card".colorize(:light_red)
  puts "You will draw the next card".colorize(:light_blue)
  puts "Whoever has the highest card takes the money."
  puts "Are you in? ENTER to begin, or NO to go back to main menu."
  answer = gets.strip.downcase
  case answer
  when ""
    high_low_result
  when "no", "n"
    puts "Thanks for playing!"
    high_low_menu
  else
    puts "Invalid Selection"
    high_low_begin
  end
end

#@high_low_deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

@high_low_losing_array = [
    "Ahh I beat you! Better luck next time.",
    "Nice try! Lets go again!",
    "I could do this all day if I keep winning!"
  ]
@high_low_winning_array = [
    "Dang! looks like you won this round!",
    "Not Again! You're good at this!",
    "Ahh such good luck you have!"
  ]

def high_low_result
  puts `clear`
  high_low_logo
  puts "\nOkay, I am going to draw a card"
  #dealer_card = @high_low_deck.sample
  sleep 1
  puts "\n----- Drawing -----"
  card1 = @deck.sample
  dealer_card = card1.poker_value
  puts
  sleep 1
  if card1.suit == "Hearts" || card1.suit == "Diamonds"
    puts "#{card1.rank} of #{card1.suit}".colorize(:light_red)
  else
    puts "#{card1.rank} of #{card1.suit}".colorize(:light_blue)
  end
  #puts dealer_card
  puts "\nTry to beat that!"
  puts "\nPress Enter to draw card."
  gets.strip
  card2 = @deck.sample
  my_card = card2.poker_value
  #my_card = @high_low_deck.sample
  sleep 1
  puts "----- Drawing -----"
  puts
  sleep 1.0
  if card2.suit == "Hearts" || card1.suit == "Diamonds"
    puts "#{card2.rank} of #{card2.suit}".colorize(:light_red)
  else
    puts "#{card2.rank} of #{card2.suit}".colorize(:light_blue)
  end
  #puts my_card
  puts
  if my_card > dealer_card
    puts "#{@high_low_winning_array.sample}"
    puts "You won $#{@high_low_wager}!"
    @current_player.money = (@current_player.money + @high_low_wager)
    sleep 4
    high_low_begin
  elsif my_card < dealer_card
    puts "#{@high_low_losing_array.sample}"
    puts "You lost $#{@high_low_wager}!"
    @current_player.money = (@current_player.money - @high_low_wager)
    sleep 4
    high_low_begin
  else
    puts "Looks like its a tie, lets try again!"
    high_low_result
  end
end
