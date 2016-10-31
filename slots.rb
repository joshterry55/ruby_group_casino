@current_bet = 1
@spin = [0, 0, 0]
@message_code = 0

def show_slots_logo
  puts `clear`
  puts """
     _       _                        _     _            
    | |     | |                      | |   (_)           
 ___| | ___ | |_ _ __ ___   __ _  ___| |__  _ _ __   ___ 
/ __| |/ _ \\| __| '_ ` _ \\ / _` |/ __| '_ \\| | '_ \\ / _ \\ 
\\__ \\ | (_) | |_| | | | | | (_| | (__| | | | | | | |  __/
|___/_|\\___/ \\__|_| |_| |_|\\__,_|\\___|_| |_|_|_| |_|\\___|
                                           at Ruby Casino
  """
  if @spin[1] == 0 
      show_default_slots
    else
      puts puts "                    [ #{@spin[0]} ]|[ #{@spin[1]} ]|[ #{@spin[2]} ]"
    end
  show_current_bet
  show_message_code
  ask_for_bet if @message_code != 4
end

def show_message_code
  case @message_code
  when 0
    puts
    puts "No winnings this round."
    puts
  when 1
    puts
    puts "Two consecutive #{@spin[0]}'s! You win $#{((@current_bet + 1) * (@current_bet + 1))}!"
    puts
  when 2
    puts
    puts "Two consecutive #{@spin[1]}'s! You win $#{(@current_bet + 1) * (@current_bet + 1)}!"
    puts
  when 3
    puts
    puts "Three #{@spin[0]}'s! You win #{(@current_bet * 10) * (@current_bet * 10)}!"
    puts
  when 4
    puts
    puts "Spinning..."
    puts
  when 5
    puts
    puts "Not a valid bet amount, bet 1 - 5 dollars!"
    puts
  end
end

def show_default_slots
  puts "                    [ 3 ]|[ 3 ]|[ 3 ]"
  puts
end

def show_current_bet
  puts "Current Bet: $#{@current_bet}                          Your money: $#{@player_1.money}"
  puts
end

def ask_for_bet
  @message_code = 0
  puts "Enter bet amount (1-5) and press enter to spin,"
  puts "or just press enter to use the current bet amount."
  puts "To back away from the slot machine, type 'leave'."
  bet_amount = gets.strip
  ruby_casino_menu if bet_amount.downcase == 'leave'
  if bet_amount.length == 0
    bet_amount = @current_bet
  else
    bet_amount = bet_amount.to_i
  end
  if bet_amount < 1 || bet_amount > 5
    @message_code = 5
    show_slots_logo
  else
    #if bet_amount > @player_1.money

    @current_bet = bet_amount
    spin_slots
  end
end


def spin_slots
  @player_1.money -= @current_bet
  @spin = [0, 0, 0]
  (0..44).each do |i|
    @spin[0] = 1 + rand(5) if i < 15
    @spin[1] = 1 + rand(5) if i < 30
    @spin[2] = 1 + rand(5)
    @message_code = 4
    show_slots_logo
    sleep 0.05
  end

  @message_code = 0

  if @spin[0] == @spin[1] && @spin[0] == @spin[2]
    @message_code = 3
    @player_1.money += (@current_bet * 10) * (@current_bet * 10)
    show_slots_logo
  end

  if @spin[0] == @spin[1] && @spin[0] != @spin[2]
    @message_code = 1
    @player_1.money += (@current_bet + 1) * (@current_bet + 1)
    show_slots_logo
  end

  if @spin[1] == @spin[2] && @spin[0] != @spin[2]
    @message_code = 2
    @player_1.money += (@current_bet + 1) * (@current_bet + 1)
    show_slots_logo
  end

  show_slots_logo
end