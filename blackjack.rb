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

@bet_amount = 0

def blackjack_logo
print `clear`
puts "                                                  "
puts "   .------.    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗   .------.  ".colorize(:red) 
puts "   |A.--. |    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝   |J.--. |  ".colorize(:light_red) 
puts "   | (\\/) |    ██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝    | :/\\: |  ".colorize(:light_red) 
puts "   | :\\/: |    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗    | :\\/: |  ".colorize(:light_yellow) 
puts "   | '-- A|    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗   | '--'J|  ".colorize(:light_yellow) 
puts "   `------'    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   `------'  ".colorize(:yellow)                                                                                                                                        
puts      
puts      
puts "               Your Balance: $#{@current_player.money}                                          Your Bet: $#{@bet_amount}".colorize(:light_yellow)
puts 
puts 
end


def blackjack_menu
  # print `clear`
  blackjack_color_move
  blackjack_logo
  puts "Welcome to Ruby BLACKJACK!"
  puts "Take a seat and lets get started."
  puts "1) Play Blackjack"
  puts "2) Return to Casino"
  print "> "
  case gets.strip
  when '1'
    blackjack_logo
    puts "Alright! Lets begin!"
    bet
    # deal
  when '2'
    ruby_casino_menu
  else
    puts "Invalid Input. Please Try Again!"
    blackjack_menu
  end
end
 
def bet
  if @current_player.money < 5
    puts "Sorry, the table minimum is 5 and you are unable to play."
    ruby_casino_menu
  else 
  end
  puts 'Get as close to 21 and beat the dealer!'
  puts 'How much do you want to bet?'
  print '> '
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
  blackjack_logo
  d = Deck.new
  @d_shuffle = d.cards.shuffle
  @player_hand = @d_shuffle.pop(2)
  @dealer_hand = @d_shuffle.pop(2)
  # puts "You have #{@player_hand[0].rank} of #{@player_hand[0].suit} and #{@player_hand[1].rank} of #{@player_hand[1].suit}."
  puts "  Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}.  ".colorize(:color => :blue, :mode => :bold)
  puts "---------------------" 
  compute_dealer_hand
  compute_player_hand
end

def compute_player_hand
  @player_total = 0
  @player_hand.each do |x|
    puts "#{@current_player.name}: #{x.rank} of #{x.suit}."
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
  puts "Your total is #{@player_total}."
    if @player_total > 21
      puts "You busted!".colorize(:light_red)
      puts "#{@bet_amount} subtracted".colorize(:light_red)
      gets.strip
      # sleep(3)
      @current_player.money -= @bet_amount 
      blackjack_menu
    elsif @player_total == 21
      puts "BLACKJACK! YOU WIN!"
      gets.strip
      blackjack_menu
    else
      puts
      puts "Do you want to hit? (y or n)"
      print "> "
      case gets.strip.downcase 
      when 'y'
        blackjack_logo
          puts "  Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}.  ".colorize(:color => :blue, :mode => :bold)
          puts "---------------------" 
        card_compare
        # compute_player_hand
      when 'n'
        blackjack_logo
        puts "  Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}.  ".colorize(:color => :blue, :mode => :bold)
        puts "---------------------" 
        @player_hand.each do |x|
        puts "#{@current_player.name}: #{x.rank} of #{x.suit}."
        end
        puts "Your total is #{@player_total}.".colorize(:background => :light_yellow, :color => :blue)
        puts
        dealer_show
      else 
        puts "Invalid. Try again."
      end
    end
end

def blackjack_win
  # player_hand.length == 2?
end

def card_compare
  if @player_total < 21
    @player_hand << @d_shuffle.pop
    compute_player_hand
  elsif @player_total == 21
    declare_winner
    # bj_win = @bet_amount / 2
    # puts "You got BLACKJACK!!!"
    # @current_player.money += @bet_amount += bj_win  # BLACKJACK WORK?
    gets.strip
  elsif @player_total > 21
    puts "You have busted!".colorize(:light_red)
    puts "#{@bet_amount} subtracted".colorize(:light_red)
    # sleep(3)
    gets.strip
    @current_player.money -= @bet_amount
    deal
  end
end

def compute_dealer_hand
  @blackjack_logo
    puts "  Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}.  ".colorize(:color => :blue, :mode => :bold)
    puts "---------------------" 
    @player_hand.each do |x|
    puts "#{@current_player.name}: #{x.rank} of #{x.suit}."
    end
    puts "Your total is #{@player_total}.".colorize(:background => :light_yellow, :color => :blue)
    puts
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
      puts "Dealer: #{x.rank} of #{x.suit}."
    end
    # @player_hand << @d_shuffle.pop
    puts "#{@dealer_total}"
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
      puts "Dealer: #{x.rank} of #{x.suit}."
      end
      compute_dealer_hand
      puts "#{@dealer_total}"
      declare_winner
  elsif @dealer_total > 21 
          @dealer_hand.each do |x|
      puts "Dealer: #{x.rank} of #{x.suit}."
      end
      compute_dealer_hand
      puts "#{@dealer_total}"
    puts "The dealer busted! You WIN!".colorize(:light_green)
    puts "#{@bet_amount} added".colorize(:light_green)
    # sleep(3)
    gets.strip
    @current_player.money += @bet_amount
    bet
  end
  
 end

 def declare_winner
  if @player_total > @dealer_total 
    puts "You WIN!".colorize(:light_green)
    puts "#{@bet_amount} added".colorize(:light_green)
    # sleep(3)
    gets.strip
    @current_player.money += @bet_amount
    blackjack_menu
  elsif @player_total < @dealer_total
    puts "You LOSE!".colorize(:light_red)
    puts "#{@bet_amount} subtracted".colorize(:light_red)
    # sleep(3)
    gets.strip
    @current_player.money -= @bet_amount
    blackjack_menu
  elsif @player_total == @dealer_total
    puts "You PUSH!"#.colorize(:light_green)
    puts "You lose nothing."
    # sleep(3)
    gets.strip
    # homer  
    blackjack_menu
  end
 end

def blackjack_color_move
    (1..15).each do |x|
        case x
        when 1
            blackjack_color1
            sleep 0.12
        when 2
            blackjack_color2
            sleep 0.12
        when 3
            blackjack_color3
            sleep 0.12
        when 4
            blackjack_color1
            sleep 0.12
        when 5
            blackjack_color2
            sleep 0.12
        when 6
            blackjack_color3
            sleep 0.12
        when 7
            blackjack_color1
            sleep 0.12
        when 8
            blackjack_color2
            sleep 0.12
        when 9
            blackjack_color3
            sleep 0.12
        when 10
            blackjack_color1
            sleep 0.12
        when 11
            blackjack_color2
            sleep 0.12
        when 12
            blackjack_color3
            sleep 0.12
        when 13
            blackjack_color1
            sleep 0.12
        when 14
            blackjack_color2
            sleep 0.12
        when 15
            blackjack_color3
            sleep 0.12
            blackjack_logo
        end
      end
end


def blackjack_color1
puts `clear`
puts "   .------.    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗   .------.  ".colorize(:red) 
puts "   |A.--. |    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝   |J.--. |  ".colorize(:light_red) 
puts "   | (\\/) |    ██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝    | :/\\: |  ".colorize(:light_red) 
puts "   | :\\/: |    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗    | :\\/: |  ".colorize(:light_yellow) 
puts "   | '-- A|    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗   | '--'J|  ".colorize(:light_yellow) 
puts "   `------'    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   `------'  ".colorize(:yellow)                                                                                                                                        
end

def blackjack_color2
puts `clear`
puts "   .------.    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗   .------.  ".colorize(:yellow) 
puts "   |A.--. |    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝   |J.--. |  ".colorize(:yellow) 
puts "   | (\\/) |    ██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝    | :/\\: |  ".colorize(:red) 
puts "   | :\\/: |    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗    | :\\/: |  ".colorize(:red) 
puts "   | '-- A|    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗   | '--'J|  ".colorize(:light_red) 
puts "   `------'    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   `------'  ".colorize(:light_red)                                                                                                                                        
end

def blackjack_color3
puts `clear`
puts "   .------.    ██████╗ ██╗      █████╗  ██████╗██╗  ██╗     ██╗ █████╗  ██████╗██╗  ██╗   .------.  ".colorize(:light_yellow) 
puts "   |A.--. |    ██╔══██╗██║     ██╔══██╗██╔════╝██║ ██╔╝     ██║██╔══██╗██╔════╝██║ ██╔╝   |J.--. |  ".colorize(:light_yellow) 
puts "   | (\\/) |    ██████╔╝██║     ███████║██║     █████╔╝      ██║███████║██║     █████╔╝    | :/\\: |  ".colorize(:yellow) 
puts "   | :\\/: |    ██╔══██╗██║     ██╔══██║██║     ██╔═██╗ ██   ██║██╔══██║██║     ██╔═██╗    | :\\/: |  ".colorize(:yellow) 
puts "   | '-- A|    ██████╔╝███████╗██║  ██║╚██████╗██║  ██╗╚█████╔╝██║  ██║╚██████╗██║  ██╗   | '--'J|  ".colorize(:red) 
puts "   `------'    ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝ ╚════╝ ╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝   `------'  ".colorize(:red)                                                                                                                                        
end




# TODO: 
# - if the dealer has 21 they auto win
# - card shuffle sound?
# - BLACKJACK shuffle colors?
# def homer
# puts
# puts
# puts                            __ 
# puts                       _ ,___,-'",-=-. 
# puts           __,-- _ _,-'_)_  ("\"\"`'-._\ `. 
# puts        _,'  __ |,' ,-' __)  ,-     /. | 
# puts      ,'_,/--'   |     -'  _)/         `\ 
# puts    ,','      ,'       ,-'_,`           : 
# puts    ,'     ,-'       ,(,-(              : 
# puts         ,'       ,-' ,    _            ; 
# puts        /        ,-._/`---'            / 
# puts       /        (____)(----. )       ,' 
# puts      /         (      `.__,     /\\ /, 
# puts     :           ;-.___         /__\\/| 
# puts     |         ,'      `--.      -,\\ | 
# puts     :        /            \\    .__/ 
# puts      \\      (__            \\    |_ 
# puts       \\       ,`-, *       /   _|,\\ 
# puts        \\    ,'   `-.     ,'_,-'    \\ 
# puts       (_\\,-'    ,'\\")--,'-'       __\\ 
# puts        \\       /  // ,'|      ,--'  `-. 
# puts         `-.    `-/ \\'  |   _,'         `. 
# puts            `-._ /      `--'/             \\ 
# puts               ,'           |              \\ 
# puts              /             |               \\ 
# puts           ,-'              |               / 
# puts          /                 |             -' 
# puts
# puts
# end

