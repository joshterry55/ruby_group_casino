require 'pry'
require 'colorize'

class Card
  attr_accessor :rank, :suit
  def initialize(rank, suit)
   @rank = rank
   @suit = suit
  end
end

class Deck
  attr_accessor :cards
  def initialize
    @ranks = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
    @suits = %w(Spades Diamonds Clubs Hearts)
    @cards = []
    generate_deck
  end
 
 def generate_deck
   @suits.each do |suit|
     @ranks.size.times do |i|
       @cards << Card.new(@ranks[i], suit)
      end
    end
  end
end

def black_jack_logo
puts """
                                               
  ██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗
  ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝
  ██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝ 
  ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗ 
  ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗
  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝                                                                                                                                                          
  
  .------.                                                          .------.
  |A.--. |                                                          |K.--. |
  | (\\/) |                                                          | :/\\: |
  | :\\/: |                                                          | :\\/: |
  | '--'A|                                                          | '--'K|
  `------'                                                          `------'

""".colorize(:light_yellow)
end


def blackjack_menu
  print `clear`
  black_jack_logo
  puts "                     Welcome to Ruby BLACKJACK!"
  puts "                     Take a seat and lets get started."
  puts "                     1) Play Blackjack"
  puts "                     2) Return to Casino"
  print "                     > "
  case gets.strip
  when '1'
    puts "                   Alright! Lets begin!"
    bet
    # deal
  when '2'
    ruby_casino_menu
  else
    puts "                   Invalid Input. Please Try Again!"
    blackjack_menu
  end
end
 
def bet
  puts "Your wallet total: $#{@current_player.money}"
  if @current_player.money < 5
    puts "Sorry, the table minimum is 5 and you are unable to play."
    ruby_casino_menu
  else 
  end
  puts 'Get as close to 21 and beat the dealer!'
  puts 'How much do you want to bet?'
  @bet_amount = gets.strip.to_i
  if @bet_amount < 5 || @bet_amount > @current_player.money
    puts 'Sorry that is an invalid amount!'
    bet 
  else 
    deal
  end
end

def deal
  puts `clear`
  black_jack_logo
  d = Deck.new
  @d_shuffle = d.cards.shuffle
  @player_hand = @d_shuffle.pop(2)
  @dealer_hand = @d_shuffle.pop(2)
  # puts "You have #{@player_hand[0].rank} of #{@player_hand[0].suit} and #{@player_hand[1].rank} of #{@player_hand[1].suit}."
  puts "                      Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}." #and #{dealer_hand[1].rank} #{dealer_hand[1].suit}."
  puts "                      ---------------------" 
  compute_dealer_hand
  compute_player_hand
end

def compute_player_hand
  @player_total = 0
  @player_hand.each do |x|
    puts "                      #{@current_player.name}: #{x.rank} of #{x.suit}."
    if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
      x.rank = 10
    elsif ( x.rank == 'A')
      x.rank = 11
    end 
    @player_total += x.rank.to_i
  end
  hit_bust
end

def hit_bust
  puts "                      Your total is #{@player_total}."
    if @player_total > 21
      puts "                      You busted!"
      puts "                      Do you want to play again?"
      print "                      > "
      binding.pry
      gets.strip 
      blackjack_menu
    elsif @player_total == 21
      puts "BLACKJACK! YOU WIN!"
      blackjack_menu
    else
      puts "                      Do you want to hit? (y or n)"
      print "                      > "
      case gets.strip.downcase 
      when 'y'
        card_compare
        # compute_player_hand
      when 'n'
        dealer_show 
      else 
        puts "                              Invalid. Try again."
      end
    end
end

def card_compare
  if @player_total < 21
    @player_hand << @d_shuffle.pop
    compute_player_hand
  elsif @player_total == 21
    puts "You got BLACKJACK!!!"
  elsif @player_total > 21
    puts "You have busted!"
    deal
  end
end

def compute_dealer_hand
  @dealer_total = 0
  @dealer_hand.each do |x|
    if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
      x.rank = 10
    elsif ( x.rank == 'A')
      x.rank = 11
    end 
    @dealer_total += x.rank.to_i
  end
  # puts "The dealer's total is #{dealer_total}"
end

def dealer_show
# compute_dealer_hand
  if @dealer_total < 17 
    @dealer_hand.each do |x|
      puts "                      Dealer: #{x.rank} of #{x.suit}."
    end
    # @player_hand << @d_shuffle.pop
    puts "                      #{@dealer_total}"
    # compute_dealer_hand
    @dealer_hand << @d_shuffle.pop
    compute_dealer_hand
    #     @dealer_hand.each do |x|
    #   puts "                      Dealer: #{x.rank} of #{x.suit}."
    # end
    # puts "                      #{@dealer_total}"
    dealer_show
    # binding.pry
   elsif @dealer_total >= 17 && @dealer_total <= 21
      @dealer_hand.each do |x|
      puts "                      Dealer: #{x.rank} of #{x.suit}."
      end
      compute_dealer_hand
      puts "                      #{@dealer_total}"
      declare_winner
  elsif @dealer_total > 21 
          @dealer_hand.each do |x|
      puts "                      Dealer: #{x.rank} of #{x.suit}."
      end
      compute_dealer_hand
      puts "                      #{@dealer_total}"
    puts "                      The dealer busted! You WIN!"
    binding.pry
    bet
    gets.strip
  end
  
 end

 def declare_winner
  if @player_total > @dealer_total 
    puts "                       You WIN!"
    binding.pry
    gets.strip
    blackjack_menu
  elsif @player_total < @dealer_total
    puts "                       You LOSE!"
    binding.pry
    gets.strip
    blackjack_menu
  elsif @player_total == @dealer_total
    puts "                       You PUSH!"
    binding.pry
    gets.strip
    blackjack_menu
  end
 end

# TODO: if the dealer has 21 they auto win






