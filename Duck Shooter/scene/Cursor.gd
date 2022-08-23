extends Position2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export(PackedScene) var _gun =preload("res://scene/Gun.tscn")

var can_shot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	position = get_global_mouse_position()
	$ClickProgress.value = 1-$ClickCD.time_left
	
func _input(event):
	if event is InputEventMouseButton and event.is_pressed():
		if event.button_index == BUTTON_LEFT and can_shot == true:
			var gun = _gun.instance()
			add_child(gun)
			can_shot = false
			$ClickCD.start()
			
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_ClickCD_timeout():
	can_shot = true
	$ClickCD.stop()
	pass # Replace with function body.
