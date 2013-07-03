class Cursor
	
	def initialize(window)
		@window = window
		@x = 60
		@y = 60
		
		# Load the cursor sprite
		@sprite = Gosu::Image.new(@window,"./tex/cursor.png")
		
		# Load that iconic menu sound
		@sfx = Gosu::Sample.new(@window,"./snd/cursor.wav")
	end
	
	def draw
		@sprite.draw(@x,@y,3,1.5,1.5)
	end
	
	def up
		@sfx.play
		@y -= 65
	end
	
	def down
		@sfx.play
		@y += 65
	end
	
	def left
		@sfx.play
		@x -= 65
	end
	
	def right
		@sfx.play
		@x += 65
	end
	
	def to_s
		"Cursor at X:#{@x} Y:#{@y}"
	end
	
end