
@indian_chips = 0

def high_low_menu
  puts `clear`
  high_low_logo
  puts "\nWelcome to the High-Low!"
  puts "Take a seat #{@player_1.name}, here its you against the Dealer!"
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
  '''
end

def high_low_begin
  puts `clear`
  high_low_logo
  puts "\nYou have $#{@player_1.money}"
  if @player_1.money < 5
    puts "\nYou don't have enough money!"
    sleep 3
    greeting

  else
  end
  puts "\nHere we have a deck of numbered cards 1-50."
  puts "You and I will both put $5 on the table"
  puts "I will draw the first card"
  puts "You will draw the next card"
  puts "Whoever has the highest card takes the money."
  puts "Are you in? yes or no? Saying no will take you back to Main Menu."
  answer = gets.strip.downcase
  case answer
  when "yes", "y"
    high_low_result
  when "no", "n"
    puts "Thanks for playing!"
    high_low_menu
  else
    puts "Invalid Selection"
    high_low_begin
  end
end

@high_low_deck = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

@high_low_losing_array = [
    "Ahh I beat you! Better luck next time.",
    "Yes! Let's go again.",
    "I could do this all day if I keep winning!"
  ]
@high_low_winning_array = [
    "Dang! looks like you won this round!",
    "Not Again!",
    "Ahh such good luck you have!"
  ]

def high_low_result
  puts `clear`
  high_low_logo
  puts "\nOkay, I am going to draw a card"
  dealer_card = @high_low_deck.sample
  puts
  sleep 1.0
  puts dealer_card
  puts "\nTry to beat that!"
  puts "\nPress Enter to draw card."
  gets.strip
  my_card = @high_low_deck.sample
  puts
  sleep 1.0
  puts my_card
  puts
  if my_card > dealer_card
    puts "#{@high_low_winning_array.sample}"
    @player_1.money = (@player_1.money + 5)
    sleep 4
    high_low_begin
  elsif my_card < dealer_card
    puts "#{@high_low_losing_array.sample}"
    @player_1.money = (@player_1.money - 5)
    sleep 4
    high_low_begin
  else
    puts "Looks like its a tie, lets try again!"
    high_low_result
  end
end
