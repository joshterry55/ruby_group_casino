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
puts 
end

def balance_bet_menu    
puts "              Your Bet: $#{@bet_amount}                                        Your Balance: $#{@current_player.money}".colorize(:light_yellow)
puts
puts
end

def blackjack_menu
  blackjack_color_move
  blackjack_logo
  balance_bet_menu
  puts "Welcome to Ruby BLACKJACK!"
  puts "Take a seat and lets get started."
  puts "1) Play Blackjack"
  puts "2) Return to Casino"
  print "> "
  case gets.strip
  when '1'
    @shuffle_sound.play
    blackjack_logo
    balance_bet_menu
    player_bet
    # deck_deal
  when '2'
    ruby_casino_menu
  else
    puts "Invalid Input. Please Try Again!"
    blackjack_menu
  end
end
 
def player_bet  
    blackjack_logo
    balance_bet_menu
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
    player_bet
  else 
    deck_deal
  end
end
# TODO: end loop if player doesnt have enough money

def deck_deal
  blackjack_logo  
  balance_bet_menu
  d = Deck.new
  @d_shuffle = d.cards.shuffle
  @player_hand = @d_shuffle.pop(2)
  @dealer_hand = @d_shuffle.pop(2)
  # puts "You have #{@player_hand[0].rank} of #{@player_hand[0].suit} and #{@player_hand[1].rank} of #{@player_hand[1].suit}."
  dealers_show_card
  puts
  compute_dealer_hand
  compute_player_hand
end

def dealers_show_card
    puts "  Dealer: #{@dealer_hand[0].rank} of #{@dealer_hand[0].suit}.  ".colorize(:color => :light_red, :mode => :bold)
    puts
    puts "---------------------" 
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
  hit_or_bust
end

def hit_or_bust
    player_total_meth
    if @player_total > 21
      puts "YOU BUSTED! You lose #{@bet_amount}".colorize(:light_red)
      @current_player.money -= @bet_amount 
      play_again
    elsif @player_total == 21
        puts "YOU WIN!"
      # puts "BLACKJACK! YOU WIN!"
      @current_player.money += @bet_amount
      play_again  
    else
      puts
      puts "Do you want to hit? (y or n)"
      print "> "
      case gets.strip.downcase 
      when 'y'
        blackjack_logo
        dealers_show_card
        card_compare
      when 'n'
        puts
        dealer_show
      else 
        puts "Invalid. Try again."
      end
    end
end

def player_total_meth
    puts "Your total is: #{@player_total}".colorize(:color => :light_cyan, :mode => :underline)
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
    puts
    puts "BUSTED! You lose! $#{bet_amount}".colorize(:light_red)
    @current_player.money -= @bet_amount
    play_again
  end
end

def show_player_hand
    @player_hand.each do |x|
        puts "#{@current_player.name}: #{x.rank} of #{x.suit}."
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
end

def compute_dealer_hand_second
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
  print "Push ENTER > "
  gets.strip
  # puts "The dealer's total is #{dealer_total}"
end

def print_dealer_hand
    @dealer_hand.each do |x|
        puts "Dealer: #{x.rank} of #{x.suit}."
    end
end

def dealer_show
  blackjack_logo
  balance_bet_menu   
  if @dealer_total < 17 
    show_player_hand
    player_total_meth
    puts
    print_dealer_hand
    puts "Dealer total: #{@dealer_total}"
    @dealer_hand << @d_shuffle.pop
    compute_dealer_hand_second
    dealer_show
   elsif @dealer_total >= 17 && @dealer_total <= 21
    show_player_hand
    player_total_meth
    puts
    print_dealer_hand  
    compute_dealer_hand
    puts "Dealer total: #{@dealer_total}"
    declare_winner
  elsif @dealer_total > 21 
    show_player_hand
    player_total_meth
    puts
    print_dealer_hand
    compute_dealer_hand
    puts "Dealer total: #{@dealer_total}"
    puts "THE DEALER BUSTED! You win $#{@bet_amount}".colorize(:light_green)
    @current_player.money += @bet_amount
    play_again
  end 
 end

 def declare_winner
  if @player_total > @dealer_total 
    puts "YOU BEAT THE DEALER! You win $#{@bet_amount}!".colorize(:light_green)
    @current_player.money += @bet_amount
    play_again
  elsif @player_total < @dealer_total
    puts "THE DEALER BEAT YOU! You lose $#{@bet_amount}".colorize(:light_red)
    @current_player.money -= @bet_amount
    play_again
  elsif @player_total == @dealer_total
    puts "YOU PUSHED! You get your bet back"#.colorize(:light_green)
    play_again
  end
 end

 def play_again
    puts "Do you want to play again? (y or n)"
    print "> "
    @play_again_input = gets.strip.downcase
    if @play_again_input == 'y'
        player_bet
    elsif @play_again_input == 'n'
        blackjack_menu
    else 
        puts 'Invalid input. Try again!'
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
# - Dealer wins if he starts with 21
    # - push if player also has 21 at start






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

