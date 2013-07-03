class Card

	attr_reader :n 
	attr_reader :s 
	attr_reader :e 
	attr_reader :w

	attr_reader :element

	attr_reader :art

	def initialize(id=0,name="Nameless",n=1,e=1,s=1,w=1,level=0,element=0,art=nil)
		
		# Card's ID number, mostly flavor
		@id = id
		
		# Card's flavor name
		@name = name
		
		# Card's artwork, should be a Gosu::Image
		@art = art
		
		# Compass direction power values, 1 to 10, with 10 = A
		@n = n
		@e = e
		@s = s
		@w = w
		
		# Element affiliation 0 = none, no others for now.
		# Be carful as this might not be an int, the card db
		# has strings for this field.  Setting it to zero now just in case.
		@element = element
		@element = 0
	end
	
	def randomize
		# Rollin'!
		@roll = Random.new
		
		# Randomize the four power values, and give it a name
		@n = @roll.rand(1..10)
		@s = @roll.rand(1..10)
		@e = @roll.rand(1..10)
		@w = @roll.rand(1..10)
		@name = "Gamber's Card"
		
		# Elements aren't used yet, so keep it 0
		@element = 0
	end
	
	def to_s
		puts "#{@name} N:#{@n} S:#{@s} E:#{@e} W:#{@w} Elem:#{@element}"
	end
	
	def inspect
		@name
	end
	
end