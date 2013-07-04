class Cursor
	
	def initialize(window,board,deck,rival)
		@window = window
		@board = board
		@deck = deck
		@rival = rival
		
		# Load the cursor sprite
		@sprite = Gosu::Image.new(@window,"./tex/cursor.png")
		
		# Load that iconic menu sound
		@sfx = Gosu::Sample.new(@window,"./snd/cursor.wav")
		
		# Start the cursor in the top left cell for now
		@selected_cell = 0
	end
	
	def draw
		@x = @board.board[@selected_cell].x
		@y = @board.board[@selected_cell].y + 60
		@sprite.draw(@x,@y,5,1.5,1.5)
	end
	
	def up
		@sfx.play
		@deck.pick_up
	end
	
	def down
		@sfx.play
		@deck.pick_down
	end
	
	def left
		unless @selected_cell == 0
			@sfx.play
			@selected_cell -= 1
		else
			@sfx.play
			@selected_cell = 8
		end
	end
	
	def place
		unless @board.board[@selected_cell].card
			@sfx.play
			@board.board[@selected_cell].play_card(@deck.pick,1)
			@rival.play
		end
	end
	
	def right
		unless @selected_cell == 8
			@sfx.play
			@selected_cell += 1
		else
			@sfx.play
			@selected_cell = 0
		end
	end
	
	def to_s
		"Cursor at X:#{@x} Y:#{@y}"
	end
	
end