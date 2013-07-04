class Cell
	
	attr_reader :x
	attr_reader :y
	
	attr_reader :card
	
	def initialize(window,location,board)
		@window = window
		@board = board
		@location = location
		@card = nil
		@player = 0
		
		# Create our font for drawing our NSEW card power
		@font = Gosu::Font.new(@window,"Arial",20)
		
		# Calculate the position for drawing the card
		self.locate
		
		@redback = Gosu::Image.new(window,"./tex/red.png")
		@blueback = Gosu::Image.new(window,"./tex/blue.png")
	end
	
	def clear
		@card = nil
		@owner = 0
	end
	
	def play_card(card,player)
		@card = card
		self.take(player)
		
		case @location
			
		when 0
			if @board.board[1].card
				if @card.e > @board.board[1].card.w
					@board.board[1].take(player)
				end
			end
			if @board.board[3].card
				if @card.s > @board.board[3].card.n
					@board.board[3].take(player)
				end
			end
			
		when 1
			if @board.board[0].card
				if @card.w > @board.board[0].card.e
					@board.board[0].take(player)
				end
			end
			if @board.board[2].card
				if @card.e > @board.board[2].card.w
					@board.board[2].take(player)
				end
			end
			if @board.board[4].card
				if @card.s > @board.board[4].card.n
					@board.board[4].take(player)
				end
			end
			
		when 2
			if @board.board[1].card
				if @card.w > @board.board[1].card.e
					@board.board[1].take(player)
				end
			end
			if @board.board[5].card
				if @card.s > @board.board[5].card.n
					@board.board[5].take(player)
				end
			end
			
		when 3
			if @board.board[0].card
				if @card.n > @board.board[0].card.s
					@board.board[0].take(player)
				end
			end
			if @board.board[4].card
				if @card.e > @board.board[4].card.w
					@board.board[4].take(player)
				end
			end
			if @board.board[6].card
				if @card.s > @board.board[6].card.n
					@board.board[6].take(player)
				end
			end
			
		when 4
			if @board.board[1].card
				if @card.n > @board.board[1].card.s
					@board.board[1].take(player)
				end
			end
			if @board.board[3].card
				if @card.w > @board.board[3].card.e
					@board.board[3].take(player)
				end
			end
			if @board.board[5].card
				if @card.e > @board.board[5].card.w
					@board.board[5].take(player)
				end
			end
			if @board.board[7].card
				if @card.s > @board.board[7].card.n
					@board.board[7].take(player)
				end
			end
			
		when 5
			if @board.board[2].card
				if @card.n > @board.board[2].card.s
					@board.board[2].take(player)
				end
			end
			if @board.board[4].card
				if @card.w > @board.board[4].card.e
					@board.board[4].take(player)
				end
			end
			if @board.board[8].card
				if @card.s > @board.board[8].card.n
					@board.board[8].take(player)
				end
			end
			
		when 6
			if @board.board[3].card
				if @card.n > @board.board[3].card.s
					@board.board[3].take(player)
				end
			end
			if @board.board[7].card
				if @card.e > @board.board[7].card.w
					@board.board[7].take(player)
				end
			end
			
		when 7
			if @board.board[4].card
				if @card.n > @board.board[4].card.s
					@board.board[4].take(player)
				end
			end
			if @board.board[6].card
				if @card.w > @board.board[6].card.e
					@board.board[6].take(player)
				end
			end
			if @board.board[8].card
				if @card.e > @board.board[8].card.w
					@board.board[8].take(player)
				end
			end
			
		when 8
			if @board.board[5].card
				if @card.n > @board.board[5].card.s
					@board.board[5].take(player)
				end
			end
			if @board.board[7].card
				if @card.w > @board.board[7].card.e
					@board.board[7].take(player)
				end
			end
			
		end
		
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
			
			if @owner == 1
				background = @blueback
			else @owner == 2
				background = @redback
			end
			
			background.draw(@x,@y,2,@xscale,@yscale)
			@card.art.draw(@x,@y,2,@xscale,@yscale)
			@font.draw("#{@card.n}",@x+17,@y+12,3)
			@font.draw("#{@card.s}",@x+17,@y+27,3)
			@font.draw("#{@card.e}",@x+27,@y+18,3)
			@font.draw("#{@card.w}",@x+9,@y+18,3)
		end
	end
	
	def take(player)
		# Player 1 is on the left, 2 on the right
		# this is switched from the original game
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
		if @card
			puts "Cell: #{@location} Card: #{@card.inspect} NSEW:#{@card.n}#{@card.s}#{@card.e}#{@card.w} Player: #{self.owner}"
		end
	end
	
end