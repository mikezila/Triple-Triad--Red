class Cell
	def initialize(window,location)
		@window = window
		@location = location
		@card = nil
		@player = 0
		
		# Create our font for drawing our NSEW card power
		@font = Gosu::Font.new(@window,"Arial",20)
		
		# Calculate the position for drawing the card
		self.locate
	end
	
	def playCard(card)
		@card = card
	end
	
	def locate
		
		# This is clever and also not clever way to decide where
		# to draw the cells card, using the location we're given
		# when we're created by the game board.
		
		@xscale = 1.75
		@yscale = 2.17
		
		anchorx = 232
		anchory = 42
		offsetx = 66
		offsety = 66
		
		case @location
		when 0
			@x = anchorx
			@y = anchory
		when 1
			@x = anchorx + offsetx * @xscale
			@y = anchory
		when 2
			@x = anchorx + offsetx * 2 * @xscale
			@y = anchory
		when 3
			@x = anchorx
			@y = anchory + offsety * @yscale
		when 4
			@x = anchorx + offsetx * @xscale
			@y = anchory + offsety * @yscale
		when 5
			@x = anchorx + offsetx * 2 * @xscale
			@y = anchory + offsety * @yscale
		when 6
			@x = anchorx
			@y = anchory + offsety * 2 * @yscale
		when 7
			@x = anchorx + offsetx * @xscale
			@y = anchory + offsety * 2 * @yscale
		when 8
			@x = anchorx + offsetx * 2 * @xscale
			@y = anchory + offsety * 2 * @yscale
		end
	end
	
	def draw
		unless @card == nil		
			@card.art.draw(@x,@y,2,@xscale,@yscale)
			@font.draw("#{@card.n}",@x+17,@y+12,3)
			@font.draw("#{@card.s}",@x+17,@y+27,3)
			@font.draw("#{@card.e}",@x+27,@y+18,3)
			@font.draw("#{@card.w}",@x+9,@y+18,3)
		end
	end
	
	def take(player)
		# Player 1 is on the right, 2 on the left
		@owner = player
	end
	
	def owner
		# Player 1 is on the right, 2 on the left
		# An unplayed cell is owned by Player 0
		if @player == 0
			"Unowned"
		elsif @player == 1
			"Player 1"
		elsif @player == 2
			"Player 2"
		else
			"Unknown Player"
		end
	end 
	
	def to_s
		puts "Cell: #{@location} Card: #{@card.inspect} NSEW:#{@card.n}#{@card.s}#{@card.e}#{@card.w} Player: #{self.owner}"
	end
	
end