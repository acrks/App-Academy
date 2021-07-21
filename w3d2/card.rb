class Card
    attr_reader :char
    def initialize(char)
        @char = char
        @state = " "
    end

    def reveal
        @state = @char
    end

    def to_s
        @state
    end

    def ==(alt_card)
        @char == alt_card.char
    end

    def hide
        @state = " "
    end
end

if __FILE__ == $PROGRAM_NAME
    alphabet = ("A"..."Z").map{|a| a}.shuffle
    cards = 3.times.map{Card.new(alphabet.pop)}


    cards.each do |el|
        puts "Initialized Card: #{el.inspect}"
        el.reveal
        puts "Revealed Card: #{el}"
        el.hide
        puts "Hidden Card: #{el}"
        puts "\n\n"
    end

    cards.combination(2) do |comb|
        card_1, card_2 = comb
        same_card = Card.new(card_1.char)
        puts "card('#{card_1.char}') == card('#{card_2.char}'): #{card_1 == card_2}"
        puts "card('#{card_1.char}') == card('#{same_card.char}'): #{card_1 == same_card}"
    end
end