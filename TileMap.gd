extends TileMap

var cells = []
var viz
var pot = []
var pot_viz = []
var pot_pos

func _ready():
	randomize()
	set_cell(4,3,0)
	set_cell(4,4,0)
	set_cell(5,4,0)
	set_cell(5,5,0)
	set_cell(4,6,0)
	set_cell(5,6,0)
	set_cell(4,7,0)
	
	set_cell(10,10,0)
	set_cell(12,10,0)
	set_cell(11,11,0)
	set_cell(12,11,0)
	set_cell(11,12,0)

func _process(delta):
	cells = get_used_cells()
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
						
		if (viz <= 1):
			set_cell(cells[i][0], cells[i][1], -1)
		elif (viz >= 4):
			set_cell(cells[i][0], cells[i][1], -1)
	
	cells.clear()
	
	for i in range(pot.size()):
		if(pot_viz[i] == 3):
			set_cell(pot[i][0], pot[i][1], 0)
	
	pot.clear()
	pot_viz.clear()
