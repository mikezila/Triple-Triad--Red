class Deck
	
	def initialize(size)
		@size = size
		@deck = Array.new
		
		@size.times do	
			@deck.push(Card.new)
		end
	end
	
	def to_s
		puts "Dumping card data:"
		puts "Deck has #{@deck.length} cards."
		@deck.each {|e| e.to_s}
		puts "Deck dumped"
	end
	
end