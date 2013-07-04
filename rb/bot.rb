class Bot

	def initialize(window,board,deck)
		@window = window
		@board = board
		@deck = deck
		
		@sfx = Gosu::Sample.new(@window,"./snd/cursor.wav")
		
		@selected_cell = 0
		
		@roll = Random.new
	end
	
	def play
		unless @deck.empty?
			@deck.bot_pick
			self.place
		end
	end

	def place
			while @board.vacancy?
				@selected_cell = @roll.rand(9)
				unless @board.board[@selected_cell].card
					@sfx.play
					@board.board[@selected_cell].play_card(@deck.pick,2)
					break
				end
			end
	end

end