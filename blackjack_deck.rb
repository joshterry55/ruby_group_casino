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
