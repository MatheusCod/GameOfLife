extends Node2D

var mouse_position # Mouse position (Vector2)
var status # If the game logic is running or not (Boolean)

func _ready():
	pass

func _process(delta):
	mouse_position = get_viewport().get_mouse_position()
	
	#Adding new cells while the game is pause
	if (Input.is_action_just_pressed("left_mouse") 
		and mouse_position[1] >= 40
		and !$Menu.get_node("Status").pressed):
		
		if(get_node("Game").get_node("TileMap").get_cell(
				int(mouse_position[0]/16),
				int((mouse_position[1] - 40)/16))
				== 0):
			
			get_node("Game").get_node("TileMap").set_cell(
			int(mouse_position[0]/16),
			int((mouse_position[1] - 40)/16),
			-1)
		
		else:
			get_node("Game").get_node("TileMap").set_cell(
			int(mouse_position[0]/16),
			int((mouse_position[1] - 40)/16),
			0)
		
		print(get_node("Game").get_node("TileMap").get_used_cells())
