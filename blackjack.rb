require 'pry'


class Card
 # Getter and Setter methods for rank, suit and color
 attr_accessor :rank, :suit
 # Gets called when you call the new method to create an instance
 # card = Card.new('10', 'K', 'Black')
 def initialize(rank, suit)
   @rank = rank
   @suit = suit
 end
end

class Deck
 # Getter and Setter methods for rank, suit and color
 attr_accessor :cards

 # Gets called when you call the new method to create an instance
 # deck = Deck.new
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
                                                         
,-----. ,--.             ,--.      ,--.             ,--.     
|  |) /_|  | ,--,--.,---.|  |,-.   `--' ,--,--.,---.|  |,-.  
|  .-. |   |' ,-.  | .--'|     /   ,--.' ,-.  | .--'|     /  
|  '--' /  |  '-'  | `--.|  |  |   |  || '-'  | `--.|  |  |  
`------'`--' `--`--'`---'`--'`--'.-'  / `--`--'`---'`--'`--' 
                                 '---'                       

"""
end


def blackjack_menu
  print `clear`
  black_jack_logo
  puts 'Welcome to Ruby BLACKJACK!'
  puts "Take a seat and lets get started."
  puts '1) Play Blackjack'
  puts '2) Return to Casino'
  case gets.strip
  when '1'
    puts 'Alright! Lets begin!'
    bet
  when '2'
    ruby_casino_menu
  else
    puts 'Invalid Input. Please Try Again!'
    blackjack_menu
  end
end
 
def bet
  puts "Your wallet total: $#{@player_1.money}"
  if @player_1.money < 5
    puts "Sorry, the table minimum is 5 and you are unable to play."
    exit
  else 
  end
  # puts 'Rules explained...'
  # puts 'You want to play BLACKJACK?'
  # puts '1) Yes'
  # puts '2) No'
  # case gets.strip
  #   when '1'
  #     # @player_1.money - 5
      deal
  #   when '2'
  #     ruby_casino_menu
  #   else 
  #     puts "Invalid input, try again."
  #     bet
  #   end
end

def deal
  d = Deck.new
  @d_shuffle = d.cards.shuffle
  @player_hand = @d_shuffle.pop(2)
  @dealer_hand = @d_shuffle.pop(2)
  # puts "You have #{@player_hand[0].rank} of #{@player_hand[0].suit} and #{@player_hand[1].rank} of #{@player_hand[1].suit}."
  puts "Dealer shows #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}." #and #{dealer_hand[1].rank} #{dealer_hand[1].suit}."
  # compute_hand(@player_hand, @dealer_hand)
  compute_player_hand
  compute_dealer_hand
end

# def compute_hand(player, dealer)
#   player_total = 0
#   player.each do |x|
#     if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
#       x.rank = 10
#     end 
#     if ( x.rank == 'A')
#       x.rank = 11
#     end 
#     player_total += x.rank.to_i
#   end
#   puts "Your total is #{player_total}."

    
#   dealer_total = 0
#   dealer.each do |x|
#     if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
#       x.rank = 10
#     end 
#     if ( x.rank == 'A')
#       x.rank = 11
#     end 
#     dealer_total += x.rank.to_i
#   end
#   # puts "The dealer's total is #{dealer_total}"
#   puts 'Do you wish to hit? (y or n)'
#   case gets.strip
#     when 'y'
#       @player_hand
#       compute_hand(@player_hand)
#       binding.pry
#     when 'n'

#     end
# end

def compute_player_hand
  player_total = 0
  @player_hand.each do |x|
    puts "#{x.rank} of #{x.suit}."
    if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
      x.rank = 10
    end 
    if ( x.rank == 'A')
      x.rank = 11
    end 
    player_total += x.rank.to_i
  end
  puts "Your total is #{player_total}."
    puts 'Do you wish to hit? (y or n)'
  case gets.strip
    when 'y'
      @player_hand << @d_shuffle.pop
      compute_player_hand
      
    when 'n'
      binding.pry
    end
end

    def compute_dealer_hand
  dealer_total = 0
  @dealer_hand.each do |x|
    if (x.rank == 'J' || x.rank == 'Q' || x.rank == 'K')
      x.rank = 10
    end 
    if ( x.rank == 'A')
      x.rank = 11
    end 
    dealer_total += x.rank.to_i
  end
  # puts "The dealer's total is #{dealer_total}"

end



#after returning user total prompt if they want to hit
# pop another care to the player hand and display total


  # if total > 21 
  #   puts "You lose"
  # elsif total == 21
  #   puts "Blackjack!"
  # elsif 
  # end


