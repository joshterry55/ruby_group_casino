@player_sign = 0
@computer_sign = 0
@current_bet_rps = 5
@message_code_rps = 0

def start_rps
	show_logo_rps
	show_current_bet_rps
	show_message_rps
	ask_for_bet_rps
end

def show_logo_rps
	puts `clear`
	puts "                                                    ,-.----.                                                ".colorize(:light_blue)
	puts ",-.----.                            ,-.             \\    /  \\                                             ".colorize(:light_blue)
	puts "\\    /  \\                       ,--/ /|             |   :    \\            ,-.----.                       ".colorize(:light_blue)
	puts ";   :    \\   ,---.            ,--. :/ |             |   |  .\\ :           \\    /  \\             __  ,-. ".colorize(:light_blue)
	puts "|   | .\\ :  '   ,'\\           :  : ' /              .   :  |: |           |   :    |          ,' ,'/ /|   ".colorize(:light_blue)
	puts ".   : |: | /   /   |   ,---.  |  '  /               |   |   \\ : ,--.--.   |   | .\\ :   ,---.  '  | |' |   ".colorize(:light_blue)
	puts "|   |  \\ :.   ; ,. :  /     \\ '  |  :               |   : .   //       \\  .   : |: |  /     \\ |  |   ,' ".colorize(:light_blue)
	puts "|   : .  /'   | |: : /    / ' |  |   \\              ;   | |`-'.--.  .-. | |   |  \\ : /    /  |'  :  /     ".colorize(:light_blue)
	puts ";   | |  \\'   | .; :.    ' /  '  : |. \\             |   | ;    \\__\\/: . . |   : .  |.    ' / ||  | '    ".colorize(:light_blue)
	puts "|   | ;\\  \\   :    |'   ; :__ |  | ' \\ \\            :   ' |    ,\" .--.; | :     |`-''   ;   /|;  : |   "
	puts ":   ' | \\.'\\   \\  / '   | '.'|'  : |--'___          :   : :   /  /  ,.  | :   : :   '   |  / ||  , ;___  "
	puts ":   : :-'   `----'  |   :    :;  |,'  /  .\\         |   | :  ;  :   .'   \\|   | :   |   :    | ---'/  .\\ "
	puts "|   |.'   .--.--.    \\   \\  / '--'    \\_ ; |        `---'.|  |  ,     .-./`---'.|    \\   \\  /      \\_ ; |"
	puts "`---'    /  /    '.   `----'    ,--,  /  ,\"           `---`   `--`---'      `---`     `----'       /  ,\"  "
	puts "        |  :  /`. /           ,--.'| '--'                       ,---.    __  ,-.                  '--'      "
	puts "        ;  |  |--`            |  |,      .--.--.    .--.--.    '   ,'\\ ,' ,'/ /|  .--.--.                  "
	puts "        |  :  ;_       ,---.  `--'_     /  /    '  /  /    '  /   /   |'  | |' | /  /    '                  "
	puts "         \\  \\    `.   /     \\ ,' ,'|   |  :  /`./ |  :  /`./ .   ; ,. :|  |   ,'|  :  /`./               "
	puts "          `----.   \\ /    / ' '  | |   |  :  ;_   |  :  ;_   '   | |: :'  :  /  |  :  ;_                   ".colorize(:blue)
	puts "          __ \\  \\  |.    ' /  |  | :    \\  \\    `. \\  \\    `.'   | .; :|  | '    \\  \\    `.         ".colorize(:blue)
	puts "         /  /`--'  /'   ; :__ '  : |__   `----.   \\ `----.   \\   :    |;  : |     `----.   \\             ".colorize(:blue)
	puts "        '--'.     / '   | '.'||  | '.'| /  /`--'  //  /`--'  /\\   \\  / |  , ;    /  /`--'  /              ".colorize(:blue)
	puts "          `--'---'  |   :    :;  :    ;'--'.     /'--'.     /  `----'   ---'    '--'.     /                 ".colorize(:blue)
	puts "                     \\   \\  / |  ,   /   `--'---'   `--'---'                      `--'---'                ".colorize(:blue)
	puts "                      `----'   ---`-'                                                                       ".colorize(:blue)
end

def show_current_bet_rps
	puts "Current Bet: $#{@current_bet_rps}									Your money: $#{@current_player.money}".colorize(:yellow)
end

def show_message_rps
	case @message_code_rps
	when 0
		puts
	when 1
		puts "You don't have enough money to make that bet.".colorize(:magenta)
	when 2
		puts "Bet must be at least $1!".colorize(:magenta)
	when 3
		puts "You must choose option 1, 2, or 3!".colorize(:magenta)
	when 4
		puts "You lost last time, try again and see if your luck has changed!".colorize(:red)
	when 5
		puts "You won the last round, I bet you won't win again!".colorize(:green)
	end
end

def ask_for_bet_rps
	puts "Enter the amount you want to wager or press enter to use the current bet."
	puts "Type 'leave' if you want to walk away."
	bet_amount = gets.strip
	ruby_casino_menu if bet_amount.downcase == 'leave'
	if bet_amount.length == 0
    bet_amount = @current_bet_rps
  else
    bet_amount = bet_amount.to_i
  end
  if bet_amount > @current_player.money
  	@message_code_rps = 1
  	start_rps
  elsif bet_amount < 1
  	@message_code_rps = 2
  	start_rps
  else
  	@message_code_rps = 0
  	@current_bet_rps = bet_amount
  	@current_player.money -= @current_bet_rps
  	ask_player_sign
  end
end

def ask_player_sign
	show_logo_rps
	show_current_bet_rps
	show_message_rps
	puts "Choose which sign you want to throw:"
	puts "1.) Rock"
	puts "2.) Paper"
	puts "3.) Scissors"
	print "Your choice: "
	@player_sign = gets.to_i
	if @player_sign == 42
		#show_universe
	elsif @player_sign < 1 || @player_sign > 3
		@message_code_rps = 3
		ask_player_sign
	else
		@message_code_rps = 0
		@computer_sign = 1 + rand(3)
		animate_fists
	end
end

def animate_fists
	(1..10).each do |i|
		show_logo_rps
		show_current_bet_rps
		show_message_rps
		puts "     YOU:                       DEALER:"
		case i
		when 1
			fists_up
			sleep 0.25
		when 2
			fists_mid
			sleep 0.25
		when 3
			fists_down
			sleep 0.50
		when 4
			fists_mid
			sleep 0.25
		when 5
			fists_up
			sleep 0.25
		when 6
			fists_mid
			sleep 0.25
		when 7
			fists_down
			sleep 0.50
		when 8
			fists_mid
			sleep 0.25
		when 9
			fists_up
			sleep 0.25
		when 10
			fists_mid
			sleep 0.25
			win_lose_image
		end

	end
end

def fists_up
	puts "    _______                    _______     "
	puts "---'   ____)                  (       '--- "
	puts "      (_____)                (_____)       "
	puts "      (_____)                (_____)       "
	puts "      (____)                  (____)       "
	puts "---.__(___)                    (___)__.--- "
	puts
	puts
end

def fists_mid
	puts
	puts "    _______                    _______     "
	puts "---'   ____)                  (       '--- "
	puts "      (_____)                (_____)       "
	puts "      (_____)                (_____)       "
	puts "      (____)                  (____)       "
	puts "---.__(___)                    (___)__.--- "
	puts
end

def fists_down
	puts
	puts
	puts "    _______                    _______     "
	puts "---'   ____)                  (       '--- "
	puts "      (_____)                (_____)       "
	puts "      (_____)                (_____)       "
	puts "      (____)                  (____)       "
	puts "---.__(___)                    (___)__.--- "
end

def win_lose_image
	show_logo_rps
	show_current_bet_rps
	show_message_rps
	puts "     YOU:                       DEALER:"
	if @player_sign == 1 && @computer_sign == 1
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)                  (       '--- "
		puts "      (_____)                (_____)       "
		puts "      (_____)                (_____)       "
		puts "      (____)                  (____)       "
		puts "---.__(___)                    (___)__.--- "
		sleep 1.5
		puts "You threw ROCK and dealer threw ROCK. It's a tie! Here's your money back.".colorize(:light_blue)
		@current_player.money += @current_bet_rps
	end
	if @player_sign == 1 && @computer_sign == 2
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)              ____(____   '--- "
		puts "      (_____)            (______           "
		puts "      (_____)           (_______           "
		puts "      (____)             (______           "
		puts "---.__(___)                (__________.--- "
		sleep 1.5
		puts "You threw ROCK and dealer threw PAPER. You lose!".colorize(:red)
		@message_code_rps = 4
	end
	if @player_sign == 1 && @computer_sign == 3
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)              ____(____   '--- "
		puts "      (_____)            (_______          "
		puts "      (_____)           (________          "
		puts "      (____)                  (____)       "
		puts "---.__(___)                    (___)__.--- "
		sleep 1.5
		puts "You threw ROCK and dealer threw SCISSORS. You win $#{@current_bet_rps * 3}!".colorize(:green)
		@current_player.money += @current_bet_rps * 3
		@message_code_rps = 5
	end
	if @player_sign == 2 && @computer_sign == 1
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____              (       '--- "
		puts "         _______)            (_____)       "
		puts "         ________)           (_____)       "
		puts "         _______)             (____)       "
		puts "---.__________)                (___)__.--- "
		sleep 1.5
		puts "You threw PAPER and dealer threw ROCK. You win $#{@current_bet_rps * 3}!".colorize(:green)
		@current_player.money += @current_bet_rps * 3
		@message_code_rps = 5
	end
	if @player_sign == 2 && @computer_sign == 2
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____          ____(____   '--- "
		puts "         _______)        (______           "
		puts "         ________)      (_______           "
		puts "         _______)        (______           "
		puts "---.__________)            (__________.--- "
		sleep 1.5
		puts "You threw PAPER and dealer threw PAPER. It's a tie! Here's your money back.".colorize(:light_blue)
		@current_player.money += @current_bet_rps
	end
	if @player_sign == 2 && @computer_sign == 3
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____          ____(____   '--- "
		puts "         _______)        (_______          "
		puts "         ________)      (________          "
		puts "         _______)             (____)       "
		puts "---.__________)                (___)__.--- "
		sleep 1.5
		puts "You threw PAPER and dealer threw SCISSORS. You lose!".colorize(:red)
		@message_code_rps = 4
	end
	if @player_sign == 3 && @computer_sign == 1
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____              (       '--- "
		puts "         _______)            (_____)       "
		puts "         ________)           (_____)       "
		puts "     (_____)                  (____)       "
		puts "---.______)                    (___)__.--- "
		sleep 1.5
		puts "You threw SCISSORS and dealer threw ROCK. You lose!".colorize(:red)
		@message_code_rps = 4
	end
	if @player_sign == 3 && @computer_sign == 2
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____          ____(____   '--- "
		puts "         _______)        (______           "
		puts "         ________)      (_______           "
		puts "      (____)             (______           "
		puts "---.______)                (__________.--- "
		sleep 1.5
		puts "You threw SCISSORS and dealer threw PAPER. You win $#{@current_bet_rps * 3}!".colorize(:green)
		@current_player.money += @current_bet_rps * 3
		@message_code_rps = 5
	end
	if @player_sign == 3 && @computer_sign == 3
		puts
		puts
		puts "    _______                    _______     "
		puts "---'   ____)____          ____(____   '--- "
		puts "         _______)        (_______          "
		puts "         ________)      (________          "
		puts "      (____)                  (____)       "
		puts "---.______)                    (___)__.--- "
		sleep 1.5
		puts "You threw SCISSORS and dealer threw SCISSORS. It's a tie! Here's your money back.".colorize(:light_blue)
		@current_player.money += @current_bet_rps
	end
	sleep 5
	start_rps
end



