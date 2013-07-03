# CardTool v1.0
#
# This was just a tool to help me see the tile values of the cards.
# I needed to set the art variables in the card database, and this helped
# me translate the values gosu gets when it slices up the sprite sheet
# to the numberical order of the cards from the real game.
# I wrote it in like three minutes and used it for all of ten,
# but here it is.
#

require 'gosu'

class Viewport < Gosu::Window
	
	def initialize
		super 1792, 256, false
		@cards = Gosu::Image.new(self,"cards.png")
		@font = Gosu::Font.new(self,"Arial",20)
		self.caption = "Card Tool"
	end
	
	def draw
		@cards.draw(0,0,1)
		
		x=20
		y=20
		
		111.times do |i|
			@font.draw("#{i}",x,y,2)
			x += 64
			if x > @cards.width
				x = 20
				y += 64
			end
		end
	end
	
	def update
	end
	
end

tool = Viewport.new
tool.show