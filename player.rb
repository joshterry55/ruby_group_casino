
class Person
  attr_accessor :name, :age, :from, :money
  def initialize
    puts `clear`
    puts "Welcome! Lets get started!"
    puts "What is your name?"
    @name = gets.strip
    puts `clear`
    puts "How old are you?"
    @age = gets.strip.to_i
    puts `clear`
    puts "Where are you from?"
    @from = gets.strip
    puts `clear`
    puts "How much money did you bring today? (100, 23, 250 etc.)"
    answer = gets.strip.to_i
    if answer > 1000
      puts "\nWhoa! Thats a lot of money!"
      puts "Only bring in up to $1000 at a time for security reasons."
      sleep 5
      @money = 1000
    else
      @money = answer
    end
  end
end
