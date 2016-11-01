
class Cardz
  attr_accessor :rank, :suit, :poker_value
  def initialize(rank, suit, poker_value)
    @rank = rank
    @suit = suit
    @poker_value = poker_value
  end
end


@two_clubs = Cardz.new("2", "Clubs", 1)
@two_diamonds = Cardz.new("2", "Diamonds", 2)
@two_hearts = Cardz.new("2", "Hearts", 3)
@two_spades = Cardz.new("2", "Spades", 4)
@three_clubs = Cardz.new("3", "Clubs", 5)
@three_diamonds = Cardz.new("3", "Diamonds", 6)
@three_hearts = Cardz.new("3", "Hearts", 7)
@three_spades = Cardz.new("3", "Spades", 8)
@four_clubs = Cardz.new("4", "Clubs", 9)
@four_diamonds = Cardz.new("4", "Diamonds", 10)
@four_hearts = Cardz.new("4", "Hearts", 11)
@four_spades = Cardz.new("4", "Spades", 12)
@five_clubs = Cardz.new("5", "Clubs", 13)
@five_diamonds = Cardz.new("5", "Diamonds", 14)
@five_hearts = Cardz.new("5", "Hearts", 15)
@five_spades = Cardz.new("5", "Spades", 16)
@six_clubs = Cardz.new("6", "Clubs", 17)
@six_diamonds = Cardz.new("6", "Diamonds", 18)
@six_hearts = Cardz.new("6", "Hearts", 19)
@six_spades = Cardz.new("6", "Spades", 20)
@seven_clubs = Cardz.new("7", "Clubs", 21)
@seven_diamonds = Cardz.new("7", "Diamonds", 22)
@seven_hearts = Cardz.new("7", "Hearts", 23)
@seven_spades = Cardz.new("7", "Spades", 24)
@eight_clubs = Cardz.new("8", "Clubs", 25)
@eight_diamonds = Cardz.new("8", "Diamonds", 26)
@eight_hearts = Cardz.new("8", "Hearts", 27)
@eight_spades = Cardz.new("8", "Spades", 28)
@nine_clubs = Cardz.new("9", "Clubs", 29)
@nine_diamonds = Cardz.new("9", "Diamonds", 30)
@nine_hearts = Cardz.new("9", "Hearts", 31)
@nine_spades = Cardz.new("9", "Spades", 32)
@ten_clubs = Cardz.new("10", "Clubs", 33)
@ten_diamonds = Cardz.new("10", "Diamonds", 34)
@ten_hearts = Cardz.new("10", "Hearts", 35)
@ten_spades = Cardz.new("10", "Spades", 36)
@jack_clubs = Cardz.new("Jack", "Clubs", 37)
@jack_diamonds = Cardz.new("Jack", "Diamonds", 38)
@jack_hearts = Cardz.new("Jack", "Hearts", 39)
@jack_spades = Cardz.new("Jack", "Spades", 40)
@queen_clubs = Cardz.new("Queen", "Clubs", 41)
@queen_diamonds = Cardz.new("Queen", "Diamonds", 42)
@queen_hearts = Cardz.new("Queen", "Hearts", 43)
@queen_spades = Cardz.new("Queen", "Spades", 44)
@king_clubs = Cardz.new("King", "Clubs", 45)
@king_diamonds = Cardz.new("King", "Diamonds", 46)
@king_hearts = Cardz.new("King", "Hearts", 47)
@king_spades = Cardz.new("King", "Spades", 48)
@ace_clubs = Cardz.new("Ace", "Clubs", 49)
@ace_diamonds = Cardz.new("Ace", "Diamonds", 50)
@ace_hearts = Cardz.new("Ace", "Hearts", 51)
@ace_spades = Cardz.new("Ace", "Spades", 52)

@deck = [
  @two_clubs,
  @two_hearts,
  @two_spades,
  @two_diamonds,
  @three_clubs,
  @three_hearts,
  @three_spades,
  @three_diamonds,
  @four_clubs,
  @four_hearts,
  @four_spades,
  @four_diamonds,
  @five_clubs,
  @five_hearts,
  @five_spades,
  @five_diamonds,
  @six_clubs,
  @six_hearts,
  @six_spades,
  @six_diamonds,
  @seven_clubs,
  @seven_hearts,
  @seven_spades,
  @seven_diamonds,
  @eight_clubs,
  @eight_hearts,
  @eight_spades,
  @eight_diamonds,
  @nine_clubs,
  @nine_hearts,
  @nine_spades,
  @nine_diamonds,
  @ten_clubs,
  @ten_hearts,
  @ten_spades,
  @ten_diamonds,
  @jack_clubs,
  @jack_hearts,
  @jack_spades,
  @jack_diamonds,
  @queen_clubs,
  @queen_hearts,
  @queen_spades,
  @queen_diamonds,
  @king_clubs,
  @king_hearts,
  @king_spades,
  @king_diamonds,
  @ace_clubs,
  @ace_hearts,
  @ace_spades,
  @ace_diamonds

]
