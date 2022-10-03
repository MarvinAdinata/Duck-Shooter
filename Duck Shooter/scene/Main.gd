extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var _duck = preload("res://scene/Duck.tscn")
export(PackedScene) var _duckSpawnPoint = preload("res://scene/DuckSpawnPoint.tscn")
export(PackedScene) var _background = preload("res://scene/Background.tscn")
export(PackedScene) var _backgroundMusic = preload("res://scene/BackgroundMusic.tscn")
export(PackedScene) var _cursor = preload("res://scene/Cursor.tscn")


var duck = _duck.instance()
var background = _background.instance()
var backgroundMusic = _backgroundMusic.instance()
var cursor = _cursor.instance()

func _set_duckSpawnPoint(position:Vector2):
	var duckSpawnPoint = _duckSpawnPoint.instance()
	add_child(duckSpawnPoint)
	duckSpawnPoint.position = position
	duck.position = duckSpawnPoint.position

# Called when the node enters the scene tree for the first time.
func _ready():

	add_child(duck)
	add_child(background)
	add_child(backgroundMusic)
	add_child(cursor)
	
	_set_duckSpawnPoint(Vector2(200,300))
	_set_duckSpawnPoint(Vector2(500,200))
	_set_duckSpawnPoint(Vector2(800,350))
		
#	background.margin_left = 250
#	background.margin_top = 250
#	background.margin_right = 750
#	background.margin_bottom = 750
	
	pass # Replace with function body.
	
func _unhandled_input(event):
	if event is InputEventKey and event.is_pressed():
		if event.scancode == KEY_ESCAPE:
			get_tree().change_scene("res://scene/MainMenu.tscn")
	
	

	
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
