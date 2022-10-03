extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rng = RandomNumberGenerator.new()

export var direction = Vector2(0,0)
var direction_change_time = 1
export var speed = 3
export var areaLimitx = OS.window_size.x
export var areaLimity = OS.window_size.y

# Called when the node enters the scene tree for the first time.
func _ready():
	$DuckDirCD.wait_time = direction_change_time
	
	$DuckQuack.play()
	
	moveDuck()
	
	$DuckDirCD.start()
	
	pass # Replace with function body.
	
func _process(delta):
	position += speed*direction
	position.x = clamp(position.x, 0, areaLimitx)
	position.y = clamp(position.y, 0, areaLimity)
	
	pass

func moveDuck():
	if direction.y > 0:
		$DuckAnim.flip_h = true
	else:
		$DuckAnim.flip_h = false
	speed = randi()%4
	direction = Vector2(sin(randi()),sin(randi()))
	direction_change_time = rng.randf() # Number from 0-1 float (inclusive)
	
	pass

func _on_DuckDirCD_timeout():
	moveDuck()

	pass # Replace with function body.

	
func _on_DuckArea2D_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
	pass # Replace with function body.
