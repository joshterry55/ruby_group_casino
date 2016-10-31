require 'pry'
require 'colorize'

class Casino
	def initialize
		puts "Welcome to the Ruby CASINO!".colorize(:green)
		@player = Player.new
		menu()
	end

	def menu
		# TODO: menu goes here
	end
end

Casino.new