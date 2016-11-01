@player_sign = 0
@computer_sign = 0
@current_bet_rps = 5
@message_code_rps = 0

def start_rps
	show_logo_rps
	show_current_bet_rps
	ask_for_bet_rps
end

def show_logo_rps
	puts `clear`
	puts "                                                    ,-.----.                                                "
	puts ",-.----.                            ,-.             \\    /  \\                                             "
	puts "\\    /  \\                       ,--/ /|             |   :    \\            ,-.----.                       "
	puts ";   :    \\   ,---.            ,--. :/ |             |   |  .\\ :           \\    /  \\             __  ,-. "
	puts "|   | .\\ :  '   ,'\\           :  : ' /              .   :  |: |           |   :    |          ,' ,'/ /|   "
	puts ".   : |: | /   /   |   ,---.  |  '  /               |   |   \\ : ,--.--.   |   | .\\ :   ,---.  '  | |' |   "
	puts "|   |  \\ :.   ; ,. :  /     \\ '  |  :               |   : .   //       \\  .   : |: |  /     \\ |  |   ,' "
	puts "|   : .  /'   | |: : /    / ' |  |   \\              ;   | |`-'.--.  .-. | |   |  \\ : /    /  |'  :  /     "
	puts ";   | |  \\'   | .; :.    ' /  '  : |. \\             |   | ;    \\__\\/: . . |   : .  |.    ' / ||  | '    "
	puts "|   | ;\\  \\   :    |'   ; :__ |  | ' \\ \\            :   ' |    ,\" .--.; | :     |`-''   ;   /|;  : |   "
	puts ":   ' | \\.'\\   \\  / '   | '.'|'  : |--'___          :   : :   /  /  ,.  | :   : :   '   |  / ||  , ;     "
	puts ":   : :-'   `----'  |   :    :;  |,'  /  .\\         |   | :  ;  :   .'   \\|   | :   |   :    | ---'       "
	puts "|   |.'   .--.--.    \\   \\  / '--'    \\_ ; |        `---'.|  |  ,     .-./`---'.|    \\   \\  /          "
	puts "`---'    /  /    '.   `----'    ,--,  /  ,\"           `---`   `--`---'      `---`     `----'               "
	puts "        |  :  /`. /           ,--.'| '--'                       ,---.    __  ,-.                            "
	puts "        ;  |  |--`            |  |,      .--.--.    .--.--.    '   ,'\\ ,' ,'/ /|  .--.--.                  "
	puts "        |  :  ;_       ,---.  `--'_     /  /    '  /  /    '  /   /   |'  | |' | /  /    '                  "
	puts "         \\  \\    `.   /     \\ ,' ,'|   |  :  /`./ |  :  /`./ .   ; ,. :|  |   ,'|  :  /`./               "
	puts "          `----.   \\ /    / ' '  | |   |  :  ;_   |  :  ;_   '   | |: :'  :  /  |  :  ;_                   "
	puts "          __ \\  \\  |.    ' /  |  | :    \\  \\    `. \\  \\    `.'   | .; :|  | '    \\  \\    `.         "   
	puts "         /  /`--'  /'   ; :__ '  : |__   `----.   \\ `----.   \\   :    |;  : |     `----.   \\             "
	puts "        '--'.     / '   | '.'||  | '.'| /  /`--'  //  /`--'  /\\   \\  / |  , ;    /  /`--'  /              "
	puts "          `--'---'  |   :    :;  :    ;'--'.     /'--'.     /  `----'   ---'    '--'.     /                 "
	puts "                     \\   \\  / |  ,   /   `--'---'   `--'---'                      `--'---'                "
	puts "                      `----'   ---`-'                                                                       "
	puts
end

def show_current_bet_rps
	puts "Current Bet: $#{@current_bet_rps}                          Your money: $#{@current_player.money}".colorize(:yellow)
  puts
end

def message_rps
	puts
	case @message_code_rps
	when 0
		puts
	end
	puts
end

def ask_for_bet_rps
	puts "Welcome to Rock, Paper, Scissors!"
	puts "Enter the amount you want to wager,"
	puts "or type 'leave' to walk away."
	bet_amount = gets.strip
end