extends TileMap

var cells = []
var viz
var x
var y

func _ready():
	randomize()
	set_cell(5,5,0)
	set_cell(4,4,0)
	set_cell(5,4,0)
	set_cell(6,3,0)
	set_cell(6,4,0)
	set_cell(6,5,0)
	set_cell(7,4,0)

func _process(delta):
	cells = get_used_cells()
	for i in range(cells.size()):
		viz = 0
		for j in range(-1,2,1):
			for k in range(-1,2,1):
				if((j != 0 and k != 0) and 
				get_cell(cells[i][0] + j, cells[i][1] + k) == 0):
					viz += 1
#		if (get_cell(cells[i][0] - 1, cells[i][1] - 1) == 0):
#			viz += 1
#			#print("a")
#		if (get_cell(cells[i][0], cells[i][1] - 1) == 0):
#			viz += 1
#			#print("b")
#		if (get_cell(cells[i][0] + 1, cells[i][1] - 1) == 0):
#			viz += 1
#			#print("c")
#		if (get_cell(cells[i][0] - 1, cells[i][1]) == 0):
#			viz += 1
#			#print("e")
#		if (get_cell(cells[i][0] - 1, cells[i][1] + 1) == 0):
#			viz += 1
#			#print("f")
#		if (get_cell(cells[i][0], cells[i][1] + 1) == 0):
#			viz += 1
#			#print("g")
#		if (get_cell(cells[i][0] + 1, cells[i][1] + 1) == 0):
#			viz += 1
#			#print("h")
		if (viz <= 1):
			set_cell(cells[i][0], cells[i][1], -1)
			print(viz)
			print(cells[i][0], " ",cells[i][1])
			#print("x")
		elif (viz >= 4):
			set_cell(cells[i][0], cells[i][1], -1)
			print(viz)
			print(cells[i][0], " ",cells[i][1])
			#print("y")
