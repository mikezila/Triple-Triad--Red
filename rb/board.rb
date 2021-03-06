class Gameboard

	attr_reader :board

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
			@board.push(Cell.new(@window,i,self))
		end
		
	end
	
	def to_s
		puts "Dumping playing field data."
		@board.each {|e| e.to_s}
		puts "Done."
	end
	
	def played(player)
		if player == 1
			@bot.play
		end
	end
	
	def draw
		@board.each {|e| e.draw}
	end
	
	def vacancy?
		space = false
		@board.each do |e|
			unless e.card
				space = true
			end
		end
		return space
	end
	
	def debug_fill
		@board.each do |e| 
			e.play_card(Card.new(*$Cards[@roll.rand($Cards.length)]))
			e.take(0)
		end
	end
	
	def debug_clear
		@board.each do |e|
			e.clear
		end
	end
	
end