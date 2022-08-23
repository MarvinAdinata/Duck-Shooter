extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var direction = Vector2(0,0)
var direction_change_time = 0.5
export var speed = 3
export var areaLimitx = 500
export var areaLimity = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	$DuckDirCD.wait_time = direction_change_time
	
	$DuckQuack.play()
	$DuckDirCD.start()
	pass # Replace with function body.
	
func _process(delta):
	position += speed*direction
	position.x = clamp(position.x, 0, areaLimitx)
	position.y = clamp(position.y, 0, areaLimity)
	pass

func _on_DuckDirCD_timeout():
	if direction.y > 0:
		$DuckAnim.flip_h = true
	else:
		$DuckAnim.flip_h = false
	speed = randi()%4
	direction = Vector2(sin(randi()),sin(randi()))
#	print(speed)
#	print(direction)
	pass # Replace with function body.

	
func _on_DuckArea2D_area_entered(area):
	if area.is_in_group("player"):
		queue_free()
	pass # Replace with function body.
