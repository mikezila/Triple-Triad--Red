class Gameboard

	def initialize(window)
		
		@window = window
		
		# Rollin'!
		@roll = Random.new
		
		# Make a new board to put our cells in.		
		@board = Array.new
		
		# Generate the cells for the playing field
		# Field is laid out 0-8 starting in top left
		#
		# 0 1 2
		# 3 4 5
		# 6 7 8
		
		9.times do |i|
			@board.push(Cell.new(@window,i))
		end
		
	end
	
	def to_s
		puts "Dumping playing field data."
		@board.each {|e| e.to_s}
		puts "Done."
	end
	
	def draw
		# self.debug_fill_test
		@board.each {|e| e.draw}
	end
	
	def debug_fill
		@board.each do |e| 
			debugcard = @cards[@roll.rand(@cards.length)]
			e.playCard(Card.new(0,"DebugCard",1,1,1,1,0,0,debugcard))
		end
	end
	
	def debug_fill_test
		@board.each do |e| 
			e.playCard(Card.new(*$Cards[@roll.rand($Cards.length)]))
		end
	end
	
end