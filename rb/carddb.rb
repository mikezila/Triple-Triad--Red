class CardDB
	
	def initialize(window)
		@window = window
	# Load the card sprite sheet
	@art = Gosu::Image.load_tiles(@window, "./tex/cards.png", 64, 64, false)
	
	# @cards = [[ ID, NAME, UP, RIGHT, DOWN, LEFT, LEVEL, ATTRIBUTE, LOCATION],[],[]]
  $Cards = [[]]
  # LEVEL IS MEASURED ONE LESS THAN ACTUAL LEVEL
  # Level One Monster Cards
  $Cards[0] = [0,"Geezard",1,4,1,5,0,"None",@art[0]]
  $Cards[1] = [1,"Funguar",5,1,1,3,0,"None",@art[1]]
  $Cards[2] = [2,"Bite Bug",1,3,3,5,0,"None",@art[28]]
  $Cards[3] = [3,"Red Bat",6,1,1,2,0,"None",@art[29]]
  $Cards[4] = [4,"Blobra",2,3,1,5,0,"None",@art[56]]
  $Cards[5] = [5,"Gayla",2,1,4,4,0,"Lightning",@art[57]]
  $Cards[6] = [6,"Gesper",1,5,4,1,0,"None",@art[84]]
  $Cards[7] = [7,"Fastitocalon-F",3,5,2,1,0,"Earth",@art[85]]
  $Cards[8] = [8,"Blood Soul",2,1,6,1,0,"None",@art[2]]
  $Cards[9] = [9,"Caterchipillar",4,2,4,3,0,"None",@art[3]]
  $Cards[10] = [10,"Cockatrice",2,1,2,6,0,"Lightning",@art[30]]
  
  # Level Two Monster Cards
  $Cards[11] = [11,"Grat",7,1,3,1,1,"None",@art[31]]
  $Cards[12] = [12,"Buel",6,2,2,3,1,"None",@art[58]]
  $Cards[13] = [13,"Mesmerize",5,3,3,4,1,"None",@art[59]]
  $Cards[14] = [14,"Glacial Eye",6,1,4,3,1,"Ice",@art[86]]
  $Cards[15] = [15,"Belhelmel",3,4,5,3,1,"None",@art[87]]
  $Cards[16] = [16,"Thrustaevis",5,3,2,5,1,"Wind",@art[4]]
  $Cards[17] = [17,"Anacondaur",5,1,3,5,1,"Poison",@art[5]]
  $Cards[18] = [18,"Creeps",5,2,5,2,1,"Lightning",@art[32]]
  $Cards[19] = [19,"Grendel",4,4,5,2,1,"Lightning",@art[33]]
  $Cards[20] = [20,"Jellyeye",3,2,1,7,1,"None",@art[60]]
  $Cards[21] = [21,"Grand Mantis",5,2,5,3,1,"None",@art[64]]
  
  # Level Three Monster Cards
  $Cards[22] = [22,"Forbidden",6,6,3,2,2,"None",@art[88]]
  $Cards[23] = [23,"Armadodo",6,3,1,6,2,"Earth",@art[89]]
  $Cards[24] = [24,"Tri-Face",3,5,5,5,2,"Poison",@art[6]]
  $Cards[25] = [25,"Fastitocalon",7,5,1,3,2,"Earth",@art[7]]
  $Cards[26] = [26,"Snow Lion",7,1,5,3,2,"Ice",@art[34]]
  $Cards[27] = [27,"Ochu",5,6,3,3,2,"None",@art[35]]
  $Cards[28] = [28,"SAM08G",5,6,2,4,2,"Fire",@art[62]]
  $Cards[29] = [29,"Death Claw",4,4,7,2,2,"Fire",@art[63]]
  $Cards[30] = [30,"Cactuar",6,2,6,3,2,"None",@art[90]]
  $Cards[31] = [31,"Tonberry",3,6,4,4,2,"None",@art[91]]
  $Cards[32] = [32,"Abyss Worm",7,2,3,5,2,"Earth",@art[8]]
  
  # Level Four Monster Cards
  $Cards[33] = [33,"Turtapod",2,3,6,7,3,"None",@art[9]]
  $Cards[34] = [34,"Vysage",6,5,4,5,3,"None",@art[36]]
  $Cards[35] = [35,"T-Rexaur",4,2,6,7,3,"None",@art[37]]
  $Cards[36] = [36,"Bomb",2,7,6,3,3,"Fire",@art[64]]
  $Cards[37] = [37,"Blitz",1,6,4,7,3,"Lightning",@art[65]]
  $Cards[38] = [38,"Wendigo",7,3,1,6,3,"None",@art[92]]
  $Cards[39] = [39,"Torama",7,4,4,4,3,"None",@art[93]]
  $Cards[40] = [40,"Imp",3,7,3,6,3,"None",@art[10]]
  $Cards[41] = [41,"Blue Dragon",6,2,7,3,3,"Poison",@art[11]]
  $Cards[42] = [42,"Adamantoise",4,5,5,6,3,"Earth",@art[38]]
  $Cards[43] = [43,"Hexadragon",7,5,4,3,3,"Fire",@art[39]]
  
  # Level Five Monster Cards
  $Cards[44] = [44,"Iron Giant",6,5,6,5,4,"None",@art[66]]
  $Cards[45] = [45,"Behemoth",3,6,5,7,4,"None",@art[67]]
  $Cards[46] = [46,"Chimera",7,6,5,3,4,"Water",@art[93]]
  $Cards[47] = [47,"Pupu",3,10,2,1,4,"None",@art[94]]
  $Cards[48] = [48,"Elastoid",6,2,6,7,4,"None",@art[12]]
  $Cards[49] = [49,"GIM47N",5,5,7,4,4,"None",@art[13]]
  $Cards[50] = [50,"Malboro",7,7,4,2,4,"Poison",@art[40]]
  $Cards[51] = [51,"Ruby Dragon",7,2,7,4,4,"Fire",@art[41]]
  $Cards[52] = [52,"Elnoyle",5,3,2,6,4,"None",@art[68]]
  $Cards[53] = [53,"Tonberry King",4,6,7,4,4,"None",@art[69]]
  $Cards[54] = [54,"Wedge, Biggs",6,6,2,7,4,"None",@art[96]]
  
  # Level Six Boss Cards
  $Cards[55] = [55,"Fujin, Raijin",2,8,8,4,5,"None",@art[97]]
  $Cards[56] = [56,"Elvoret",7,8,3,4,5,"Wind",@art[14]]
  $Cards[57] = [57,"X-ATM092",4,8,7,3,5,"None",@art[15]]
  $Cards[58] = [58,"Granaldo",7,2,8,5,5,"None",@art[42]]
  $Cards[59] = [59,"Gerogero",1,8,6,3,5,"Poison",@art[43]]
  $Cards[60] = [60,"Iguion",8,2,8,2,5,"None",@art[70]]
  $Cards[61] = [61,"Abadon",6,8,4,5,5,"None",@art[71]]
  $Cards[62] = [62,"Trauma",4,8,5,6,5,"None",@art[98]]
  $Cards[63] = [63,"Oilboyle",1,8,4,8,5,"None",@art[99]]
  $Cards[64] = [64,"Shumi Tribe",6,5,8,4,5,"None",@art[16]]
  $Cards[65] = [65,"Krysta",7,5,8,1,5,"None",@art[17]]
  
  # Level Seven Boss Cards
  $Cards[66] = [66,"Propagator",8,4,4,8,6,"None",@art[44]]
  $Cards[67] = [67,"Jumbo Cactuar",8,8,4,4,6,"None",@art[45]]
  $Cards[68] = [68,"Tri-Point",8,5,2,8,6,"Lightning",@art[72]]
  $Cards[69] = [69,"Gargantua",5,6,6,8,6,"None",@art[73]]
  $Cards[70] = [70,"Mobile Type 8",8,6,7,3,6,"None",@art[100]]
  $Cards[71] = [71,"Sphinxara",8,3,5,8,6,"None",@art[101]]
  $Cards[72] = [72,"Tiamat",8,8,5,4,6,"None",@art[18]]
  $Cards[73] = [73,"BGH251F2",5,7,8,5,6,"None",@art[19]]
  $Cards[74] = [74,"Red Giant",6,8,4,7,6,"None",@art[46]]
  $Cards[75] = [75,"Catoblepas",1,8,7,7,6,"None",@art[47]]
  $Cards[76] = [76,"Ultima Weapon",7,7,2,8,6,"None",@art[74]]
  
  # Level Eight GF Cards
  $Cards[77] = [77,"Chubby Chocobo",4,4,8,9,7,"None",@art[75]]
  $Cards[78] = [78,"Angelo",9,6,7,3,7,"None",@art[102]]
  $Cards[79] = [79,"Gilgamesh",3,7,9,6,7,"None",@art[103]]
  $Cards[80] = [80,"Minimog",9,3,9,2,7,"None",@art[20]]
  $Cards[81] = [81,"Chicobo",9,4,8,4,7,"None",@art[21]]
  $Cards[82] = [82,"Quezacotl",2,9,9,4,7,"Lightning",@art[48]]
  $Cards[83] = [83,"Shiva",6,7,5,9,7,"Ice",@art[49]]
  $Cards[84] = [84,"Ifrit",9,6,2,8,7,"Fire",@art[76]]
  $Cards[85] = [85,"Siren",8,9,6,2,7,"None",@art[77]]
  $Cards[86] = [86,"Sacred",5,1,9,9,7,"Earth",@art[104]]
  $Cards[87] = [87,"Minotaur",9,5,2,9,7,"Earth",@art[105]]
  
  # Level Nine GF Cards
  $Cards[88] = [88,"Carbuncle",8,4,10,4,8,"None",@art[22]]
  $Cards[89] = [89,"Diablos",5,10,8,3,8,"None",@art[23]]
  $Cards[90] = [90,"Leviathan",7,10,1,7,8,"Water",@art[50]]
  $Cards[91] = [91,"Odin",8,10,3,5,8,"None",@art[51]]
  $Cards[92] = [92,"Pandemona",10,1,7,7,8,"Wind",@art[75]]
  $Cards[93] = [93,"Cerberus",7,4,6,10,8,"None",@art[79]]
  $Cards[94] = [94,"Alexander",9,10,4,2,8,"Holy",@art[106]]
  $Cards[95] = [95,"Phoenix",7,2,7,10,8,"Fire",@art[107]]
  $Cards[96] = [96,"Bahamut",10,8,2,6,8,"None",@art[24]]
  $Cards[97] = [97,"Doomtrain",3,1,10,10,8,"Poison",@art[25]]
  $Cards[98] = [98,"Eden",4,4,9,10,8,"None",@art[52]]
  
  # Level Ten Player Cards
  $Cards[99] = [99,"Ward",10,7,2,8,9,"None",@art[53]]
  $Cards[100] = [100,"Kiros",6,7,6,10,9,"None",@art[80]]
  $Cards[101] = [101,"Laguna",5,10,3,9,9,"None",@art[81]]
  $Cards[102] = [102,"Selphie",10,8,6,4,9,"None",@art[108]]
  $Cards[103] = [103,"Quistis",9,6,10,2,9,"None",@art[109]]
  $Cards[104] = [104,"Irvine",2,6,9,10,9,"None",@art[26]]
  $Cards[105] = [105,"Zell",8,5,10,6,9,"None",@art[27]]
  $Cards[106] = [106,"Rinoa",4,10,2,10,9,"None",@art[54]]
  $Cards[107] = [107,"Edea",10,10,3,3,9,"None",@art[55]]
  $Cards[108] = [108,"Seifer",6,9,10,4,9,"None",@art[82]]
  $Cards[109] = [109,"Squall",10,4,6,9,9,"None",@art[83]]
	
	# A card for debugging, uses cardback art and all 10s
	$Cards[110] = [110,"DebugCard",10,10,10,10,9,"None",@art[110]]
	end
end