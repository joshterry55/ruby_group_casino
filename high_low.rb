

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
  if selection == 42
    puts "\nTake one of these!"
    sleep 2
    puts '''
         / \
        |\_/|
        |---|
        |   |
        |   |
      _ |=-=| _
  _  / \|   |/ \
 / \|   |   |   ||\
|   |   |   |   | \>
|   |   |   |   |   \
| -   -   -   - |)   )
|                   /
 \                 /
  \               /
   \             /
    \           /
         '''.colorize(:light_yellow)
   sleep 2
   puts "\nYou pissed off the dealer!"
   puts "\nThe dealer kicked you out!"
   sleep 2
   ruby_casino_menu
  else
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
  #@dealer_card = @high_low_deck.sample
  sleep 1
  puts "\n----- Drawing -----"
  @card1 = @deck.sample
  @dealer_card = @card1.poker_value
  puts
  sleep 1
  ascii_cards
  if @card1.suit == "Hearts" || @card1.suit == "Diamonds"
    puts "#{@card1.rank} of #{@card1.suit}".colorize(:light_red)
  else
    puts "#{@card1.rank} of #{@card1.suit}".colorize(:light_blue)
  end
  #puts @dealer_card
  puts "\nTry to beat that!"
  puts "\nPress Enter to draw card."
  gets.strip
  @card2 = @deck.sample
  @my_card = @card2.poker_value
  #@my_card = @high_low_deck.sample
  sleep 1
  puts "----- Drawing -----"
  puts
  sleep 1.0
  ascii_cards_2
  if @card2.suit == "Hearts" || @card2.suit == "Diamonds"
    puts "#{@card2.rank} of #{@card2.suit}".colorize(:light_red)
  else
    puts "#{@card2.rank} of #{@card2.suit}".colorize(:light_blue)
  end
  #puts @my_card
  puts
  if @my_card > @dealer_card
    puts "#{@high_low_winning_array.sample}"
    puts "You won $#{@high_low_wager}!"
    @current_player.money = (@current_player.money + @high_low_wager)
    sleep 4
    high_low_begin
  elsif @my_card < @dealer_card
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


def ascii_cards
  if @card1.rank == "Ace" && @card1.suit == "Spades"
    puts """
    .------.
    |A .   |
    | / \\  |
    |(_,_) |
    |  I  A|
    '------'
    """
  end

  if @card1.rank == "King" && @card1.suit == "Spades"
    puts """
    .------.
    |K .   |
    | / \\  |
    |(_,_) |
    |  I  K|
    '------'
    """
  end

  if @card1.rank == "Queen" && @card1.suit == "Spades"
    puts """
    .------.
    |Q .   |
    | / \\  |
    |(_,_) |
    |  I  Q|
    '------'
    """
  end

  if @card1.rank == "Jack" && @card1.suit == "Spades"
    puts """
    .------.
    |J .   |
    | / \\  |
    |(_,_) |
    |  I  J|
    '------'
    """
  end

  if @card1.rank == "10" && @card1.suit == "Spades"
    puts """
    .--------.
    |10 .    |
    |  / \\   |
    | (_,_)  |
    |   I  10|
    '--------'
    """
  end

  if @card1.rank == "9" && @card1.suit == "Spades"
    puts """
    .------.
    |9 .   |
    | / \\  |
    |(_,_) |
    |  I  9|
    '------'
    """
  end

  if @card1.rank == "8" && @card1.suit == "Spades"
    puts """
    .------.
    |8 .   |
    | / \\  |
    |(_,_) |
    |  I  8|
    '------'
    """
  end

  if @card1.rank == "7" && @card1.suit == "Spades"
    puts """
    .------.
    |7 .   |
    | / \\  |
    |(_,_) |
    |  I  7|
    '------'
    """
  end

  if @card1.rank == "6" && @card1.suit == "Spades"
    puts """
    .------.
    |6 .   |
    | / \\  |
    |(_,_) |
    |  I  6|
    '------'
    """
  end

  if @card1.rank == "5" && @card1.suit == "Spades"
    puts """
    .------.
    |5 .   |
    | / \\  |
    |(_,_) |
    |  I  5|
    '------'
    """
  end

  if @card1.rank == "4" && @card1.suit == "Spades"
    puts """
    .------.
    |4 .   |
    | / \\  |
    |(_,_) |
    |  I  4|
    '------'
    """
  end

  if @card1.rank == "3" && @card1.suit == "Spades"
    puts """
    .------.
    |3 .   |
    | / \\  |
    |(_,_) |
    |  I  3|
    '------'
    """
  end

  if @card1.rank == "2" && @card1.suit == "Spades"
    puts """
    .------.
    |2 .   |
    | / \\  |
    |(_,_) |
    |  I  2|
    '------'
    """
  end

  if @card1.rank == "Ace" && @card1.suit == "Clubs"
    puts """
    .------.
    |A _   |
    | ( )  |
    |(_x_) |
    |  Y  A|
    '------'
    """
  end

  if @card1.rank == "King" && @card1.suit == "Clubs"
    puts """
    .------.
    |K _   |
    | ( )  |
    |(_x_) |
    |  Y  K|
    '------'
    """
  end

  if @card1.rank == "Queen" && @card1.suit == "Clubs"
    puts """
    .------.
    |Q _   |
    | ( )  |
    |(_x_) |
    |  Y  Q|
    '------'
    """
  end

  if @card1.rank == "Jack" && @card1.suit == "Clubs"
    puts """
    .------.
    |J _   |
    | ( )  |
    |(_x_) |
    |  Y  J|
    '------'
    """
  end

  if @card1.rank == "10" && @card1.suit == "Clubs"
    puts """
    .--------.
    |10 _    |
    |  ( )   |
    | (_x_)  |
    |   Y  10|
    '--------'
    """
  end

  if @card1.rank == "9" && @card1.suit == "Clubs"
    puts """
    .------.
    |9 _   |
    | ( )  |
    |(_x_) |
    |  Y  9|
    '------'
    """
  end

  if @card1.rank == "8" && @card1.suit == "Clubs"
    puts """
    .------.
    |8 _   |
    | ( )  |
    |(_x_) |
    |  Y  8|
    '------'
    """
  end

  if @card1.rank == "7" && @card1.suit == "Clubs"
    puts """
    .------.
    |7 _   |
    | ( )  |
    |(_x_) |
    |  Y  7|
    '------'
    """
  end

  if @card1.rank == "6" && @card1.suit == "Clubs"
    puts """
    .------.
    |6 _   |
    | ( )  |
    |(_x_) |
    |  Y  6|
    '------'
    """
  end

  if @card1.rank == "5" && @card1.suit == "Clubs"
    puts """
    .------.
    |5 _   |
    | ( )  |
    |(_x_) |
    |  Y  5|
    '------'
    """
  end

  if @card1.rank == "4" && @card1.suit == "Clubs"
    puts """
    .------.
    |4 _   |
    | ( )  |
    |(_x_) |
    |  Y  4|
    '------'
    """
  end

  if @card1.rank == "3" && @card1.suit == "Clubs"
    puts """
    .------.
    |3 _   |
    | ( )  |
    |(_x_) |
    |  Y  3|
    '------'
    """
  end

  if @card1.rank == "2" && @card1.suit == "Clubs"
    puts """
    .------.
    |2 _   |
    | ( )  |
    |(_x_) |
    |  Y  2|
    '------'
    """
  end

  if @card1.rank == "Ace" && @card1.suit == "Diamonds"
    puts """
    .------.
    |A /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ A|
    `------'
    """
  end

  if @card1.rank == "King" && @card1.suit == "Diamonds"
    puts """
    .------.
    |K /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ K|
    `------'
    """
  end

  if @card1.rank == "Queen" && @card1.suit == "Diamonds"
    puts """
    .------.
    |Q /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ Q|
    `------'
    """
  end

  if @card1.rank == "Jack" && @card1.suit == "Diamonds"
    puts """
    .------.
    |J /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ J|
    `------'
    """
  end

  if @card1.rank == "10" && @card1.suit == "Diamonds"
    puts """
    .---------.
    |10 /\\   |
    |  /  \\  |
    |  \\  /  |
    |   \\/ 10|
    `---------'
    """
  end

  if @card1.rank == "9" && @card1.suit == "Diamonds"
    puts """
    .------.
    |9 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 9|
    `------'
    """
  end

  if @card1.rank == "8" && @card1.suit == "Diamonds"
    puts """
    .------.
    |8 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 8|
    `------'
    """
  end

  if @card1.rank == "7" && @card1.suit == "Diamonds"
    puts """
    .------.
    |7 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 7|
    `------'
    """
  end

  if @card1.rank == "6" && @card1.suit == "Diamonds"
    puts """
    .------.
    |6 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 6|
    `------'
    """
  end

  if @card1.rank == "5" && @card1.suit == "Diamonds"
    puts """
    .------.
    |5 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 5|
    `------'
    """
  end

  if @card1.rank == "4" && @card1.suit == "Diamonds"
    puts """
    .------.
    |4 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 4|
    `------'
    """
  end

  if @card1.rank == "3" && @card1.suit == "Diamonds"
    puts """
    .------.
    |3 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 3|
    `------'
    """
  end

  if @card1.rank == "2" && @card1.suit == "Diamonds"
    puts """
    .------.
    |2 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 2|
    `------'
    """
  end

  if @card1.rank == "Ace" && @card1.suit == "Hearts"
    puts """
    .------.
    |A_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ A|
    '------'
    """
  end

  if @card1.rank == "King" && @card1.suit == "Hearts"
    puts """
    .------.
    |K_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ K|
    '------'
    """
  end

  if @card1.rank == "Queen" && @card1.suit == "Hearts"
    puts """
    .------.
    |Q_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ Q|
    '------'
    """
  end

  if @card1.rank == "Jack" && @card1.suit == "Hearts"
    puts """
    .------.
    |J_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ J|
    '------'
    """
  end

  if @card1.rank == "10" && @card1.suit == "Hearts"
    puts """
    .--------.
    |10_  _  |
    | ( \\/ ) |
    |  \\  /  |
    |   \\/ 10|
    '---------'
    """
  end

  if @card1.rank == "9" && @card1.suit == "Hearts"
    puts """
    .------.
    |9_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 9|
    '------'
    """
  end

  if @card1.rank == "8" && @card1.suit == "Hearts"
    puts """
    .------.
    |8_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 8|
    '------'
    """
  end

  if @card1.rank == "7" && @card1.suit == "Hearts"
    puts """
    .------.
    |7_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 7|
    '------'
    """
  end

  if @card1.rank == "6" && @card1.suit == "Hearts"
    puts """
    .------.
    |6_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 6|
    '------'
    """
  end

  if @card1.rank == "5" && @card1.suit == "Hearts"
    puts """
    .------.
    |5_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 5|
    '------'
    """
  end

  if @card1.rank == "4" && @card1.suit == "Hearts"
    puts """
    .------.
    |4_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 4|
    '------'
    """
  end

  if @card1.rank == "3" && @card1.suit == "Hearts"
    puts """
    .------.
    |3_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 3|
    '------'
    """
  end

  if @card1.rank == "2" && @card1.suit == "Hearts"
    puts """
    .------.
    |2_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 2|
    '------'
    """
  end
end

def ascii_cards_2
  if @card2.rank == "Ace" && @card2.suit == "Spades"
    puts """
    .------.
    |A .   |
    | / \\  |
    |(_,_) |
    |  I  A|
    '------'
    """
  end

  if @card2.rank == "King" && @card2.suit == "Spades"
    puts """
    .------.
    |K .   |
    | / \\  |
    |(_,_) |
    |  I  K|
    '------'
    """
  end

  if @card2.rank == "Queen" && @card2.suit == "Spades"
    puts """
    .------.
    |Q .   |
    | / \\  |
    |(_,_) |
    |  I  Q|
    '------'
    """
  end

  if @card2.rank == "Jack" && @card2.suit == "Spades"
    puts """
    .------.
    |J .   |
    | / \\  |
    |(_,_) |
    |  I  J|
    '------'
    """
  end

  if @card2.rank == "10" && @card2.suit == "Spades"
    puts """
    .--------.
    |10 .    |
    |  / \\   |
    | (_,_)  |
    |   I  10|
    '--------'
    """
  end

  if @card2.rank == "9" && @card2.suit == "Spades"
    puts """
    .------.
    |9 .   |
    | / \\  |
    |(_,_) |
    |  I  9|
    '------'
    """
  end

  if @card2.rank == "8" && @card2.suit == "Spades"
    puts """
    .------.
    |8 .   |
    | / \\  |
    |(_,_) |
    |  I  8|
    '------'
    """
  end

  if @card2.rank == "7" && @card2.suit == "Spades"
    puts """
    .------.
    |7 .   |
    | / \\  |
    |(_,_) |
    |  I  7|
    '------'
    """
  end

  if @card2.rank == "6" && @card2.suit == "Spades"
    puts """
    .------.
    |6 .   |
    | / \\  |
    |(_,_) |
    |  I  6|
    '------'
    """
  end

  if @card2.rank == "5" && @card2.suit == "Spades"
    puts """
    .------.
    |5 .   |
    | / \\  |
    |(_,_) |
    |  I  5|
    '------'
    """
  end

  if @card2.rank == "4" && @card2.suit == "Spades"
    puts """
    .------.
    |4 .   |
    | / \\  |
    |(_,_) |
    |  I  4|
    '------'
    """
  end

  if @card2.rank == "3" && @card2.suit == "Spades"
    puts """
    .------.
    |3 .   |
    | / \\  |
    |(_,_) |
    |  I  3|
    '------'
    """
  end

  if @card2.rank == "2" && @card2.suit == "Spades"
    puts """
    .------.
    |2 .   |
    | / \\  |
    |(_,_) |
    |  I  2|
    '------'
    """
  end

  if @card2.rank == "Ace" && @card2.suit == "Clubs"
    puts """
    .------.
    |A _   |
    | ( )  |
    |(_x_) |
    |  Y  A|
    '------'
    """
  end

  if @card2.rank == "King" && @card2.suit == "Clubs"
    puts """
    .------.
    |K _   |
    | ( )  |
    |(_x_) |
    |  Y  K|
    '------'
    """
  end

  if @card2.rank == "Queen" && @card2.suit == "Clubs"
    puts """
    .------.
    |Q _   |
    | ( )  |
    |(_x_) |
    |  Y  Q|
    '------'
    """
  end

  if @card2.rank == "Jack" && @card2.suit == "Clubs"
    puts """
    .------.
    |J _   |
    | ( )  |
    |(_x_) |
    |  Y  J|
    '------'
    """
  end

  if @card2.rank == "10" && @card2.suit == "Clubs"
    puts """
    .--------.
    |10 _    |
    |  ( )   |
    | (_x_)  |
    |   Y  10|
    '--------'
    """
  end

  if @card2.rank == "9" && @card2.suit == "Clubs"
    puts """
    .------.
    |9 _   |
    | ( )  |
    |(_x_) |
    |  Y  9|
    '------'
    """
  end

  if @card2.rank == "8" && @card2.suit == "Clubs"
    puts """
    .------.
    |8 _   |
    | ( )  |
    |(_x_) |
    |  Y  8|
    '------'
    """
  end

  if @card2.rank == "7" && @card2.suit == "Clubs"
    puts """
    .------.
    |7 _   |
    | ( )  |
    |(_x_) |
    |  Y  7|
    '------'
    """
  end

  if @card2.rank == "6" && @card2.suit == "Clubs"
    puts """
    .------.
    |6 _   |
    | ( )  |
    |(_x_) |
    |  Y  6|
    '------'
    """
  end

  if @card2.rank == "5" && @card2.suit == "Clubs"
    puts """
    .------.
    |5 _   |
    | ( )  |
    |(_x_) |
    |  Y  5|
    '------'
    """
  end

  if @card2.rank == "4" && @card2.suit == "Clubs"
    puts """
    .------.
    |4 _   |
    | ( )  |
    |(_x_) |
    |  Y  4|
    '------'
    """
  end

  if @card2.rank == "3" && @card2.suit == "Clubs"
    puts """
    .------.
    |3 _   |
    | ( )  |
    |(_x_) |
    |  Y  3|
    '------'
    """
  end

  if @card2.rank == "2" && @card2.suit == "Clubs"
    puts """
    .------.
    |2 _   |
    | ( )  |
    |(_x_) |
    |  Y  2|
    '------'
    """
  end

  if @card2.rank == "Ace" && @card2.suit == "Diamonds"
    puts """
    .------.
    |A /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ A|
    `------'
    """
  end

  if @card2.rank == "King" && @card2.suit == "Diamonds"
    puts """
    .------.
    |K /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ K|
    `------'
    """
  end

  if @card2.rank == "Queen" && @card2.suit == "Diamonds"
    puts """
    .------.
    |Q /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ Q|
    `------'
    """
  end

  if @card2.rank == "Jack" && @card2.suit == "Diamonds"
    puts """
    .------.
    |J /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ J|
    `------'
    """
  end

  if @card2.rank == "10" && @card2.suit == "Diamonds"
    puts """
    .---------.
    |10 /\\   |
    |  /  \\  |
    |  \\  /  |
    |   \\/ 10|
    `---------'
    """
  end

  if @card2.rank == "9" && @card2.suit == "Diamonds"
    puts """
    .------.
    |9 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 9|
    `------'
    """
  end

  if @card2.rank == "8" && @card2.suit == "Diamonds"
    puts """
    .------.
    |8 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 8|
    `------'
    """
  end

  if @card2.rank == "7" && @card2.suit == "Diamonds"
    puts """
    .------.
    |7 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 7|
    `------'
    """
  end

  if @card2.rank == "6" && @card2.suit == "Diamonds"
    puts """
    .------.
    |6 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 6|
    `------'
    """
  end

  if @card2.rank == "5" && @card2.suit == "Diamonds"
    puts """
    .------.
    |5 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 5|
    `------'
    """
  end

  if @card2.rank == "4" && @card2.suit == "Diamonds"
    puts """
    .------.
    |4 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 4|
    `------'
    """
  end

  if @card2.rank == "3" && @card2.suit == "Diamonds"
    puts """
    .------.
    |3 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 3|
    `------'
    """
  end

  if @card2.rank == "2" && @card2.suit == "Diamonds"
    puts """
    .------.
    |2 /\\  |
    | /  \\ |
    | \\  / |
    |  \\/ 2|
    `------'
    """
  end

  if @card2.rank == "Ace" && @card2.suit == "Hearts"
    puts """
    .------.
    |A_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ A|
    '------'
    """
  end

  if @card2.rank == "King" && @card2.suit == "Hearts"
    puts """
    .------.
    |K_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ K|
    '------'
    """
  end

  if @card2.rank == "Queen" && @card2.suit == "Hearts"
    puts """
    .------.
    |Q_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ Q|
    '------'
    """
  end

  if @card2.rank == "Jack" && @card2.suit == "Hearts"
    puts """
    .------.
    |J_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ J|
    '------'
    """
  end

  if @card2.rank == "10" && @card2.suit == "Hearts"
    puts """
    .--------.
    |10_  _  |
    | ( \\/ ) |
    |  \\  /  |
    |   \\/ 10|
    '---------'
    """
  end

  if @card2.rank == "9" && @card2.suit == "Hearts"
    puts """
    .------.
    |9_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 9|
    '------'
    """
  end

  if @card2.rank == "8" && @card2.suit == "Hearts"
    puts """
    .------.
    |8_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 8|
    '------'
    """
  end

  if @card2.rank == "7" && @card2.suit == "Hearts"
    puts """
    .------.
    |7_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 7|
    '------'
    """
  end

  if @card2.rank == "6" && @card2.suit == "Hearts"
    puts """
    .------.
    |6_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 6|
    '------'
    """
  end

  if @card2.rank == "5" && @card2.suit == "Hearts"
    puts """
    .------.
    |5_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 5|
    '------'
    """
  end

  if @card2.rank == "4" && @card2.suit == "Hearts"
    puts """
    .------.
    |4_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 4|
    '------'
    """
  end

  if @card2.rank == "3" && @card2.suit == "Hearts"
    puts """
    .------.
    |3_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 3|
    '------'
    """
  end

  if @card2.rank == "2" && @card2.suit == "Hearts"
    puts """
    .------.
    |2_  _ |
    |( \\/ )|
    | \\  / |
    |  \\/ 2|
    '------'
    """
  end

end
