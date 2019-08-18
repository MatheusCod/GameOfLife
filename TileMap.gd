extends TileMap

var cells = [] # Living cells array (Vector2)
var viz # Neighbour counter (Int)
var pot = [] # Potential cells array (Vector2)
var pot_viz = [] # Neighbour counter for the potential cells (Int)
var pot_pos # Neighbour position (Int)

func _ready():
	randomize()
	
	# Glider
	set_cell(23,12,0)
	set_cell(25,12,0)
	set_cell(24,13,0)
	set_cell(25,13,0)
	set_cell(24,14,0)
	
	# Glider Gun
#	set_cell(30,8,0); set_cell(28,9,0); set_cell(30,9,0);
#	set_cell(18,10,0); set_cell(19,10,0); set_cell(26,10,0);
#	set_cell(27,10,0); set_cell(40,10,0); set_cell(41,10,0);
#	set_cell(17,11,0); set_cell(21,11,0); set_cell(26,11,0);
#	set_cell(27,11,0); set_cell(40,11,0); set_cell(6,12,0);
#	set_cell(7,12,0); set_cell(16,12,0); set_cell(22,12,0);
#	set_cell(26,12,0); set_cell(27,12,0); set_cell(6,13,0);
#	set_cell(27,10,0); set_cell(40,10,0); set_cell(41,10,0);
#	set_cell(7,13,0); set_cell(16,13,0); set_cell(20,13,0);
#	set_cell(22,13,0); set_cell(23,13,0); set_cell(28,13,0);
#	set_cell(30,13,0); set_cell(16,14,0); set_cell(22,14,0);
#	set_cell(30,14,0); set_cell(17,15,0); set_cell(21,15,0);
#	set_cell(18,16,0); set_cell(19,16,0); set_cell(41,11,0);
	

func _process(delta):
	cells = get_used_cells()
	
	if(get_parent().get_parent().get_node("Menu").get_node("Status").pressed):
		
		#Speed control
		for i in range(
			3000000,
			get_parent().get_parent().get_node("Menu").get_node("Speed").value,
			-1):
			pass
		
		#Game logic
		for i in range(cells.size()):
			viz = 0
			for j in range(-1,2,1):
				for k in range(-1,2,1):
					if(j != 0 or k != 0):
						if (cells.find(Vector2(cells[i][0] + j ,cells[i][1] + k)) >= 0):
							viz += 1
					
						else:
							pot_pos = pot.find(Vector2(cells[i][0] + j ,cells[i][1] + k))
						
							if(pot_pos >= 0):
								pot_viz[pot_pos] += 1
							else:
								pot.append(Vector2(cells[i][0] + j ,cells[i][1] + k))
								pot_viz.append(1)
						
			#Death of a cell
			if (viz <= 1):
				set_cell(cells[i][0], cells[i][1], -1)
			elif (viz >= 4):
				set_cell(cells[i][0], cells[i][1], -1)
			
#			if (cells[i][0] >= 57 or
#				cells[i][0] <= -10 or
#				cells[i][1] >= 43 or
#				cells[i][1] <= -10):
#					set_cell(cells[i][0], cells[i][1], -1)
	
		#End of living cells analysis 
		cells.clear()
	
		#Birth of a cell
		for i in range(pot.size()):
			if(pot_viz[i] == 3):
				set_cell(pot[i][0], pot[i][1], 0)
	
		#End of potential cells analysis
		pot.clear()
		pot_viz.clear()
