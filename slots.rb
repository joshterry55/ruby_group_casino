
@current_bet = 1
@spin = [0, 0, 0]
@player_1_money = 10 # TEMPORARY

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
end

def show_default_slots
  puts "                    [ 3 ]|[ 3 ]|[ 3 ]"
  puts
end

def show_current_bet
  puts "Current Bet: $#{@current_bet}                          Your money: $#{@player_1_money}"
  puts
end

def ask_for_bet
  puts "Enter bet amount (1-5) and press enter to spin,"
  puts "or just press enter to use the current bet amount."
  bet_amount = gets.strip
  if bet_amount.length == 0
    bet_amount = @current_bet
  else
    bet_amount = bet_amount.to_i
  end
  if bet_amount < 1 || bet_amount > 5
    show_slots_logo
    puts "Not a valid bet amount, bet 1 - 5 dollars!"
    puts
    ask_for_bet
  else
    #if bet_amount > @player_1_money

    @current_bet = bet_amount
    spin_slots
  end
end


def spin_slots
  @player_1_money -= @current_bet
  @spin = [0, 0, 0]
  (0..44).each do |i|
    @spin[0] = 1 + rand(5) if i < 15
    @spin[1] = 1 + rand(5) if i < 30
    @spin[2] = 1 + rand(5)
    show_slots_logo()
    puts "\nSpinning..."
    sleep 0.05
    # possibly add
  end

  if @spin[0] == @spin[1] && @spin[0] == @spin[2]
    puts "\nThree #{@spin[0]}'s! You win!"
    sleep 3
  end

  if @spin[0] == @spin[1] && @spin[0] != @spin[2]
    puts "\nTwo consecutive #{@spin[0]}'s! Partial win!"
    sleep 3
  end

  if @spin[1] == @spin[2] && @spin[0] != @spin[2]
    puts "\nTwo consecutive #{@spin[1]}'s! Partial win!"
    sleep 3
  end
end

while true
  show_slots_logo
  ask_for_bet
end
