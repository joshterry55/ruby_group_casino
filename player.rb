
class Person
  attr_accessor :name, :age, :from, :money
  def initialize
    puts "Welcome! Lets get started!"
    puts "What is your name?"
    @name = gets.strip
    puts "How old are you?"
    @age = gets.strip.to_i
    puts "Where are you from?"
    @from = gets.strip
    puts "How much money did you bring today? (100, 23, 250 etc.)"
    answer = gets.strip.to_i
    if answer > 1000
      puts "\nWhoa! Thats a lot of money!"
      puts "Only bring in up to $1000 at a time for security reasons."
      @money = 1000
    else
      @money = answer
    end
  end
end
