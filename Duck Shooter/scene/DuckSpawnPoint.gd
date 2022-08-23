extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export(PackedScene) var _duck = preload("res://scene/Duck.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	$DuckSpawnCD.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_DuckSpawnCD_timeout():
	var duck = _duck.instance()
	add_child(duck)
	
	pass # Replace with function body.
