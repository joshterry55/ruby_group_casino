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
	puts
end

def show_current_bet_rps
	puts "Current Bet: $#{@current_bet_rps}									Your money: $#{@current_player.money}".colorize(:yellow)
  puts
end

def show_message_rps
	puts
	case @message_code_rps
	when 0
		puts
	when 1
		puts "You don't have enough money to make that bet.".colorize(:magenta)
	when 2
		puts "Bet must be at least $1!".colorize(:magenta)
	when 3
		puts "You must choose option 1, 2, or 3!".colorize(:magenta)
	end
	puts
end

def ask_for_bet_rps
	puts "Welcome to Rock, Paper, Scissors!"
	puts "Enter the amount you want to wager,"
	puts "just press enter to use the current bet,"
	puts "or type 'leave' to walk away."
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
	end
end






