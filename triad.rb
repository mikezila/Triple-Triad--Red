###
### Triple Triad: Red
### 
#
# Version: 0.1 - 2013-07-03
#
# Red, like Ruby.  Get it?
#
# This is the cardgame from Final Fantasy VIII made using
# Ruby and the Gosu library.  It is being written mostly to
# be a project that I am capable of finishing, and so I can
# learn along the way.
#
# I don't use any platform specific or troublesome gems, so this
# should work exactly the same on Windows, MacOS X, and Linux.
# It was developed on a combination of all three, and was tested
# on them all.
#
# I tried to leave a lot of comments, mostly for my own benefit,
# but hey, don't say I never gave you anything.
#

# Require our gems
# Requiring 'rubygems' is only needed on Rubies
# 1.8.* and older I think, but it does no harm.
require 'rubygems'
require 'gosu'

# Require the rest of our Ruby sources
require './rb/card.rb'
require './rb/board.rb'
require './rb/deck.rb'
require './rb/cell.rb'
require './rb/cursor.rb'

# Require the file with the card data
require './rb/carddb.rb'

class GameWindow < Gosu::Window

	def initialize
		super 800, 500, false
		
		self.caption = "Triple Triad: Red"
		
		# Load that lovely background
		@background = Gosu::Image.new(self, "./tex/bg.png")
		
		# And the lovely background music
		# Track - Song
		# 0 - Shuffle or Boogie (Triple Triad BGM)
		# 1 - Quadmist (Tetra Master BGM)
		@music = Array.new
		@music.push(Gosu::Song.new(self,"./snd/bg.mp3"))
		@music.push(Gosu::Song.new(self,"./snd/bg2.mp3"))
		@music_track = 0
		@music_enabled = true
		
		# Set the music to be half-volume, it is background after all
		@music.each do |e|
			e.volume = 0.5
		end
		
		# Setup font for GUI and debug displays
		@font = Gosu::Font.new(self,"Arial",14)
		
		# Setup the carddb
		# This is an ugly, empty class with a giant global array
		# for the moment.  Might use a Marshal blob or YAML later
		# but for now the quick and dirty will suffice
		# This isn't exactly enterprise level
		@cardDB = CardDB.new(self)
		
		# Make some game objects
		# The board that holds our gameplay area
		@board = Gameboard.new(self)
		
		# A couple decks for the players to use
		deck_size = 5
		@deck1 = Deck.new(self,1,deck_size)
		@deck2 = Deck.new(self,2,deck_size)
		
		# Create the cursor
		@cursor = Cursor.new(self,@board,@deck1)
		
		@game_state = true
		@menu_state = false
		
		@deck1.to_s
		@deck2.to_s
	end

	# Don't hide the user's mouse, because that is
	# the most annoying fucking sin any program can
	# commit.  I will not have it.
	def needs_cursor?
		true
	end

  def update		
		@fps = Gosu::fps
  end
	
	# Keyboard controls, self explanatory
  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
    if id == Gosu::KbUp
      @cursor.up
    end
    if id == Gosu::KbDown
      @cursor.down
    end
    if id == Gosu::KbLeft
      @cursor.left
    end
    if id == Gosu::KbRight
      @cursor.right
    end
		if id == Gosu::KbW
			@board.debug_fill
		end
		if id == Gosu::KbC
			@board.debug_clear
		end
		if id == Gosu::KbO
			@deck1.randomize
		end
		if id == Gosu::KbSpace
			@cursor.place
		end
		if id == Gosu::KbP
			@deck2.randomize
		end
		if id == Gosu::KbE
			puts @deck1.to_s
			puts @deck2.to_s
			puts @board.to_s
		end
		if id == Gosu::KbQ
			# This seems ugly
			@game_state = !@game_state
			@menu_state = !@menu_state
		end
		if id == Gosu::KbN
			@music_enabled = !@music_enabled
		end
		if id == Gosu::KbM
			@music[@music_track].stop
			@music_track += 1
			if @music_track == @music.length
				@music_track = 0
			end
		end
  end
	
	def draw
		
		if @music_enabled
			@music[@music_track].play(true)
		else
			@music[@music_track].stop
		end
		
		# This seems like a bad way to do game state
		# management.  Will have to look into something
		# better.  Maybe Chingu sometime down the road.
		if @game_state
			@background.draw(150,0,1)
			@font.draw("FPS: #{@fps}", 160,10,2)
			@font.draw("Game Board", 160,26,2)
			@board.draw
			@deck1.draw
			@deck2.draw
			@cursor.draw
		elsif @menu_state
			@font.draw("FPS: #{@fps}", 160,10,2)
			@font.draw("Menu that doesn't exist yet", 160,26,2)
		end
	end

end

game = GameWindow.new
game.show
