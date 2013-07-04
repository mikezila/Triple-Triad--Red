class Deck
	
	attr_reader :deck
	
	def initialize(window,player,size)
		@window = window
		@player = player
		@size = size
		
		@roll = Random.new
		
		@font = Gosu::Font.new(@window,"Arial",20)
		
		if @player == 1
			@background = Gosu::Image.new(window,"./tex/blue.png")
		else
			@background = Gosu::Image.new(window,"./tex/red.png")
		end
		
		@picked = 0
		
		@deck = Array.new
		self.randomize
	end
	
	def randomize
		@deck.clear
		@size.times do	
			@deck.push(Card.new(*$Cards[@roll.rand($Cards.length)]))
		end
		@picked = 0
	end
	
	# pick_up and _down are transposed because the decks are
	# rendered from top to bottom, with [0] being at the top
	# so moving your pick down on the screen is really moving
	# it up in the array of cards.
	def pick_down
		unless @picked == @deck.length - 1
			@picked += 1
		else
			@picked = 0
		end
	end
	
	def pick_up
		unless @picked == 0
			@picked -= 1
		else
			@picked = @deck.length - 1
		end
	end
	
	def bot_pick
		unless @deck.length == 0
			@picked = @roll.rand(@deck.length)
		end
	end
	
	def empty?
		if @deck.length == 0
			return true
		else
			return false
		end
	end
	
	def picked
		@picked
	end
	
	def pick
		unless @deck.length == 0
			chosen = @deck[@picked]
			@deck[@picked] = nil
			@deck.compact!
			@picked = 0
			return chosen
		end
	end
	
	def draw
		
		# Scale for the card art
		@xscale = 1.75
		@yscale = 2.17
		
		# Anchor points for the deck's top card
		@xanchor = 30
		@yanchor = 10
		
		# Move the anchor point if this is player 2's deck
		if @player == 2
			@xanchor += 630
		end
		
		# Distance to slide each card in the stack down
		offset = 85
		
		# Starting Z depth for the "bottom" card
		# that the others appear to be stacked on
		zdepth = 3
		x = @xanchor
		y = @yanchor
		
		# The distance to push the selected card away from the others
		
		if @player == 1
			push = 20
		elsif @player == 2
			push = -20
		end
		
		i = 0
		
		@deck.each do |e|
			if i == @picked then x = x + push end
			@background.draw(x,y,zdepth,@xscale,@yscale)
			e.art.draw(x,y,zdepth,@xscale,@yscale)
			@font.draw("#{e.n}",x+17,y+12,zdepth)
			@font.draw("#{e.s}",x+17,y+27,zdepth)
			@font.draw("#{e.e}",x+27,y+18,zdepth)
			@font.draw("#{e.w}",x+9,y+18,zdepth)
			zdepth += 0.1
			if i == @picked then x = x - push end
			y += offset
			i += 1
		end
		
	end
	
	def to_s
		puts "\nDumping deck data:"
		puts "Deck has #{@deck.length} cards. Belongs to player #{@player}."
		@deck.each {|e| e.to_s}
		puts "Deck dumped\n"
	end
	
end