extends TileMap

var cells = []
var viz
var x
var y

func _ready():
	randomize()
	set_cell(4,3,0)
	set_cell(4,4,0)
	set_cell(5,4,0)
	set_cell(5,5,0)
	set_cell(4,6,0)
	set_cell(5,6,0)
	set_cell(4,7,0)

func _process(delta):
	cells = get_used_cells()
	for i in range(cells.size()):
		viz = 0
		for j in range(-1,2,1):
			for k in range(-1,2,1):
				if( (j != 0 or k != 0) and 
				cells.find(Vector2(cells[i][0] + j ,cells[i][1] + k)) >= 0):
					viz += 1
		if (viz <= 1):
			set_cell(cells[i][0], cells[i][1], -1)
		elif (viz >= 4):
			set_cell(cells[i][0], cells[i][1], -1)
	cells.clear()
